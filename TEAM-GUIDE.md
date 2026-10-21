# Homepage Redesign skill: team guide (Sites n Stores)

## What you need
- A free GitHub account, invited to the TheSTG-Drew organisation and added to the "Homepage Redesign Users" team (read-only access to this skill)
- A Mac with Google Chrome and Python 3
- Claude Code or OpenAI Codex

## One-time setup (about 5 minutes)
1. Install the GitHub CLI and log in: `gh auth login` (follow the browser prompt).
2. Download the skill so it works in every project:
   - Claude Code: `gh repo clone TheSTG-Drew/homepage-redesign ~/.claude/skills/homepage-redesign`
   - Codex: `mkdir -p ~/.agents/skills && ln -s ~/.claude/skills/homepage-redesign ~/.agents/skills/homepage-redesign`
   (Or ask your assistant: "install the homepage-redesign skill from TheSTG-Drew".)

## Every redesign
1. Open Claude Code or Codex in a folder for your client work.
2. Type `/homepage-redesign example.com.au` (Claude Code) or `$homepage-redesign example.com.au` (Codex).
3. Check the design with the approval checklist; approve it, ask for changes, or ask for a different design.
4. Nothing else to do: at the end the skill automatically sends what it learned to Sites n Stores, so the skill gets better for everyone. (This needs the GitHub CLI logged in from setup step 1. If it can't send, it tells you how to paste the lessons into the GitHub website instead.)

## Keep it up to date
Nothing to do. The skill checks for a new version every time you run it and updates itself. (You can still say **"update the skill"** to check any time.)

## You can't change the skill directly
Your access is read-only. Improvements reach the skill through the lessons it sends automatically, after the skill owner reviews them.
