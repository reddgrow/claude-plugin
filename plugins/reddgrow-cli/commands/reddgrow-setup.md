---
description: Set up and verify the ReddGrow CLI integration — checks installation, authentication, and reports account status.
argument-hint: (none)
allowed-tools: Bash(reddgrow:*), Bash(npx:*), Bash(which:*), Bash(cat:*)
---

Check whether the `reddgrow` CLI is available and authenticated, then report account status.

Step 1 — Check installation:
!`which reddgrow 2>/dev/null && echo "installed" || echo "not_installed"`

If not installed, instruct the user:
- Install via: `npm install -g @reddgrow/cli`
- Or use npx: `npx @reddgrow/cli@latest <command>`
- Then authenticate: `reddgrow auth login rg_your_api_key_here`
- Get your API key at: https://reddgrow.ai/settings/api

If installed, proceed to Step 2.

Step 2 — Check authentication:
!`reddgrow auth status --mode agent 2>&1`

If not authenticated, check for environment variable:
!`echo ${REDDGROW_API_KEY:+set}`

If neither config nor env var is set, instruct the user to run:
`reddgrow auth login rg_your_api_key_here`

Step 3 — Verify connectivity (only if authenticated):
!`reddgrow auth whoami --mode agent 2>&1`

Report: whether reddgrow is installed, authenticated, and what account/credits are available. If any step fails, provide the exact fix command.
