---
name: commit
description: Stage, commit changes with a descriptive message, and optionally push
---

Follow these steps:

1. Run `git status` and `git diff` to see all changes
2. Run `git log --oneline -5` to understand commit message style
3. Stage relevant changed files (never stage .env or credential files)
4. Generate a concise commit message summarizing the changes
5. Commit with the message, ending with:
   Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
6. After committing, ask the user if they want to push to remote
