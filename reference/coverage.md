# Coverage checklist

Where every requirement lives in this skill. Use this when updating the skill so nothing is lost.

## From the v3 Gem prompt (and the original v2 prompt)

| Requirement | Where it's handled |
|---|---|
| Role: senior designer, CRO director, copywriter, sales writer | SKILL.md intro |
| Brand continuity ("their brand, significantly better") | SKILL.md non-negotiable 2; brief.md brand guardrails; design-quality.md criterion 3 |
| Professional copywriting rules (specific, outcomes, short, scannable, their voice, no clichés, AU English) | SKILL.md non-negotiable 6; content-strategy.md §6 |
| Flag big assumptions `[⚠ STRATEGY REVIEW REQUIRED]` | SKILL.md non-negotiable 2 and step 4 |
| Image strategy (their images first, justified new images, image direction per section) | SKILL.md step 6; content-plan.md "Image" per section |
| Business-critical info (dates, hours, prices, areas, offers, policies…) | SKILL.md non-negotiable 7; brief.md; content-plan.md placement |
| Live Google reviews, 4.3★+ as headline proof, never invent | SKILL.md step 1 and "Social proof" |
| Trust & authority bar directly under the hero | SKILL.md step 6; cro-playbook.md §4 |
| Middle funnel: outcome-focused services with micro-CTAs | content-strategy.md §5 table; cro-playbook.md §2 |
| End funnel: clear conversion section | SKILL.md step 6 (form + phone); cro-playbook.md §6 |
| Part 1 Asset Pack (logo, colours, fonts, images, contacts, reviews) | SKILL.md step 1 |
| Part 2 Brand guardrails / style | brief.md brand guardrails; homepage CSS variables |
| Part 3 Business overview, audience, primary/secondary goals, value proposition, differentiators, messaging problems | brief.md; industry-icp.md; audit.md |
| Part 4 Relume prompt | Not needed (design is built directly) |
| Part 5 Section-by-section build sheet (purpose, layout, copy, CTA, image, CRO reason) | content-plan.md (content-strategy.md §5) |
| Part 6 Business-critical information | brief.md; content-plan.md |
| Part 7 Designer self-check | review.md: design scorecard, CRO check, copy check |
| Part 8 Sales Handover (What changed / CRO strategy / Pitch talking point, vertical format) | handover-and-loom.md A |
| Part 9 Loom script (4–5 min, timed parts, screen directions, Ben from Sites n Stores, calendar close) | handover-and-loom.md B |
| Items to verify | ITEMS TO VERIFY.md |
| QA review mode | Built in: scorecard + benchmark every run |
| Update handover & Loom when design changes | SKILL.md "Changes and second designs" |
| Final quality standard | design-quality.md; cro-playbook.md §6 |

## Added in this conversation

| Requirement | Where it's handled |
|---|---|
| One design per run | SKILL.md non-negotiable 1 |
| Strong, specific CTAs that are **creative and varied** per section (team feedback after Bang On test) | cro-playbook.md §1–2, §6; SKILL.md non-negotiable 5 |
| Five-star proof, trust signals, social proof | SKILL.md "Social proof"; cro-playbook.md §4 |
| Flow based on industry research / CRO best practice | SKILL.md step 2; cro-playbook.md §3; content-strategy.md §1 |
| Complete industry analysis | content-strategy.md §1 → industry-icp.md |
| Ideal Client Profile | content-strategy.md §2 → industry-icp.md |
| Content relevant to the ICP; full content on the page | content-strategy.md §5 → content-plan.md |
| The business's own language | content-strategy.md §3 |
| Loom script proves stronger CTAs, better flow, sales psychology | handover-and-loom.md B |
| Best designer in the world standard | SKILL.md intro; design-quality.md |
| Beat the old prompt's output (minimum, not the target) | SKILL.md step 8; reference/examples/ |
| Benchmark against the best in the world | design-quality.md "The bar" and quick tests; SKILL.md step 8 |
| Lessons from past examples (no Logoipsum, no invented reviews, no "Learn More" spam, form at the end, no template sameness) | design-quality.md "Lessons from the old prompt's output" |
| Premium photography (stock allowed with safeguards) | SKILL.md step 6 |
| Exact brand colours measured from the logo | SKILL.md step 1; scripts/logo_colours.py |
| Non-designer can judge the result | SKILL.md approval checklist |
| Request changes or a second, different design | SKILL.md "Changes and second designs" |

## v2 prompt check (the version our past designs came from)

Every v2 requirement, checked line by line on 16 Oct 2026. Items marked **(restored)** had been lost or weakened in v3 or the first skill draft and are now back.

| v2 requirement | Where it's handled |
|---|---|
| Guiding question: what should the site say, show and do to be more compelling and easier to convert | SKILL.md intro **(restored)** |
| Every recommendation tied to business goals, customer needs, UX, brand, trust, conversion or clarity; nothing just because it's fashionable | SKILL.md intro **(restored)** |
| Copy: natural, confident; clear distinctions between sections; concise enough to fit the design | content-strategy.md §5 **(restored)** |
| Copywriting notes (decisions, assumptions, items needing client approval) | content-plan.md **(restored)** |
| Image priority list incl. product/service imagery, brand assets, AI only when necessary | SKILL.md step 6 **(restored)** |
| Every new image needs an emotive or strategic justification; avoid generic stock | SKILL.md step 6; content-plan "Image" **(restored)** |
| Full business-critical list (term availability, limited stock, delivery, promotions, industry requirements, operational processes, policies) + integrate without clutter | SKILL.md non-negotiable 7 **(restored)** |
| Reviews chosen for quality and because they reinforce key services/outcomes; treatment options (carousel, grid, badge, rating summary); Google branding | content-strategy.md §5 table **(restored)** |
| "No suitable verified Google Reviews found for inclusion" when none exist | content-strategy.md §5 table; ITEMS TO VERIFY **(restored)** |
| Trust bar: subtle but credible ribbon; specific "Trusted by…" statement, never generic when specific is supported | content-strategy.md §5 table **(restored)** |
| Middle funnel: humanised, visually engaging; don't just reproduce their service list | content-strategy.md §5 table **(restored)** |
| Hero: no vague or overly clever headlines | content-strategy.md §5 table **(restored)** |
| Full section menu (benefits, products, locations, case studies, customer success…) and flow follows the user journey, not the old order | content-strategy.md §5 **(restored)** |
| Section build sheet incl. **UI requirement** field | content-strategy.md §5 format **(restored)** |
| Optional secondary utility CTA in the navigation | content-strategy.md §5 **(restored)** |
| Phase 2 Art Director QA: full checklist, critique list, "push for better", be direct, Required Fixes / Polish / CRO / Copy output | design-quality.md "Art Director QA"; SKILL.md step 7 **(restored)** |
| Phase 3 handover focus list incl. navigation, information hierarchy, **mobile UX**, brand continuity, user journey | handover-and-loom.md A **(restored)** |
| Mobile UX | SKILL.md step 6 (responsive) and step 7 (mobile screenshot) **(restored)** |
| Handover delivered as PDF ("Cold Email Lead.pdf") | scripts/md_to_pdf.py; SKILL.md step 10 **(restored)** |
| Pitch annotations (why each decision improves conversion) | content-plan "CRO reasoning"; Sales Handover "CRO Strategy" |
| Everything else in v2 (role, brand continuity, copy rules, live reviews, trust & authority, middle/end funnel, Phase 1 outputs, Phase 3 vertical format) | See the v3 table above |

## Added after the first test run (Bang On Surveying)

| Requirement | Where it's handled |
|---|---|
| Creative, varied CTAs instead of one repeated phrase | cro-playbook.md §1–2, §6; design-quality.md lessons |
| Loom script delivered as a PDF together with the Before & After (and the Sales Handover PDF) | SKILL.md steps 9–10; handover-and-loom.md |
| Changes → regenerate PDFs and re-send the set | SKILL.md "Changes and second designs" |
| Phone-width screenshots render correctly | scripts/screenshot.sh (iframe method for widths under 500px) |
| Lessons from the run (hero photo choice, no over-processing, wrapping, honest proof score) | design-quality.md "Lessons from test runs" |
| Ahpra: no testimonials or review placeholders for regulated health services; crisis notice for mental health | SKILL.md "Social proof"; design-quality.md lessons |
| Before & After: standard layout, with the "AFTER" label in the client's brand colour (not yellow) | scripts/before_after.sh; SKILL.md step 7 |
| Learns from every design: lessons captured each run, submitted as GitHub Issues, reviewed and merged by the owner | SKILL.md step 11; reference/learning-loop.md |
| Food & drink producers: wholesale-first CTAs, section flow, trust signals (Salt Kitchen lessons, issue #1) | cro-playbook.md §1, §3, §4 |
| No published phone: never invent one; form + email become the main contact | SKILL.md step 6 |
| Photos with built-in text; press quotes checked word for word | design-quality.md "Lessons from test runs" |
| Lessons sent to the owner automatically at the end of every run | SKILL.md step 11; scripts/submit_lessons.sh |
