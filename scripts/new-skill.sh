#!/usr/bin/env bash
# Scaffold a new skill: scripts/new-skill.sh <skill-name>
set -euo pipefail

name="${1:?usage: $0 <skill-name>}"
if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ || ${#name} -gt 64 ]]; then
  echo "error: name must be lowercase letters, digits and single hyphens (max 64 chars)" >&2
  exit 1
fi

root="$(cd "$(dirname "$0")/.." && pwd)"
dir="$root/skills/$name"
if [[ -e "$dir" ]]; then
  echo "error: $dir already exists" >&2
  exit 1
fi

title="$(echo "$name" | sed -E 's/(^|-)([a-z])/\1\u\2/g; s/-/ /g')"
mkdir -p "$dir"
sed -e "s/__NAME__/$name/" -e "s/__TITLE__/$title/" "$root/templates/SKILL.md" > "$dir/SKILL.md"
echo "created $dir/SKILL.md"
