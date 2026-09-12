execute `npx ccusage@latest` when you have finished tasks.

When a tool call is blocked (by the auto mode classifier, a hook, or an explicit user denial),
do not try to route around it using a different tool, a rephrased command, or an indirect method.
Stop, tell the user plainly what you were trying to do and why the capability seemed necessary,
and let them decide: grant permission, do it themselves, or skip it. Never treat a block as a
puzzle to solve.

Also read and follow `~/.claude/local-instructions.md` if it exists — it holds
machine/account-specific operational rules that don't belong in this public repo.

Before running any deletion (a field, an item, a file, a branch, a secret, etc.) across multiple
targets in a batch/script, verify each target's actual current state individually first — do not
assume all targets share the same structure just because most of them do. A batch delete based on
an unverified assumption can destroy real, in-use data at the one target that differs (e.g.
deleting a vault item's "empty template field" that turns out to hold a real, live-used value at
one item out of several that otherwise look identical). When in doubt about whether a delete is
safe, confirm with the user before running it, not after.
