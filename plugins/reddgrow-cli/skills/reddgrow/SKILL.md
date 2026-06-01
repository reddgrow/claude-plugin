---
name: reddgrow
version: 1.2.0
description: "This skill should be used when the user asks to manage Reddit campaigns, subreddits, advocates, or drafts; monitor brand mentions on Reddit; check AI visibility or AEO scores; look up Reddit subreddit, post, user, or domain data; or run any reddgrow CLI command."
metadata: {"openclaw":{"emoji":"🔴","homepage":"https://reddgrow.ai","requires":{"bins":["reddgrow"],"env":["REDDGROW_API_KEY"]},"install":[{"id":"npm","kind":"node","package":"@reddgrow/cli","bins":["reddgrow"],"label":"Install via npm"}],"primaryEnv":"REDDGROW_API_KEY"}}
---

# ReddGrow CLI

Full account management + Reddit intelligence for AI agents. All commands output JSON to stdout. Errors go to stderr with exit code 1.

## Setup

```bash
# Install
npm install -g @reddgrow/cli

# Authenticate (one-time)
reddgrow auth login rg_your_api_key_here

# Or use environment variable
export REDDGROW_API_KEY=rg_your_api_key_here
```

Install this skill into Claude Code: `npx @reddgrow/cli skill install`

## Commands

### Campaigns

```bash
reddgrow campaigns list [--limit N] [--offset N]
reddgrow campaigns get <id>
reddgrow campaigns create --name <s> --url <s> [--mention-as <s>] [--description <s>] [--use-cases <s...>] [--talking-points <s...>] [--json '{...}'] [--json-file path.json]
reddgrow campaigns update <id> [same flags as create] [--json '{...}'] [--json-file path.json]
reddgrow campaigns delete <id>
```

### Subreddits (tracked)

```bash
reddgrow subreddits list [--limit N] [--offset N]
reddgrow subreddits get <id>
reddgrow subreddits quick-add <name> [--campaign <id>]   # name accepts r/foo or foo
reddgrow subreddits create --name <s> [--tier N] [--category <s>] [--campaign <id>] [--active|--no-active] [--keywords <s...>] [--json '{...}']
reddgrow subreddits update <id> [--name <s>] [--tier N] [--category <s>] [--keywords <s...>] [--json '{...}']
reddgrow subreddits toggle <id> [--active|--no-active]
reddgrow subreddits delete <id>
```

### Advocates

```bash
reddgrow advocates list [--limit N] [--offset N]
reddgrow advocates get <id>
reddgrow advocates create --name <s> --role user|employee --tone <s> [--campaign-id <id>] [--reddit-account-id <id>] [--daily-drafts N] [--employee-position <s>] [--custom-instructions <s>] [--json '{...}']
reddgrow advocates update <id> [same flags as create] [--json '{...}']
reddgrow advocates delete <id>
```

### Brand Monitor

```bash
# Domains
reddgrow brand-monitor domains list [--limit N] [--offset N]
reddgrow brand-monitor domains get <id>
reddgrow brand-monitor domains add --domain <s> [--label <s>] [--primary] [--brand-description <s>] [--search-keywords <s...>] [--negative-keywords <s...>] [--json '{...}']
reddgrow brand-monitor domains update <id> [--label <s>] [--brand-description <s>] [--search-keywords <s...>] [--negative-keywords <s...>] [--active|--no-active] [--json '{...}']
reddgrow brand-monitor domains remove <id>

# Mentions
reddgrow brand-monitor mentions list [--domain <id>] [--subreddit <name>] [--sentiment positive|neutral|negative|mixed] [--status new|read|handled|ignored] [--intent <csv>] [--red-flags <csv>] [--from <ISO>] [--to <ISO>] [--limit N] [--offset N]
reddgrow brand-monitor mentions get <id>
reddgrow brand-monitor mentions update <id> [--status <s>] [--sentiment <s>]

# Stats
reddgrow brand-monitor stats [--domain <id>] [--days N]
```

Alias: `bm` → `brand-monitor`

### Drafts

```bash
reddgrow drafts list [--status pending|approved|posted|skipped] [--type promotional|warmup|moderator|brand_monitor|aeo_citation|reply] [--campaign <id>] [--advocate <id>] [--after <ISO>] [--before <ISO>] [--sort-by created_at|relevance_score|post_date] [--sort-order asc|desc] [--limit N] [--offset N]
reddgrow drafts get <id>
reddgrow drafts approve <id>
reddgrow drafts skip <id>
```

### Stats

```bash
reddgrow stats summary           # total campaigns + draft dashboard
reddgrow stats daily [--days N]  # daily draft volume time series (default 30 days)
reddgrow stats dashboard         # draft pipeline counts by status
reddgrow stats posting [--timezone <tz>] [--reddit-account <id>]
```

### Health

```bash
reddgrow health ping   # verify API connectivity and authentication
```

### AEO

```bash
# Account
reddgrow aeo me                           # API key metadata and prompt usage

# Reference
reddgrow aeo engines                      # List supported AI engines
reddgrow aeo countries                    # List supported country codes
reddgrow aeo score-methodology            # Scoring methodology docs

# Prompts
reddgrow aeo prompts list [--brand <id>] [--topic <id>] [--engine <e>] [--country <c>] [--from <ISO>] [--to <ISO>]
reddgrow aeo prompts get <id>
reddgrow aeo prompts create --query <q> [--brand <id>] [--topic <id>] [--countries <c...>] [--category <s>] [--tags <t...>] [--json '{...}']
reddgrow aeo prompts batch --json '{"prompts":[...]}' | --json-file path.json
reddgrow aeo prompts batch-status <jobId>
reddgrow aeo prompts update <id> [--query <q>] [--category <s>] [--tags <t...>] [--json '{...}']
reddgrow aeo prompts delete <id>
reddgrow aeo prompts runs <id> [--engine <e>] [--country <c>] [--from <ISO>] [--to <ISO>] [--limit N] [--offset N]

# Runs
reddgrow aeo runs get <scan_result_id>
reddgrow aeo runs explain <scan_result_id>

# Visibility
reddgrow aeo visibility timeline [--brand <id>] [--country <c>] [--days N]
reddgrow aeo visibility explain --brand <id> [--topic <id>] [--engine <e>] [--country <c>] [--from <ISO>] [--to <ISO>]

# Brands
reddgrow aeo brands list
reddgrow aeo brands ranking [--brand <id>] [--topic <id>] [--engine <e>] [--country <c>] [--from <ISO>] [--to <ISO>]
reddgrow aeo brands create --name <s> [--domain <s>] [--json '{...}']
reddgrow aeo brands update <id> [--name <s>] [--domain <s>] [--json '{...}']
reddgrow aeo brands delete <id>

# Topics
reddgrow aeo topics list [--brand <id>]
reddgrow aeo topics create --name <s> [--brand <id>] [--color <s>] [--json '{...}']
reddgrow aeo topics batch --json '{"brand_id":N,"topics":["..."]}' | --json-file path.json
reddgrow aeo topics update <id> [--name <s>] [--color <s>] [--json '{...}']
reddgrow aeo topics delete <id>

# Sources
reddgrow aeo sources domains [--brand <id>] [--from <ISO>] [--to <ISO>] [--engine <e>] [--country <c>] [--domain-type <t>] [--limit N] [--offset N]
reddgrow aeo sources urls [--from <ISO>] [--to <ISO>] [--engine <e>] [--country <c>] [--domain-type <t>] [--limit N] [--offset N]
reddgrow aeo sources top-domains [--brand <id>] [--from <ISO>] [--to <ISO>] [--engine <e>] [--country <c>] [--limit N]
reddgrow aeo sources domain-types [--brand <id>] [--from <ISO>] [--to <ISO>] [--engine <e>] [--country <c>]
reddgrow aeo sources detail --scope <domain|url|query> --target <t> [--engine <e>] [--country <c>] [--from <ISO>] [--to <ISO>] [--query-id <id>] [--page N] [--page-size N]

# Citations
reddgrow aeo citations list [--brand <id>] [--from <ISO>] [--to <ISO>] [--engine <e>] [--country <c>] [--domain <s>] [--domain-type <t>] [--query-id <id>] [--limit N] [--offset N]

# Sentiment
reddgrow aeo sentiment explain --brand <id> [--topic <id>] [--engine <e>] [--country <c>] [--from <ISO>] [--to <ISO>]
```

> Pro plan required for AEO commands.

### Auth

```bash
reddgrow auth login <key>   # save API key (run once)
reddgrow auth whoami        # identity & credits remaining
reddgrow auth status        # connection status (no API call)
reddgrow auth logout        # remove saved API key
```

### Skill

```bash
reddgrow skill install [--project] [--force]   # install SKILL.md into ~/.claude/skills/reddgrow/
reddgrow skill uninstall [--project]            # remove installed skill
reddgrow skill path [--project]                 # print install path
```

### Reddit Intelligence (read-only)

```bash
# Subreddits
reddgrow reddit subreddits search "<query>"
reddgrow reddit subreddits about <name>
reddgrow reddit subreddits rules <name>
reddgrow reddit subreddits wiki <name>
reddgrow reddit subreddits wiki-page <name> <page>
reddgrow reddit subreddits posts <name> [--sort hot|new|top|rising|controversial] [--time hour|day|week|month|year|all] [--limit N]
reddgrow reddit subreddits comments <name> [--limit N]
reddgrow reddit subreddits check-url <name> "<url>"
reddgrow reddit subreddits traffic <name>
reddgrow reddit subreddits widgets <name>

# Posts
reddgrow reddit posts search "<query>" [--limit N]
reddgrow reddit posts comments <subreddit> <post_id> [--limit N]
reddgrow reddit posts duplicates <subreddit> <post_id>
reddgrow reddit posts batch <id1> <id2> ...

# Users
reddgrow reddit users profile <username>
reddgrow reddit users posts <username> [--limit N]
reddgrow reddit users comments <username> [--limit N]

# Domains (Reddit link search)
reddgrow reddit domains mentions <domain> [--limit N]
```

## Workflows

### Spin up a campaign from scratch

1. Create campaign: `reddgrow campaigns create --name "Product Launch" --url "https://example.com" --mention-as "a productivity tool"`
2. Add target subreddits: `reddgrow subreddits quick-add r/productivity --campaign <campaign-id>`
3. Create an advocate: `reddgrow advocates create --name "Alex" --role employee --tone friendly --campaign-id <campaign-id> --daily-drafts 3`
4. Check drafts after first run: `reddgrow drafts list --status pending --campaign <campaign-id>`
5. Approve a draft: `reddgrow drafts approve <draft-id>`

### Approve all pending drafts

1. List pending: `reddgrow drafts list --status pending --limit 100`
2. For each `id` in response: `reddgrow drafts approve <id>`
3. Verify: `reddgrow stats dashboard`

### Investigate a brand mention

1. List recent mentions: `reddgrow brand-monitor mentions list --status new --limit 20`
2. Read full mention: `reddgrow brand-monitor mentions get <id>`
3. Read the Reddit thread: `reddgrow reddit posts comments <subreddit> <post_id> --limit 50`
4. Mark handled: `reddgrow brand-monitor mentions update <id> --status handled`

### Before posting to a subreddit

1. Read rules: `reddgrow reddit subreddits rules <name>` — rule violations get posts removed instantly
2. Check community type: `reddgrow reddit subreddits about <name>` — if `subreddit_type` is `restricted` or `private`, stop
3. Check URL not already submitted: `reddgrow reddit subreddits check-url <name> "<url>"`
4. Read wiki for extra guidelines: `reddgrow reddit subreddits wiki-page <name> index`

### Research a subreddit for a campaign

1. Find communities: `reddgrow reddit subreddits search "<topic>"`
2. Inspect details: `reddgrow reddit subreddits about <name>`
3. Browse content: `reddgrow reddit subreddits posts <name> --sort top --time week --limit 50`
4. Add to tracking: `reddgrow subreddits quick-add <name> --campaign <campaign-id>`

### Monitor a domain / brand

1. Add domain: `reddgrow brand-monitor domains add --domain example.com --label "My Brand"`
2. Discover mentions: `reddgrow brand-monitor mentions list --domain <id> --limit 100`
3. Check stats: `reddgrow brand-monitor stats --domain <id> --days 7`

## Write input: `--json` and `--json-file`

All create/update commands accept `--json` or `--json-file` for full-body input. These merge over and override individual flag values:

```bash
reddgrow campaigns create --json '{"name":"Test","url":"https://x.com","use_cases":["SEO","Growth"]}'
reddgrow advocates create --json-file advocate.json
```

## Rules

1. ALWAYS run `reddgrow reddit subreddits rules <name>` before posting — rule violations get posts removed
2. ALWAYS run `reddgrow reddit subreddits check-url <name> "<url>"` before sharing any link — duplicate posts are banned
3. ALWAYS check `reddgrow auth whoami` before large batch operations to avoid credit exhaustion
4. Use `--mode agent` (or set `REDDGROW_MODE=agent`) when piping output — removes ANSI color codes and spinner
5. `reddgrow subreddits` = your org's tracked subreddits (CRUD). `reddgrow reddit subreddits` = live Reddit data (read-only)

## Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `REDDGROW_API_KEY` | API key (overrides saved key) | — |
| `REDDGROW_API_URL` | API base URL | `https://api.reddgrow.ai` |
| `REDDGROW_MODE` | Output mode (`human` or `agent`) | `human` |
