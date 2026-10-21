---
name: ai-visibility-report
description: Show whether AI answer engines (ChatGPT, Gemini, Google AI, Copilot) recommend a brand, which Reddit threads they cite, and where competitors win, even with no ReddGrow setup. Use for AI visibility, share of voice, citations, and "why does AI recommend my competitor" questions.
---

# AI visibility, won through Reddit

AI answers lean on Reddit threads. The goal: find the threads AI cites for the user's category, then write the reply that puts their brand in them.

## Start here: the free report (no setup)

1. Call `get_ai_visibility_report`.
2. `ready`: present it (see "Present the report" below).
3. `processing`: tell the user it is about `minutesLeft` minutes away and the link will also be emailed to `emailedTo`. Ask them to check back, then call `get_ai_visibility_report` again.
4. `failed`: say the scan did not finish and offer to run it again with a different domain.
5. `none`: ask for the website (default: the domain of the user's work email; a free-mail user must give one) and, optionally, up to 5 competitors. Confirm the domain, then call `run_ai_visibility_report`. Say: "This takes about 25 minutes. Ask me again later, or we will email the link to <email>."

Do not run a second report for a domain that already has one; `run_ai_visibility_report` returns the existing report.

## Present the report

Lead with the Reddit threads, because they are what the user can act on:
1. `redditThreadsAiCites`: the threads AI engines cite. Name which engines cite them.
2. `questionsWhereCompetitorsWin`: buyer questions where AI named competitors instead.
3. `competitorShareOfVoice`, `visibilityPct`, `topCitedDomains`, then `verdict`.
4. Give the `reportUrl` for the full report.
5. Next step: pick a cited thread, ask the user to paste the post text, and use the draft-reddit-reply skill.

## Users who already track a brand in ReddGrow

These tools read the account, read-only. Use them when the report tools say a report already exists or the user asks for trends.

| Question | Tool |
|---|---|
| Is visibility going up or down? | `aeo_visibility_timeline` (days, or from and to) |
| How does the brand rank against competitors? | `aeo_brand_ranking` |
| Which sites do AI engines cite? | `aeo_source_domains` |
| Which Reddit threads do AI engines cite? | `aeo_list_citations` |
| Where is the brand mentioned on Reddit? | `list_brand_mentions` |
| Mention counts and sentiment | `get_brand_monitor_stats` |
| Saved comment drafts and status | `list_drafts` |

Rules:
- Report only numbers the tools returned. If an account tool returns nothing, the user has no tracked brand yet: offer the free report instead of saying there is no data.
- Filter with `engine`, `country`, `brand_id` only when the user asks.
- Do not state how often AI engines cite Reddit overall. Only report what the report returned.
