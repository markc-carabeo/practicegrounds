# homepage-redesign (Sites n Stores)

A skill that builds ONE conversion-focused homepage redesign for a cold-email prospect from their domain, plus the Before & After image, Sales Handover PDF and Loom script PDF.

Written in the open **Agent Skills** format, so the same folder works in **Claude Code** and **OpenAI Codex**.

## Requirements
A Mac with Google Chrome and Python 3 (used for screenshots, the Before & After image, logo colours and PDFs).

## Claude Code
1. Put this folder at `.claude/skills/homepage-redesign/` in a project (or `~/.claude/skills/homepage-redesign/` for all projects).
2. Open Claude Code in that project and type `/homepage-redesign example.com.au`.

## OpenAI Codex
1. Put this folder at `.agents/skills/homepage-redesign/` in a project (or `~/.agents/skills/homepage-redesign/` for all projects).
2. Open Codex in that project and type `$homepage-redesign example.com.au` (or just ask for a homepage redesign of a domain).
3. `agents/openai.yaml` holds the Codex/ChatGPT display settings.

## ChatGPT
Skills appear in the ChatGPT desktop app's Skills panel. The scripts need Chrome on your Mac, so the full workflow (screenshots, PDFs) runs best in Codex or Claude Code.

## Contents
- `SKILL.md`: main instructions (10 steps, approval checklist, changes / second designs)
- `reference/`: content strategy, CRO playbook, design quality standard and lessons, handover & Loom templates, coverage checklist, old prompt examples (a minimum to beat)
- `scripts/`: screenshot, Before & After, logo colours, Markdown → PDF
- `agents/openai.yaml`: OpenAI display settings

Version 1.1 (Oct 2026), tested on Bang On Surveying, BetterSpace Wellbeing, Gridwork AU and Sites n Stores.

## Team use and learning
**Access:** TheSTG-Drew members see nothing by default. Each skill has its own GitHub team with read access (this one: "Homepage Redesign Users"). To give someone this skill: invite them to TheSTG-Drew, then add them to that team (Organisation → Teams → Homepage Redesign Users → Add a member).

See `TEAM-GUIDE.md` (setup and everyday use) and `reference/learning-loop.md` (how every design's lessons are submitted, reviewed and merged).

## Maintaining the skill (keep it working in Claude Code AND Codex)
After any change, check:
- No tool names specific to one assistant in `SKILL.md` or `reference/` (describe actions generically).
- Script and reference paths stay relative to this skill folder.
- `SKILL.md` frontmatter has only `name` and `description`.
- `agents/openai.yaml` is still valid YAML.
- The project link `.agents/skills/homepage-redesign` still points to this folder.
- The scripts still run when called from another folder.
