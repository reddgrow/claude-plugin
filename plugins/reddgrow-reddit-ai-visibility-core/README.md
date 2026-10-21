# Reddit AI Visibility by ReddGrow

AI answers lean on Reddit threads. This plugin shows whether ChatGPT, Gemini, Google AI and Copilot recommend your brand, which Reddit threads they cite, and helps you write the reply or post that puts you in those threads.

## Install

```sh
/plugin install reddgrow-reddit-ai-visibility-core --marketplace reddgrow/claude-plugin
```

## What you get

- **Free AI visibility report** for any website. It takes about 25 minutes and the link is emailed to you.
- **Reddit threads AI cites** in your category, with the engines and sources behind them.
- **Draft Reddit replies** to a post you paste in, ranked and scored against how similar real comments performed.
- **Draft Reddit posts** for a subreddit and topic, ranked the same way.
- **Brand tracking** (needs a ReddGrow account with data): visibility over time, brand ranking, cited domains, citations and Reddit mentions.

## Skills

- `ai-visibility-report`
- `draft-reddit-reply`
- `draft-reddit-post`

## Connector

The plugin connects to one remote MCP server, `https://mcp.reddgrow.ai/core/mcp`. You sign in with your ReddGrow account through OAuth the first time a tool runs.

## What it sends

- The website domain, brand name, subreddit, topic or Reddit post text you give Claude, sent to ReddGrow to run the report or write the drafts.
- Nothing else. It reads no local files, runs no scripts and uses no other service.

ReddGrow keeps report and account data under its [privacy policy](https://reddgrow.ai/legal/privacy-policy). Terms: [terms of use](https://reddgrow.ai/legal/terms-of-use).

## Safety

Drafts are only written. Nothing is ever posted to Reddit for you, and the plugin does not fetch Reddit links; paste the post text instead.

## Support

contact@help.reddgrow.ai or https://reddgrow.ai/help-center

## License

MIT
