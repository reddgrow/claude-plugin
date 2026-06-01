---
description: Spin up a new ReddGrow Reddit campaign — creates campaign, adds target subreddits, creates an advocate, and shows pending drafts.
argument-hint: <product-name> <url>
allowed-tools: Bash(reddgrow:*), Bash(npx:*)
---

Create a full ReddGrow campaign setup for: $ARGUMENTS

Parse $ARGUMENTS as: first word = product name, second = URL. If URL is missing, ask the user for it before proceeding.

Use `--mode agent` on all commands for clean JSON output.

Step 1 — Create the campaign:
!`reddgrow campaigns create --name "$1" --url "$2" --mode agent`

Extract `id` from the result as CAMPAIGN_ID.

Step 2 — Research target subreddits (ask user for topic if not obvious from the product name):
!`reddgrow reddit subreddits search "$1" --mode agent`

Show the user the top 5 results (name, subscriber count, description) and ask which ones to add.

Step 3 — Add chosen subreddits:
For each chosen subreddit name:
!`reddgrow subreddits quick-add <name> --campaign <CAMPAIGN_ID> --mode agent`

Step 4 — Create a default advocate:
!`reddgrow advocates create --name "Assistant" --role user --tone helpful --campaign-id <CAMPAIGN_ID> --daily-drafts 3 --mode agent`

Step 5 — Check for initial drafts:
!`reddgrow drafts list --status pending --campaign <CAMPAIGN_ID> --mode agent`

Report a summary: campaign ID, subreddits added, advocate created, number of pending drafts.
