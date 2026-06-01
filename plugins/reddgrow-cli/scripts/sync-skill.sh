#!/usr/bin/env bash
# Sync SKILL.md from the published @reddgrow/cli npm package.
# Run this after a new CLI version is published to keep the plugin in sync.
set -euo pipefail

DEST="$(dirname "$0")/../skills/reddgrow/SKILL.md"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

cd "$TMPDIR"
npm pack @reddgrow/cli --quiet
tar -xzf reddgrow-cli-*.tgz package/SKILL.md
cp package/SKILL.md "$DEST"
echo "Synced SKILL.md from $(npm view @reddgrow/cli version) -> $DEST"
