# Design Quality Standard

Work as the best web designer in the world would: a senior designer at a top studio whose homepages win awards **and** convert. The prospect must look at the Before & After and think "I want that", within three seconds, before reading a word.

Clean is not enough. Average is a failure. Every design must look like it cost thousands, be unmistakably *their* brand, and beat our team's best past work.

## The bar

A world-class homepage has:
- **One idea, executed with conviction.** A clear visual concept drawn from the business's own world (a surveyor's crosshair, a clinic's calm, a builder's materials), carried through type, shapes, imagery and details. Not a generic template with their logo on it.
- **A hero that stops the scroll.** Big, confident headline; one striking image used well (art-directed crop, not just "cover"); obvious primary button; proof right beside it.
- **Typographic authority.** A strong type scale (e.g. 72 / 48 / 28 / 18 / 15), tight headline leading, comfortable body, generous whitespace, nothing cramped, nothing floating.
- **Rhythm.** Sections alternate in density, background and layout so the scroll feels designed, not stacked. No two adjacent sections share the same layout.
- **Discipline.** One accent colour, used for action and emphasis only (roughly 60% base / 30% brand / 10% accent). Consistent radii, borders, icon style, shadows and spacing (8px scale).
- **Craft in the details.** Aligned edges, balanced line lengths, no orphans in headings, consistent button heights, real icons rather than emoji, images with a consistent treatment.
- **Photography treated with care.** Best image in the hero, crops that focus on the subject, never stretched, low-res or repeated. Where photos are weak, design around them (smaller frames, duotone, graphic shapes) rather than blowing them up.

## Scorecard (run after every render)

Score each 1–5 from the rendered screenshot, as a harsh art director would. Write the scores and one-line reasons into `review.md`.

| # | Criterion | 5 looks like |
|---|---|---|
| 1 | **First impression (3-second test)** | Instantly premium, distinctive and on-brand at thumbnail size |
| 2 | **Hero impact** | Headline, image and CTA form one striking composition; message clear in 5 seconds |
| 3 | **Brand fidelity** | Exact colours, logo, photos and tone; clearly "them, but much better" |
| 4 | **Visual concept** | A memorable idea from their world runs through the page |
| 5 | **Typography** | Clear scale, strong headlines, readable body, no awkward wraps |
| 6 | **Layout & rhythm** | Varied, balanced sections; nothing templated or repetitive |
| 7 | **CTA prominence** | Primary action is the most visible element in every viewport; wording compelling |
| 8 | **Social proof & trust** | Proof is prominent, believable and placed beside decisions |
| 9 | **Imagery** | Best photos, art-directed crops, consistent treatment, nothing low-res or repeated |
| 10 | **Polish** | Pixel-level consistency: spacing, alignment, radii, icons, contrast |

**Pass mark:** average ≥ 4.5 and **no score below 4**. Otherwise, fix the lowest-scoring items and re-render. Up to 3 passes; if it still fails, deliver and list the weak criteria in ITEMS TO VERIFY.

## Benchmark (see SKILL.md step 8)

The target is "The bar" above: world-class agency work. The examples in `reference/examples/` are only what our old prompt produced, a minimum to beat. For each criterion, the new design must be **clearly better** than them; "similar" or "worse" means improve it before delivery.

## Art Director QA (run after the scorecard)

Switch into a highly critical Art Director + CRO Director. Cross-reference the rendered design against `brief.md` and `content-plan.md`; judge whether the execution delivers the strategy, not the design in isolation.

**Check whether:**
- The layout follows the planned flow, and the planned copy is used correctly
- The hero communicates a clear value proposition and its CTA is obvious and compelling
- The trust bar sits directly below the hero (when applicable)
- Business-critical information is retained
- Services are presented around customer outcomes; messaging is clear and specific
- Social proof and trust signals are present and visible
- The page is a logical conversion journey, with CTAs well distributed and a final CTA / lead capture
- Typography and colours stay consistent with the brand; images support the messaging
- It feels premium and intentional, not templated; there's enough visual variety; sections don't feel repetitive
- The hierarchy guides the eye naturally; it works as one cohesive homepage, not a collection of sections
- It works on mobile

**Look for:** missing elements, weak messaging, poor hierarchy, weak CTA treatment, excessive text, generic imagery, brand deviations, inconsistent spacing, poor section transitions, repetitive layouts, weak contrast, unclear information hierarchy, missed conversion opportunities, unnecessary elements, anything generic or template-driven.

**Push for better.** Don't stop at mistakes. If something is technically correct but visually or strategically weak, apply a stronger pattern. Not "the services section looks fine", but "the service cards are structurally correct but repetitive; make the first service dominant with a larger image and the rest supporting cards". Be direct; never praise to be polite.

**Write into `review.md`, most important first:** Required Fixes (issue + correction), Visual Polish, CRO Opportunities, Copy / Messaging Improvements. Make every Required Fix before delivering.

## Lessons from the old prompt's output (Oct 2026)

The five examples in `reference/examples/` were made by our old prompt. They are **not** our best work; they show what the old process produced. Keep the few things it did reasonably well and never repeat its weaknesses.

**Keep these (and do them better):**
- **Premium photography.** A full-bleed hero photo of a real-looking person doing the work (hi-vis surveyor, clinician with client, grower in the shed) instantly makes the page feel expensive. Every major section has a strong, well-lit image.
- **Big hero statement.** Large headline (60–80px) over or beside a striking image, with two clear buttons.
- **Rich rhythm.** Alternate light and dark sections; include a bold stats or proof band; end with a full-width image banner before the footer.
- **Proof that looks like proof.** Star ratings, names, roles and small avatars in a review row or carousel.

**Fix these weaknesses (never repeat them):**
- **No placeholder logos.** Never show "Logoipsum" or dummy logos. A trust bar uses real logos from their site or real facts (years, licences, service area, who they work for), nothing else.
- **No invented reviews or numbers.** Our past examples include reviews and figures (e.g. "1000+ projects") we could not verify. Never do this. Real reviews only, or the labelled review placeholder (see SKILL.md).
- **Creative, specific buttons.** No "Learn More" (or any phrase) repeated on every card. Each button is worded for its section and the visitor's next step ("Book a Pre-Pour Check", "Price My Civil Works"), with a steady header button as the anchor. Team feedback (Oct 2026): identical "Get a Quote" buttons everywhere felt repetitive.
- **Always finish with a short form** (plus phone), not just a button.
- **No template sameness.** The five examples are clearly the same template. Each design needs its own concept from the client's world (see "One idea, executed with conviction").
- **Right-sized footer.** Only real pages and contact details; no newsletter sign-up or legal links unless the client actually has them.

## Lessons from test runs

**Bang On Surveying (Oct 2026), first full run:**
- **Hero photo:** a stock photo under a heavy dark overlay disappeared and read as a beach. The client's own vivid job-site photo worked far better: authentic, clearly their industry, and their own gear. Prefer the client's best real photo for the hero when it's sharp and colourful; use stock to support other sections.
- **Don't over-process client photos.** Duotone and blend-mode treatments on a dull photo made it worse (washed out, then muddy). Swap to a better photo instead.
- **Watch short text blocks for wrapping**, e.g. hero fact strips and trade ribbons. Shorten the label rather than let it wrap.
- **Buttons:** identical "Get a Quote" buttons everywhere were rejected as repetitive. Use creative, section-specific CTAs (cro-playbook.md §2).
- **No reviews online** caps the social-proof score. Say so honestly in review.md rather than inflating it.
- **The Loom script is wanted as a PDF delivered with the Before & After,** not as a text file.

**BetterSpace Wellbeing (Oct 2026), second run, psychology clinic:**
- **Ahpra rule:** no testimonials or review placeholders for regulated health services. The team section (photos, roles, locations, focus areas) became the main trust builder and scored well.
- **Logo files often have big white padding.** Crop the logo tight before using it, or it renders tiny.
- **Bigger logo → nav wraps.** Shorten nav labels and set `white-space: nowrap`.
- **Team grids:** use fixed-height photos and `minmax(0, 1fr)` columns, or one long name or photo stretches its card.
- Our past BetterSpace redesign showed patient reviews and "2–4 week wait / 100%" figures that weren't on their site. Don't repeat that.

**Gridwork AU (Oct 2026), third run, B2B infrastructure tech:**
- **JavaScript-built sites** (React/Vue) show an empty page to curl. Read them with Chrome `--dump-dom`, and if the current-site screenshot is cut off, pass a height: `screenshot.sh <url> current-site.png 1440 <height>`.
- **Check stock photos for other companies' logos** (hard hats, vests, vehicles, screens) and swap them out.
- **When a product is abstract** (digital twin, software), show it: a labelled illustration of the interface in the hero made the offer instantly clear.
- **Promote buried trust lines** (e.g. "If we don't think we're the right answer, we'll say so") from inner pages to the homepage.
- **CSS:** use child selectors (`.list > div`) for list rows, so nested divs don't inherit the row grid.

**Sites n Stores v2 (Oct 2026), feedback "looks a little cheap":**
- Playful touches (bubbly display fonts, big decorative circles, chunky 3D/shadow-base buttons, cream backgrounds, lots of red) read as cheap for a business audience. Default to a **corporate, quality** finish: clean geometric sans (e.g. Plus Jakarta Sans / Inter), white and light-grey backgrounds, navy/dark brand colour leading, the accent colour only on primary CTAs, 10–16px radii, thin borders, soft shadows, generous whitespace. Only go playful if the brand is genuinely playful and the client's audience expects it.

**UpWaste Australia (Oct 2026), v1.1 test run, B2B food waste broker:**
- **Squarespace / Wix sites lazy-load sections**, so the current-site screenshot comes out short. Check the bottom of the page is captured, and pass a manual height if not.
- **Two-sided businesses** (sellers and buyers, or clients and partners) need a "choose your path" section near the top, with one card and CTA per audience.
- **Use the client's own photos even when casual** (phone shots of bins and sheds). They read as authentic and beat stock for niche B2B.

**Salt Kitchen Charcuterie (Oct 2026), artisan food producer, approved first time:**
- **Check every photo for text built into the image.** Website gallery and category tiles often have words printed on them ("Sausages", "Dry Cured"). Don't use those; pick clean product shots.
- **Check every press quote word for word** against the original article (and their press page) before using it.

## Quick tests

- **Thumbnail test:** shrink the full page to 300px wide. Does it still look premium, with a clear hero and visible CTAs?
- **Squint test:** blur your eyes. Do the primary buttons still stand out?
- **Swap test:** could this design belong to a competitor with a logo swap? If yes, the concept isn't specific enough.
- **Remove-one-thing test:** what can go without losing anything? Remove it.
- **Before & After test:** side by side, is the improvement obvious to a busy business owner in 3 seconds?
