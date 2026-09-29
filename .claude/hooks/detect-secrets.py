#!/usr/bin/env python3
"""PostToolUse(Bash) hook: warn when a command's stdout/stderr looks like it
contains a leaked credential (1Password op read output, API tokens, private
keys, etc). This is a detection/warning net, not prevention — by the time it
runs, the output is already in the model's context. It exists so a slip like
`echo`-ing an `op read` result or a curl response gets flagged consistently
instead of relying on memory alone.
"""
import json
import re
import sys

PATTERNS = [
    r"ops_[A-Za-z0-9+/=]{20,}",  # 1Password service account token
    r"PVEAPIToken=\S+",  # Proxmox API token header value
    r"AKIA[0-9A-Z]{16}",  # AWS access key id
    r"-----BEGIN [A-Z ]*PRIVATE KEY-----",
    r"\bBearer [A-Za-z0-9\-_.]{20,}\b",
    r"\bxox[baprs]-[A-Za-z0-9-]{10,}\b",  # Slack tokens
    r"\bghp_[A-Za-z0-9]{36}\b",  # GitHub PAT (classic)
    r"\bgithub_pat_[A-Za-z0-9_]{20,}\b",  # GitHub PAT (fine-grained)
    r"\bsk-[A-Za-z0-9]{20,}\b",  # generic sk- style API keys
]


def main() -> int:
    try:
        data = json.load(sys.stdin)
    except Exception:
        return 0

    resp = data.get("tool_response", {})
    if isinstance(resp, dict):
        text = str(resp.get("stdout", "")) + "\n" + str(resp.get("stderr", ""))
    else:
        text = str(resp)

    hits = [p for p in PATTERNS if re.search(p, text)]
    if not hits:
        return 0

    out = {
        "systemMessage": (
            "Bash output matched a known secret pattern — treat the last "
            "command's output as sensitive."
        ),
        "hookSpecificOutput": {
            "hookEventName": "PostToolUse",
            "additionalContext": (
                "SECURITY WARNING: the last Bash command's output matched a "
                "known secret/credential pattern. Do not repeat, echo, or "
                "quote that value again in any future message or command. "
                "If a real credential was exposed, tell the user now and "
                "recommend rotating it."
            ),
        },
    }
    print(json.dumps(out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
