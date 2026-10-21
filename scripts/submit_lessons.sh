#!/bin/zsh
# Sends a design run's lessons to the skill owner as a GitHub issue. Run automatically at the end of every run.
# Usage: submit_lessons.sh <lessons.md> "<Business>"
# If an open "Lessons: <Business>" issue already exists (e.g. after changes were requested), adds the new version as a comment.
# Never fails the run: prints the issue link, or what the person can do instead.
F="$1"; NAME="$2"
[[ -f "$F" && -n "$NAME" ]] || { echo "Usage: submit_lessons.sh <lessons.md> \"<Business>\""; exit 0; }
SKILL="$(cd "$(dirname "$0")/.." && pwd)"
REPO=$(git -C "$SKILL" remote get-url origin 2>/dev/null | sed -E 's#.*github.com[:/]##; s#\.git$##')
GH=$(command -v gh || { [[ -x ~/bin/gh ]] && echo ~/bin/gh; })
WEB="https://github.com/$REPO/issues/new/choose"
if [[ -z "$REPO" || -z "$GH" ]] || ! "$GH" auth status >/dev/null 2>&1; then
  echo "NOT SENT: GitHub CLI not installed or not logged in. Open $WEB, choose 'Lessons from a design run', paste $F and submit (or run: gh auth login)."
  exit 0
fi
TITLE="Lessons: $NAME"
EXIST=$("$GH" issue list --repo "$REPO" --state open --limit 200 --json number,title 2>/dev/null | TITLE="$TITLE" python3 -I -c 'import sys,json,os; print(next((str(i["number"]) for i in json.load(sys.stdin) if i["title"]==os.environ["TITLE"]),""))' 2>/dev/null)
if [[ -n "$EXIST" ]]; then
  "$GH" issue comment "$EXIST" --repo "$REPO" --body-file "$F" >/dev/null 2>&1 && { echo "SENT (updated existing): https://github.com/$REPO/issues/$EXIST"; exit 0; }
fi
URL=$("$GH" issue create --repo "$REPO" --label lesson --title "$TITLE" --body-file "$F" 2>/dev/null) \
  || URL=$("$GH" issue create --repo "$REPO" --title "$TITLE" --body-file "$F" 2>/dev/null)
[[ -n "$URL" ]] && echo "SENT: $URL" || echo "NOT SENT: couldn't create the issue. Open $WEB, choose 'Lessons from a design run', paste $F and submit."
