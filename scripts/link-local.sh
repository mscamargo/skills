#!/usr/bin/env bash
# Symlink every skill in this repo into ~/.claude/skills for local development.
# Skills already present there with the same name are left untouched.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
target="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$target"

for dir in "$root"/skills/*/; do
  name="$(basename "$dir")"
  if [[ -e "$target/$name" && ! -L "$target/$name" ]]; then
    echo "skip $name: $target/$name exists and is not a symlink"
    continue
  fi
  ln -sfn "${dir%/}" "$target/$name"
  echo "linked $name"
done
