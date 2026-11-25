#!/usr/bin/env bash
# Install this skill into ~/.claude/skills/loop-desing/
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
DEST="${DEST:-${HOME}/.claude/skills/loop-desing}"

if [[ ! -f "$ROOT/SKILL.md" ]]; then
  echo "SKILL.md not found next to install.sh" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
# Replace a previous copy of this skill only; refuse to overwrite an unexpected path.
if [[ -e "$DEST" ]]; then
  if [[ ! -f "$DEST/SKILL.md" ]]; then
    echo "Refusing to overwrite $DEST (no SKILL.md there)" >&2
    exit 1
  fi
  rm -rf "$DEST"
fi

mkdir -p "$DEST"
cp -a "$ROOT/SKILL.md" "$DEST/SKILL.md"
cp -a "$ROOT/references" "$DEST/references"
echo "Installed to $DEST"
echo "Open a new Claude Code session (or restart) so the skill is picked up."
echo "Then ask it to design a Loop Spec, or type /loop-desing."
