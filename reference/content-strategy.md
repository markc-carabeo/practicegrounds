# Content Strategy: industry, ideal client, language and copy

The page only converts if it says the right things, to the right person, in words they use. Do this work **before** designing. A beautiful page with generic copy fails.

---

## 1. Industry analysis → `industry-icp.md`

Research with the prospect's site, their competitors and 2–4 web searches. Write down:

- **Industry and sub-niche:** e.g. "construction surveying (set out, as-built, machine control) for commercial builders and civil contractors", not just "surveying".
- **Business model:** who pays, average job type, one-off vs recurring, B2B or B2C, local or national.
- **How buyers choose in this industry:** what they compare (price, speed, accuracy, availability, credentials, reviews, location), and how they usually make contact (phone, quote form, booking, demo).
- **Top 3 competitors** (search "[service] [location]"): what their homepages lead with, their CTAs, and their proof. Note what is standard in the industry and where our prospect can stand out. Do not copy their wording.
- **Industry trust signals:** the licences, memberships, accreditations, insurances, guarantees or credentials buyers in this industry expect (e.g. builders: licence and insurance; psychology: AHPRA registration; childcare: ratings).
- **Industry language:** the terms professionals and buyers use (e.g. "set out", "pre-pour", "as-built" for surveyors; "NDIS", "Medicare rebate", "referral" for allied health). Use these on the page; avoid terms buyers wouldn't use.
- **Seasonality / urgency drivers:** e.g. construction programs, intake dates, end of financial year.
- **Sources:** list the URLs you used.

## 2. Ideal Client Profile (ICP) → in `industry-icp.md`

Write one primary ICP (and one secondary if the business clearly serves two groups):

| Field | What to write |
|---|---|
| **Who** | Role / type of customer (e.g. "site manager at a mid-size commercial builder", "parent of a child with suspected ADHD") |
| **Situation** | What's happening when they search for this business |
| **Goal** | The outcome they want |
| **Pains / fears** | What goes wrong if they choose badly (rework, delays, cost, safety, wasted time, stress) |
| **Decision criteria** | What they check before contacting (reviews, credentials, location, price clarity, speed) |
| **Objections** | Reasons they hesitate (cost, availability, "are they too small/big", "will they understand my job") |
| **Trigger to act** | What gets them to call or enquire today |
| **Words they use** | Phrases from reviews, forums, competitor FAQs and the prospect's own copy |

Every section of the page must speak to this person. If a section doesn't help the ICP decide, cut it.

## 3. The business's own language

From the prospect's site (and reviews):
- **Signature phrases** to keep (e.g. Bang On's "'bang on', accurate, high quality survey solutions").
- **Tone:** formal / friendly / technical / warm / local / premium. Match it, then sharpen it.
- **Names and terms** for their services exactly as they use them (keep their service names unless they're unclear).
- **Words to avoid:** jargon their customers wouldn't use, or tones that clash with their brand.

## 4. Messaging hierarchy → in `brief.md`

1. **Core value proposition** (one sentence): why the ICP should choose this business over alternatives.
2. **Three supporting messages** (proof-backed): e.g. accuracy, experience, communication.
3. **Primary objection to defuse** and how the page answers it.
4. **Primary CTA and secondary CTA** (from the CRO playbook).
5. **Messaging problems on the current site** (generic headline, unclear value, company-focused language, weak CTAs, features without benefits, no differentiation, poor hierarchy, missing trust signals) and how the new copy fixes each.

## 5. Content plan → `content-plan.md` (write before building)

The full page in words, top to bottom. The HTML must use this copy exactly. For **every** section:

```
[ ] SECTION [n]: [NAME]
Purpose: [its job in the ICP's decision, one sentence]
Layout: [wireframe instruction]
Eyebrow: [optional]
Heading: [final copy]
Supporting copy: [final copy, 1–3 short sentences]
Items / cards / steps: [final title + final description for each]
Proof: [the real proof shown here, with source, if any]
CTA: "[exact button text]" → [destination: form / phone / booking]
UI requirement: [visual hierarchy, spacing, contrast, emphasis, interaction or component detail]
Image: [file or stock URL + what it shows + crop/orientation + why this image (emotive or strategic reason)]
CRO reasoning: [which principle and why it moves the ICP forward]
```

Also include:
- **Navigation labels**, header CTA and an optional secondary utility CTA (e.g. phone, client login) if relevant.
- **Copywriting notes:** important messaging decisions, assumptions and anything needing the client's approval, with `[⚠ STRATEGY REVIEW REQUIRED]` where uncertain.
- **Footer contents** (real details only).
- **Business-critical information** placement (hours, areas, prices, offers, licences, dates).
- **FAQ:** 4–6 real objections from the ICP, each with a factual answer drawn from their site. If the answer isn't known, write the question with an answer that doesn't invent facts (e.g. "Call us and we'll talk through your job") or leave it out.

The flow must follow the ICP's decision journey, not the current site's section order. Choose from: Hero, Trust Bar, Core Value Proposition, Problem, Services / Solutions, Products, Benefits / Outcomes, About / Why Choose Us, Process, Locations / Service Areas, Case Studies / Projects, Customer Success / Testimonials, FAQs, Lead Capture, Final CTA, Footer. Only include sections that are strategically relevant; don't force sections in.

All copy must be concise enough to sit comfortably in a high-fidelity design, and each section must feel clearly distinct from the next.

### What every section must contain

| Section | Must include |
|---|---|
| **Hero** | What they do + who it's for + why it matters + what to do next; no vague or overly clever headlines that fail to explain the business; primary + secondary CTA; micro proof line if real proof exists; location/service area for local businesses |
| **Trust bar** | Real partner/client logos, certifications, awards, accreditations, memberships or credibility facts only (years, licences, who they work for, service area), as a clean horizontal ribbon: subtle but credible. Add a specific authority statement (e.g. "Trusted by Melbourne's builders and engineers") supported by their site, never generic wording when something specific is supported |
| **Problem / value** | The ICP's real pain in their own words, and how the business solves it; a CTA |
| **Services / products** | Reframed, not copied from their list: what the customer gets → why it matters → what to do next. Outcome-focused, humanised, easy to scan, visually engaging, concise; the business's service names and industry terms; one specific micro-CTA per service. Consider making the highest-priority service visually dominant |
| **Social proof** | Real reviews (verbatim, first names, rating and count, source), choosing 1–3 high-quality reviews that reinforce key services or outcomes; a suitable treatment (review cards, carousel, testimonial grid, Google badge, rating summary); Google branding, stars and count where available. Never invent a quote or a name. If none are found, state "No suitable verified Google Reviews found for inclusion" in ITEMS TO VERIFY and use the labelled placeholder |
| **Process** | 3–4 steps from first contact to result, removing "what happens next?" |
| **About / why us** | The people and experience behind the business (real facts), human tone, a CTA |
| **FAQ** | The ICP's top objections answered |
| **Final CTA** | A strong closing headline, short form (3–6 fields relevant to the industry), phone, what happens after they enquire |
| **Footer** | Contact details, hours, service area, real links |

## 6. Copy quality check (run on `content-plan.md` and again on the built page)

- [ ] Every heading is specific to this business; it couldn't be pasted onto a competitor's site
- [ ] The ICP's pains, goals and objections are all addressed somewhere on the page
- [ ] Industry terms are used correctly; no jargon the ICP wouldn't use
- [ ] The business's own service names and signature phrases are kept where they work
- [ ] Benefits before features; outcomes over descriptions
- [ ] Paragraphs ≤ 3 sentences; headings ≤ ~10 words; scannable
- [ ] Every CTA starts with a verb, says what they get, and is worded for its section; buttons are creative and varied, not one repeated phrase
- [ ] No placeholder text anywhere (except the labelled review placeholder)
- [ ] No invented facts, numbers, reviews, guarantees or credentials
- [ ] No clichés or AI-sounding filler; Australian English spelling
- [ ] Reads naturally aloud, in the business's tone
