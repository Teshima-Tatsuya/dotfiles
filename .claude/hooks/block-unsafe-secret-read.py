#!/usr/bin/env python3
"""PreToolUse(Bash) hook: block command shapes that are likely to print a
1Password secret (or another known-sensitive env var) directly to stdout
instead of capturing it into a variable.

This blocks BEFORE the command runs, so it can actually prevent a leak —
unlike the PostToolUse detect-secrets.py hook, which only warns after the
fact. It cannot catch every shape (e.g. a value safely captured into a
variable and then mishandled by a later command), but it closes the two
concrete failure modes hit in practice: a bare `op read`/`op item get
--reveal` whose own stdout becomes the tool output, and a bare `env`/
`printenv` dump that echoes an exported secret.
"""
import json
import re
import sys


def is_captured(command: str, call_start: int) -> bool:
    """True if the character just before call_start opens a $() or `` `` `
    command substitution — i.e. the call's output is being captured into a
    variable/string rather than printed directly as the tool's own stdout.
    """
    prefix = command[:call_start]
    # Walk backward from call_start to see whether we're inside $( ... ) or `...`
    return bool(re.search(r"\$\([^)]*$", prefix)) or prefix.rstrip().endswith("`")


def main() -> int:
    try:
        data = json.load(sys.stdin)
    except Exception:
        return 0

    command = str(data.get("tool_input", {}).get("command", ""))
    if not command:
        return 0

    reasons = []

    for m in re.finditer(r"\bop\s+read\b", command):
        if not is_captured(command, m.start()):
            reasons.append(
                "`op read` must be captured into a variable, e.g. "
                'VAR=$(op read "op://...") — never run it bare, its stdout '
                "becomes the tool output and gets displayed."
            )
            break

    for m in re.finditer(r"\bop\s+item\s+get\b[^|;&\n]*", command):
        segment = m.group(0)
        if re.search(r"--reveal\b|--format\s+json\b", segment) and not is_captured(
            command, m.start()
        ):
            reasons.append(
                "`op item get ... --reveal`/`--format json` can print "
                "concealed field values in full. Capture into a variable, "
                "or drop --reveal/--format json and use `op read` for the "
                "one field you actually need."
            )
            break

    # printenv always prints a value (all vars, or the ones named) — block
    # unconditionally. env/set are also blocked, but only their bare form
    # (no args): `env VAR=x cmd` is the common, safe prefixing idiom.
    if re.search(r"\bprintenv\b", command) or re.search(
        r"(^|[;&|]\s*)(env|set)\s*($|[;&|>])", command
    ):
        reasons.append(
            "`printenv`/bare `env`/`set` can print secret-holding "
            "environment variables (e.g. OP_SERVICE_ACCOUNT_TOKEN) to "
            "stdout. Check presence without printing the value instead, "
            'e.g. `[ -n "$VAR" ] && echo set || echo unset`.'
        )

    if not reasons:
        return 0

    out = {
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": " ".join(reasons),
        }
    }
    print(json.dumps(out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
