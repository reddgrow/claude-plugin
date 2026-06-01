---
description: Triage new ReddGrow brand mentions — lists unread mentions, reads each thread, and marks them handled.
argument-hint: [domain-id]
allowed-tools: Bash(reddgrow:*), Bash(npx:*)
---

Triage new brand mentions on Reddit. Domain filter (optional): $ARGUMENTS

Use `--mode agent` on all commands for clean JSON output.

Step 1 — List new mentions:
!`reddgrow brand-monitor mentions list --status new --limit 20 $([[ -n "$ARGUMENTS" ]] && echo "--domain $ARGUMENTS") --mode agent`

If no mentions, report "No new mentions." and stop.

Step 2 — For each mention, read the full mention and its Reddit thread:
!`reddgrow brand-monitor mentions get <id> --mode agent`
!`reddgrow reddit posts comments <subreddit> <post_id> --limit 30 --mode agent`

Step 3 — Summarise each mention: sentiment, key points raised, suggested response action (reply / ignore / escalate).

Step 4 — Mark each reviewed mention as handled:
!`reddgrow brand-monitor mentions update <id> --status handled --mode agent`

Report: total mentions triaged, sentiment breakdown, any mentions flagged for escalation.
