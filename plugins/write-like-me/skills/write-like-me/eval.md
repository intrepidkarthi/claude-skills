# write-like-me — self-check

Run this against the draft **before returning it**, in every mode. Answer each check pass or fail. On any fail, fix the draft and re-run the affected section. Do this yourself, in one pass — this doesn't need a separate evaluator agent, and splitting it into one costs a full regeneration for no accuracy gain.

Skip the sections that don't apply to the mode you're in. Detect mode runs only "Detect-mode output" and "Restraint."

---

## Restraint (all modes)

1. Did you avoid inventing claims, examples, statistics, quotes, dates, or opinions the writer didn't have?
2. Where a rule demanded specificity and the draft had no fact to supply it, did you flag the gap and ask, rather than filling it with a plausible-sounding number or name?
3. Is the amount of cutting proportional to the actual slop — no aggressive compression that strips character along with the filler?
4. Did strong human sentences survive untouched, instead of being rewritten for consistency?
5. Are the writer's distinctive vocabulary, cadence, bluntness, humor, admitted uncertainty, and digressions still recognizable?
6. Did you keep "I think," "maybe," "honestly," and similar where they carry real uncertainty or spoken rhythm, and cut them only where they padded?
7. Is edge intact — strong opinions, blunt language, profanity, self-interruptions, honest admissions — rather than laundered into safer wording?
8. If you reorganized the structure, did you say why in the "What changed" section?

## Words and phrases

9. Are Tier 1 words replaced, or explicitly preserved because they're the right word in context?
10. Are Tier 2 words handled where two or more appear in the same paragraph?
11. Are Tier 3 words and phrases flagged only at genuine density, not swept on sight?
12. Are filler phrases, hollow intensifiers, and nominalized verbs ("made a decision," "has the ability to") resolved?
13. Are quoted examples, code blocks, and text attributed to someone else left alone?

## Patterns

14. Are binary contrasts, negative listings, and rhetorical setups gone?
15. Are throat-clearing openers, faux-insight setups ("what nobody tells you"), and reader-steering frames ("here's what's interesting") gone?
16. Are colon reveals folded into plain sentences, and is text after a mid-sentence colon in sentence case unless grammar requires otherwise?
17. Are superficial `-ing` analyses, importance puffery, and significance inflation replaced with facts?
18. Is weasel attribution either sourced by name or flagged for the writer — never invented?
19. Are fake-strong verbs replaced by "is" and "has" where those are clearer, and do abstractions no longer perform human verbs?
20. Is synonym cycling gone, with the clearest word repeated instead?
21. Were fake-profound kickers **deleted** rather than rewritten into better metaphors, with the piece ending on a concrete sentence already in the draft?
22. Are summary-recap endings cut — including the unmarked kind that restates the piece without saying "in conclusion"?
23. Is formatting slop gone: emoji headings, decorative bold, bullets that should be prose, headers over two-sentence sections, title-case subheads?
24. Are em dashes within budget for the context profile, and are chatbot artifacts, citation-markup leaks, AI-tool URL parameters, and unfilled placeholders stripped?

## Rhythm

25. Do sentence lengths vary — short ones next to long ones — rather than clustering at 15–25 words?
26. Do paragraph lengths vary, instead of every paragraph running 3–5 sentences?
27. Is dramatic fragmentation gone (3+ consecutive same-shape fragments), while deliberate single fragments that break rhythm remain?
28. Read it aloud: does it resist flat text-to-speech delivery?
29. Did the edit avoid over-polishing — is there still natural unevenness, or did you sand the draft toward the uniformity this skill exists to remove?

## Voice (generate and rewrite)

30. If a voice profile applies, does the draft hit its concrete targets rather than a general impression of it?
31. If the writer supplied a sample, did the sample win over the named profile wherever they disagreed?
32. In `karthik` voice: exactly one of the four structures, a number or concrete noun in the first sentence, at most one signature phrase, no "X, not Y" slogan unless it's genuinely the best line, none of the hard nos?
33. Would the writer recognize this as their own voice?
34. Would it sound natural read aloud to a sharp colleague?

## Detect-mode output

35. Does every finding name the pattern from SKILL.md, quote the line, and give a short fix?
36. Are findings grouped by severity (P0, P1, P2)?
37. Did you avoid scoring the draft — no percentage, no grade, no "reads 70% AI"?
38. Did you avoid claiming or guessing AI authorship?
39. Did you avoid rewriting, even where the fix was obvious?
40. Did you offer to run the rewrite?

## Final output

41. Does the response match the output format for the mode (rewrite: four sections; generate: three; detect: two; edit: a short report, not the full file)?
42. In rewrite and generate modes, did the second pass actually re-read the new draft, rather than restating the first pass's changes?
43. In edit mode, did you re-read the file after editing and confirm the flagged spans are resolved?
