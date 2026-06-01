#!/usr/bin/env bash
# Sync SKILL.md from the published @reddgrow/cli npm package.
# Run this after a new CLI version is published to keep the plugin in sync.
set -euo pipefail

DEST="$(dirname "$0")/../skills/reddgrow/SKILL.md"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

cd "$TMPDIR"
npm pack @reddgrow/cli --quiet
TARBALL="$(ls reddgrow-cli-*.tgz)"
VERSION="${TARBALL#reddgrow-cli-}"; VERSION="${VERSION%.tgz}"
tar -xzf "$TARBALL" package/SKILL.md
cp package/SKILL.md "$DEST"
echo "Synced SKILL.md from v${VERSION} -> $DEST"
