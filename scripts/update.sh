#!/bin/zsh
# Brings this skill up to date from GitHub. Run automatically at the start of every run.
# Prints one line: "UPDATED …" (re-read SKILL.md), "Up to date", or why it couldn't check. Never fails the run.
SKILL="$(cd "$(dirname "$0")/.." && pwd)"
git -C "$SKILL" rev-parse --git-dir >/dev/null 2>&1 || { echo "Skill isn't a git copy; can't auto-update"; exit 0; }
OLD=$(git -C "$SKILL" rev-parse HEAD)
OUT=$(GIT_TERMINAL_PROMPT=0 perl -e 'alarm 20; exec @ARGV' git -C "$SKILL" pull --ff-only -q 2>&1) || { echo "Couldn't update the skill (offline or local edits): ${OUT//$'\n'/ }. Continuing with the current version."; exit 0; }
NEW=$(git -C "$SKILL" rev-parse HEAD)
if [[ "$OLD" != "$NEW" ]]; then
  echo "UPDATED to the latest skill. Re-read SKILL.md before continuing. Changes:"
  git -C "$SKILL" log --oneline "$OLD..$NEW"
else
  echo "Up to date ($(git -C "$SKILL" log -1 --format='%h %s'))"
fi
