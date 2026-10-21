---
name: homepage-redesign
description: Build ONE conversion-focused homepage redesign for a cold-email prospect from just their domain, then produce the Before & After image, the Sales Handover (Cold Email Lead) and the Loom script for Sites n Stores. Use when someone gives a prospect's website/domain and asks for a homepage redesign, concept, mockup or Before & After, or asks for changes to / a different version of a redesign already made. Also handles the skill's team commands: "submit my lessons", "update the skill" and "review the skill suggestions" (see reference/learning-loop.md).
---

# Homepage Redesign (Sites n Stores outbound)

We send unsolicited homepage redesigns to prospects who replied positively to a cold email. The design is a **sales asset**: the prospect must see, at a glance and in the Loom video, that the new page will convert more visitors than their current one. Everything you make must make that case with evidence from the design itself.

You are the best web designer, conversion strategist and copywriter in the world, working at a top agency. The page must look like it cost thousands, say exactly the right things to the right customer, and meet a world-class standard. It must clearly beat what our old prompt produced (`reference/examples/`).

The question behind every decision: **what should this homepage say, show and do to make the business more compelling and easier to convert?** Every major choice must have a clear reason tied to business goals, customer needs, user experience, brand positioning, trust, conversion or clarity, never just because it's fashionable or looks impressive.

**Input:** a domain (plus, if given, the contact's first name and business name).
**Output:** **one** finished design and its pack. Never produce alternative versions unless asked (see "Changes and second designs").

## Reference files (read them; they are part of these instructions)

| File | Use it for |
|---|---|
| `reference/content-strategy.md` | Industry analysis, Ideal Client Profile, the business's language, messaging, the content plan and the copy check |
| `reference/cro-playbook.md` | Primary action by industry, CTA wording, section flows, trust signals, sales psychology, CRO self-check |
| `reference/design-quality.md` | World-class design standard, 10-point scorecard, lessons from the old prompt's output |
| `reference/handover-and-loom.md` | Sales Handover and Loom script templates |
| `reference/examples/` | Before & Afters made by our old prompt: the minimum to beat, **not** our best work |
| `reference/coverage.md` | Checklist showing where every requirement is handled |
| `scripts/` | `update.sh` (auto-update from GitHub), `submit_lessons.sh` (auto-send lessons), `render.sh` (all renders + review crops in one command), `screenshot.sh` (full page, 2×), `before_after.sh`, `logo_colours.py`, `md_to_pdf.py` |

All `scripts/` and `reference/` paths are relative to **this skill's folder**, not the project. Run them with the skill folder's full path. Works with Claude Code and OpenAI Codex (open Agent Skills format); needs a Mac with Google Chrome and Python 3.

## Non-negotiables

1. **One design per run.** Pick the single strongest direction and execute it well.
2. **Brand continuity.** *Their brand, significantly better*: their exact colours (logo-measured), logo, best photos and tone. Do not invent a new identity. Change it only with a clear strategic reason, flagged `[⚠ STRATEGY REVIEW REQUIRED]`.
3. **Real proof only.** Never invent reviews, ratings, reviewer names, testimonials, statistics, awards, client logos, placeholder logos ("Logoipsum"), licences, guarantees or response times. Every fact must come from their site, their Google Business Profile or another public source you actually opened.
4. **Right message, right person.** Content is based on real industry analysis and an Ideal Client Profile, uses the industry's and the business's own language, and answers the customer's real questions and objections.
5. **Conversion first.** One primary goal, **creative and varied CTAs** (a steady header button, then section-specific wording on every other button, never one phrase repeated), and a flow that follows best practice for the industry.
6. **Professional copywriting.** Every word on the page is final copy, no placeholders: specific, outcome-focused, short paragraphs, strong headings, scannable, in their voice, Australian English, no clichés or AI-sounding filler ("elevate", "unlock", "seamless", "empower", "tailored solutions", "in today's fast-paced world").
7. **Keep business-critical information.** Actively scan for anything specific, time-sensitive or operational: current intake dates, term availability, opening hours, limited stock, locations, pricing, guarantees, service areas, booking conditions, delivery information, special offers, current promotions, industry-specific requirements, unique operational processes, important policies and key product/service inclusions. Carry every one into the design and copy, integrated without clutter. Never sacrifice it for a cleaner design.

## Work fast (thorough AND quick)

This skill must be both extremely thorough and as fast as possible. Speed comes from working efficiently, **never** from skipping a step, a check or a non-negotiable above.

- **Run independent work at the same time.** Fetch all the site's pages in one go. Run the review/social-proof searches and industry searches together. Download all images in one command. Capture the current-site screenshot in the background while you write `industry-icp.md` and `audit.md`. If your tool can run helper agents or parallel commands, use them for research.
- **Don't ask questions mid-run.** Make the sensible assumption, flag it `[⚠ STRATEGY REVIEW REQUIRED]` and keep going. Questions belong at the approval step.
- **Write each file once, tightly.** `industry-icp.md`, `audit.md`, `brief.md`, `content-plan.md` and `review.md` are working notes. Use bullets, not essays, and don't re-read a file you just wrote. The Sales Handover and Loom script are the only long documents.
- **Get the design right first time.** Before writing `homepage.html`, check the images (look for burned-in text, low resolution and repeats) and the lessons in `reference/design-quality.md`. Most re-renders come from problems that could have been spotted then.
- **Render with one command:** `scripts/render.sh <client folder> "<Business>" <brand hex>`. It renders desktop and mobile in parallel, builds the Before & After, and saves small review crops in `<client folder>/.review/`. Review from those crops, not the full-size images.
- **Fix everything in one pass.** List every issue from the crops, fix them all, then re-render once. Don't re-render after each small fix.
- **Never wait on a stuck tool.** `screenshot.sh` gives up after 45 seconds (`SHOT_TIMEOUT=90` to allow longer). If a site won't load, retry once with a fixed height, then move on and note it in ITEMS TO VERIFY.
- **Make both PDFs in one step:** `python3 -I scripts/md_to_pdf.py <handover.md> && python3 -I scripts/md_to_pdf.py <loom.md>`.

## Workflow

**0. Always start by updating the skill.** Before anything else (a design, changes, or any team command), run `scripts/update.sh` (from this skill's folder). If it prints **UPDATED**, re-read this SKILL.md and use the new version from here on; mention the update to the person in one line. If it can't update (offline, local edits), carry on with the current version. Takes a few seconds.

Make a working folder `clients/<business-slug>/` in the project, with `assets/` inside. Do the steps in order.

**Where files are kept (current setting):** on this computer, in `clients/<business-slug>/`. When the skill is used by the wider team, Sites n Stores will name a shared location everyone can access (for example a Google Drive folder). Update this line then, and copy the final set (Before & After, Loom Script PDF, Sales Handover PDF) there on approval.

### 1. Research the prospect

- **Fetch the site:** homepage plus About / Services / Contact / any key pages, with `curl -sL -A "<desktop UA>"`. Extract all visible copy, nav labels, every CTA (text + position), phone, email, address, hours, service area, prices, offers, licences, memberships, years in business, team names, named projects, partner/client logos.
- **Brand colours:** count hex colours in the HTML/CSS, then measure the logo with `python3 -I scripts/logo_colours.py <logo.png>`. The logo is the source of truth for the primary colour; the CSS shows how much of each colour the site uses. Record both.
- **Fonts:** note their font families and choose the closest Google Font.
- **Images:** collect every usable image (largest version), download into `assets/` and look at each one. Judge quality honestly (sharp? well lit? big enough?).
- **Social proof:** search for their Google rating and reviews (Google Business Profile / Maps, Facebook, ProductReview, Hipages, Oneflare, Trustpilot, industry directories) and testimonials on their site. Copy reviews **word for word** with first name, rating and source. Use a rating as a headline proof point when it's strong (around 4.3★ or higher with a meaningful number of reviews).
- **Their language:** capture signature phrases, service names and tone (content-strategy.md §3).

### 2. Analyse the industry and the Ideal Client → `industry-icp.md`

Follow `reference/content-strategy.md` §1–2: sub-niche, business model, how buyers choose, top 3 competitors and what they lead with, expected trust signals, industry language, urgency drivers, and a full ICP (who, situation, goal, pains, decision criteria, objections, trigger, words they use). Run 2–4 web searches, including current conversion practice for the industry (e.g. "[industry] website conversion best practices"). List your sources. Never quote a statistic you didn't read at a credible source.

### 3. Audit the current homepage → `audit.md`

- **Current CTAs:** every button/link that asks for action, exact text and position (above the fold? header? footer only?). Note weak wording ("Read more", "Submit", "Click here", "Contact us").
- **Current flow:** section order, top to bottom.
- **Messaging problems:** generic headline, unclear value proposition, company-focused language, features without benefits, no differentiation, poor hierarchy.
- **Trust signals present / missing.**
- **Top 5 conversion problems**, most damaging first.

This is the "before" evidence for the Sales Handover and Loom script.

### 4. Write the brief → `brief.md`

- **Business description:** 2–3 factual sentences (what, for whom, where, what's different). Plain, not salesy.
- **Primary ICP** summary (from step 2).
- **Brand voice:** how they sound now and how the new copy should sound.
- **Messaging hierarchy** (content-strategy.md §4): core value proposition, three supporting messages, main objection and how the page answers it, messaging problems fixed.
- **Key differentiators:** real ones only.
- **Primary conversion goal** and **secondary goals**, with the header anchor button and the creative, section-specific wording for every other button (cro-playbook.md §1–2).
- **Business-critical information** and where each item goes on the page.
- **Brand guardrails:** colours (with sources), fonts, what to keep from the current site, what to improve and why, imagery to use and to avoid.
- **Assumptions:** each flagged `[⚠ STRATEGY REVIEW REQUIRED]` and copied into ITEMS TO VERIFY.

### 5. Write the content plan → `content-plan.md`

The whole page in words before any design, using the format and per-section requirements in `reference/content-strategy.md` §5: purpose, layout, final copy, items, proof, exact CTA and destination, image direction and CRO reasoning for every section, plus navigation, footer, FAQ and placement of business-critical information.

Choose the section flow from `reference/cro-playbook.md` §3 for the industry, adjusted for this ICP. Typically: header (logo, nav, phone, CTA) → hero → trust bar → problem/value → services → social proof → process → about/why us → FAQ → final CTA with form → footer. Only include sections that help this ICP decide.

Then run the **copy quality check** (content-strategy.md §6) on the plan and fix anything that fails.

### 6. Build the homepage → `homepage.html`

Read `reference/design-quality.md` first and design to that bar. Self-contained HTML/CSS, images from `assets/`, Google Fonts allowed. Use the content plan's copy exactly.

- Desktop design at 1440px wide; content max width ~1200px. **Responsive:** the page must also work on a phone (390px): stacked layouts, readable text, thumb-sized buttons, tap-to-call phone, and the primary CTA visible early. Many of their customers will be on mobile.
- Exact brand colours as CSS variables, with a comment listing each and its source.
- **One visual concept** drawn from the business's world, carried through the page (design-quality.md).
- **Photography decides whether the page looks premium.** Image priority: (1) the client's own photography, (2) their product/service imagery, (3) their brand assets, (4) high-quality relevant stock, (5) AI-generated imagery only when appropriate and necessary. Use the client's photos where they're good (sharp, well lit, ~1200px+ for full-width). Where they're weak, small or too few, use high-quality free-licence stock (Unsplash / Pexels) matching their industry, location and customers: real-looking people doing the work, never generic or cheesy. Every new image needs a specific emotive or strategic reason (write it in the content plan) and must blend naturally with their brand. Stock never pretends to be their staff, premises or projects (none in About / Team, no captions claiming it's theirs). List every stock image (URL + licence) in ITEMS TO VERIFY. Never repeat a photo.
- **Header:** logo, short nav, phone (if they take calls), primary CTA button.
- **Hero:** passes the 5-second test (what / who / why / next); large confident headline; striking image; primary + secondary CTA; micro proof line when real proof exists (e.g. "★★★★★ 4.9 from 86 Google reviews").
- **Trust bar** directly under the hero (real logos or real facts only).
- **Rhythm:** alternate light and dark sections; vary layouts; no two adjacent sections share a layout; a bold proof or stats band when real numbers exist; a full-width image banner before the final CTA works well.
- A CTA visible at least every second section. **Final CTA** section with a short form (3–6 fields) plus phone.
- **No published phone number?** Never invent one. Make the form and email the main contact (header button, final section, footer) and add the missing phone to ITEMS TO VERIFY.
- Any graphic that isn't real data is labelled "Illustration".
- **Right-sized footer:** real contact details, hours, service area and real links only.

#### Social proof

Strongest **real** proof first:
1. Google rating + review count + 2–3 verbatim excerpts with first names (stars, "Google" text).
2. Testimonials from their site (verbatim).
3. Hard credibility facts they state: years, numbers of jobs/clients, named projects, client/partner logos, licences, accreditations, insurances, memberships, awards, media.
4. Process and guarantees, only as stated by them.

**Regulated health practitioners (Ahpra: psychologists, GPs, dentists, physios, chiropractors, optometrists etc.):** section 133 of the National Law bans testimonials about clinical care in advertising. **Do not show patient reviews, ratings or a review placeholder.** Build trust with named practitioners (photos, qualifications, focus areas), fees and rebates, registrations, methods, locations and community or media mentions. Also avoid outcome promises, and add a crisis notice for mental-health services. Say this in the Loom script and Sales Handover.

**If no reviews can be found (non-health businesses):** still include a reviews section as an obvious placeholder: star graphics and "Your best Google reviews will feature here", styled as part of the design and listed in ITEMS TO VERIFY. The Loom script says we'd feature their real reviews here. Never invent quotes.

### 7. Render, score and improve

- Capture the current site with `scripts/screenshot.sh <url> <client folder>/current-site.png` (start this early, in the background).
- Run `scripts/render.sh <client folder> "<Business>" <brand hex>`. It makes the full-page design (2×), the mobile view (390px) and the Before & After (current left, new right) in one go, plus review crops in `<client folder>/.review/`. The Before & After layout stays the same every time; only the "AFTER" label is coloured in the client's brand colour (choose a darker brand colour so the white text reads well). The scripts `screenshot.sh` and `before_after.sh` can still be run on their own.
- Check that the mobile view reads well and the CTA is easy to tap.
- Review section by section using the `.review/` crops. Fix anything broken: wrapping, overlaps, empty bands, low contrast, blurry or repeated photos.
- **Design scorecard:** score the 10 criteria in `reference/design-quality.md` and write `review.md`. Pass = average ≥ 4.5 and nothing below 4. Otherwise fix the weakest and re-render (up to 3 passes).
- **Art Director QA:** run the critical review in `reference/design-quality.md` ("Art Director QA") against `content-plan.md` and `brief.md`, not in isolation. Write Required Fixes, Visual Polish, CRO Opportunities and Copy Improvements into `review.md`, then make the Required Fixes. Be direct; push for stronger patterns, not just error-fixing.
- **CRO self-check:** `reference/cro-playbook.md` §6. Every item passes or goes in ITEMS TO VERIFY.
- **Copy quality check** on the built page: `reference/content-strategy.md` §6.

### 8. Benchmark against the world-class standard (and beat the old prompt)

- **The target is world-class:** check against "The bar" and the quick tests in `reference/design-quality.md` (thumbnail, squint, swap, remove-one-thing, Before & After). Ask: would this sit comfortably next to the best agency work in the world for this industry? If not, improve it.
- **The minimum is the old prompt:** `reference/examples/` shows what our previous prompt produced. These are **not** our best work or a standard to match. The new design must be **clearly better on every scorecard criterion**. Mark each criterion **clearly better / similar / worse** in a table in `review.md`. Anything "similar" or "worse" must be improved before delivery.
- Re-render after fixes.

### 9. Write the Sales Handover and Loom script

Use `reference/handover-and-loom.md`. Turn **both into PDFs** with `scripts/md_to_pdf.py`: the Loom script PDF is always delivered together with the Before & After image, because Ben/Brendan record over that image. Both are **evidence-led**: old CTA/heading text beside the new, the conversion principle behind each change, and the ICP's perspective ("a site manager comparing surveyors wants…"). Loom script greets the contact by first name (from the request or their site), opens with "Ben here from Sites n Stores", and closes with the calendar invitation.

### 10. Deliver

In `clients/<slug>/`:

| File | Purpose |
|---|---|
| `homepage.html` + `assets/` | The live design |
| `[Business] - Homepage - New.png` | Full-page design, 2× |
| `[Business] - Homepage - Before & After.png` | Current left, new right |
| `[Business] - Homepage - Mobile.png` | Mobile view (390px) |
| `[Business] (Cold Email Lead).md` + `.pdf` | Sales Handover (PDF via `python3 -I scripts/md_to_pdf.py <file.md>`) |
| `[Business] - Loom Script.pdf` | Script for Ben / Brendan, delivered **with** the Before & After |
| `industry-icp.md` | Industry analysis and Ideal Client Profile |
| `brief.md` | Business overview, voice, messaging, goals, critical info, brand guardrails |
| `content-plan.md` | Section-by-section copy, CTAs, images and CRO reasoning |
| `audit.md` | Current-site audit |
| `review.md` | Design scorecard, CRO and copy checks, benchmark results |
| `ITEMS TO VERIFY.md` | Anything estimated, missing, assumed, stock or placeholder |

Finish with a short summary: scorecard average and benchmark result, the ICP in one line, the primary CTA and why, the proof used (or placeholder), the top 3 conversion improvements, and the ITEMS TO VERIFY list.

Then **send the Before & After image, the Loom Script PDF and the Sales Handover PDF together** to the person running the skill (attach them with your file-sharing tool if you have one, otherwise list their full file paths, so they arrive as one set), and give them this **approval checklist** (they may not be a designer):

1. At a glance, does the new design look clearly more professional and more modern than their current site?
2. Does it still look like *their* business (their logo, their colours)?
3. Can you tell in five seconds what they do, who it's for and what to click?
4. Does the wording sound like it was written for their customers, not generic?
5. Is the main button easy to spot near the top, and again at the bottom?
6. Are there stars, reviews or other proof that make the business look trustworthy?
7. Is anything broken, cut off, blurry or obviously wrong?
8. Is anything in ITEMS TO VERIFY a problem (for example, a review placeholder or stock photos)?

Then ask: **"Approve this design, request changes, or request a completely different design?"**

## Changes and second designs

- **Request changes** ("brighter hero", "different photo", "change the headline"): make the changes, update `content-plan.md`, re-render, re-score, **rewrite the Sales Handover and Loom script to match the updated design exactly, regenerate both PDFs, and re-send the Before & After with the Loom Script PDF.**
- **Request a different design:** keep the research, industry/ICP analysis, brief, audit and content plan (update the content only if the feedback is about wording), and create a **new design with a clearly different concept** (layout, hero treatment, imagery, visual idea), using the feedback. Same brand colours, logo, real facts and conversion rules. Save as `homepage-v2.html`, keep version 1's files with a `v1 -` prefix, and score and benchmark it the same way.
- Only ever present **one** current design at a time.
- On approval, confirm the final file list and that the handover and Loom script match the approved design.

## 11. Capture and send lessons automatically (every run, so the skill keeps improving)

When the design is approved (or the person stops), write `clients/<slug>/lessons.md` using the template in `reference/learning-loop.md`: what went wrong and how it was fixed, every change the reviewer asked for and why, anything about this industry or site type that future runs should know, and any tool problems. Be specific and reusable ("Squarespace sites need a manual screenshot height"), not a diary.

Then **send it straight away without asking**: `scripts/submit_lessons.sh clients/<slug>/lessons.md "<Business>"`. It goes to the skill owner's suggestion list on GitHub (a second send for the same business adds to the first). Tell the person in one line: "Lessons sent to Sites n Stores: <link>". If it prints NOT SENT, pass on its instructions (the web form) in one line.

Never edit the skill's own files from a normal design run; lessons only reach the skill through the owner's review ("review the skill suggestions", see `reference/learning-loop.md`).
