# ReddGrow Claude Plugin

Claude Code plugin and skill for the [ReddGrow](https://reddgrow.ai) platform — manage Reddit campaigns, advocates, brand monitoring, AEO visibility, and Reddit intelligence directly from Claude.

## Install (Claude Code native)

```sh
/plugin marketplace add reddgrow/claude-plugin
/plugin install reddgrow-cli@reddgrow
```

## Install (npx skill only)

```sh
npx @reddgrow/cli skill install
```

## Prerequisites

- Node.js 18+
- A ReddGrow account and API key — get one at [reddgrow.ai](https://reddgrow.ai)
- Authenticate: `reddgrow auth login rg_your_api_key_here`

## What's included

| Item | Description |
|------|-------------|
| `skills/reddgrow` | Full CLI reference — commands, workflows, rules. Auto-activates when you ask about Reddit campaigns, drafts, brand monitoring, or AEO. |
| `/reddgrow-setup` | Check CLI installation and auth, report account + credits. |
| `/reddgrow-campaign <name> <url>` | Spin up a campaign end-to-end: create, add subreddits, create advocate. |
| `/reddgrow-monitor [domain-id]` | Triage new brand mentions: read threads, summarise, mark handled. |

## Keeping the skill in sync

The skill is a copy of the SKILL.md bundled in `@reddgrow/cli`. After a new CLI release, run:

```sh
./plugins/reddgrow-cli/scripts/sync-skill.sh
```

Then commit and push to update the plugin for all users.

## CLI reference

See the full command reference in [plugins/reddgrow-cli/skills/reddgrow/SKILL.md](./plugins/reddgrow-cli/skills/reddgrow/SKILL.md) or run:

```sh
reddgrow --help
```
