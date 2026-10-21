# Learning loop: how the skill gets better with every design

Team members use the skill but can't change it. Every design produces lessons; team members submit them; the owner reviews and merges them into a new version; everyone updates.

```
design run → lessons.md → sent automatically → GitHub Issue (label: lesson)
→ owner: "review the skill suggestions" → approved changes → new skill version
→ team: "update the skill"
```

All commands use `git` and the GitHub CLI `gh` (the person must be logged in: `gh auth login`). Find `gh` with `command -v gh || ls ~/bin/gh`. Work out the repository from the skill folder itself: `git -C <skill folder> remote get-url origin` (e.g. `TheSTG-Drew/homepage-redesign`), so these steps keep working if the repository moves.

## lessons.md template (written at the end of every run)

```
# Lessons: <Business> (<domain>), <date>
Run by: <person, if known> · Industry: <industry> · Site platform: <Wix / Squarespace / WordPress / custom / unknown>
Final score: <average> · Approved: <yes / changes requested / different design requested>

## What the reviewer changed (and why)
- <e.g. "Buttons too similar → made each section's CTA specific">

## Problems found and how they were fixed
- <e.g. "Logo had big white padding → cropped tight before use">

## Lessons for future runs (reusable rules)
- <one rule per line, phrased as an instruction>

## Industry notes
- <what this industry's buyers care about, rules (e.g. Ahpra), language>

## Tool issues
- <script errors, screenshots cut off, etc.>
```

## "submit my lessons" (anyone)

Lessons are now sent automatically at the end of every run (SKILL.md step 11). Use this command only to send again, or to send lessons from an earlier run.

1. Find the most recent `clients/*/lessons.md` (or the one the person names).
2. Run `scripts/submit_lessons.sh <lessons.md> "<Business>"`. It creates the "Lessons: <Business>" issue (labelled `lesson` when the person is allowed to set labels), or adds a comment if one is already open.
3. If it prints NOT SENT, tell the person what it says: open `https://github.com/<owner/repo>/issues/new/choose`, pick **Lessons from a design run**, paste `lessons.md` and click **Submit**.
4. Confirm with the issue link. Never edit the skill files.

## "update the skill" (anyone)

The skill now updates itself at the start of every run (`scripts/update.sh`, step 0 in SKILL.md), so this command is only needed to force a check.

1. Run `scripts/update.sh` (or `git -C <skill folder> pull --ff-only`).
2. If there are local edits blocking the update, don't discard them: tell the person and ask what to do.
3. Report the new version: `git -C <skill folder> log --oneline -3`.

## "review the skill suggestions" (owner / maintainers only)

1. Check the person can change the skill: `gh repo view <owner/repo> --json viewerPermission -q .viewerPermission` must be `ADMIN`, `MAINTAIN` or `WRITE`. If not, explain that only the skill owner can do this.
2. `git -C <skill folder> pull --ff-only`, then list open suggestions: `gh issue list --repo <owner/repo> --state open --search "lesson in:title OR label:lesson" --json number,title,body`.
3. Read them all. Group duplicates, and ignore one-off or client-specific notes. Show the owner a short numbered list of proposed changes: each one a plain-English sentence, which file it goes in, and which issues it came from.
4. Apply only what the owner approves. Put each rule in the right place: design rules and lessons in `design-quality.md`, buttons/flows in `cro-playbook.md`, copy/industry in `content-strategy.md`, process in `SKILL.md`, handover/Loom in `handover-and-loom.md`, tool fixes in `scripts/`. Add a line to `coverage.md`.
5. Run the compatibility checks in `README.md` ("Maintaining the skill"): the skill must still work in both Claude Code and OpenAI Codex.
6. Commit with a message listing the changes and `Closes #<n>` for each used issue, then `git push`. Close any skipped issues with a short comment.
7. Tell the owner what changed. Everyone with access gets it automatically the next time they run the skill.
