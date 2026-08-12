# write-like-me — self-check

Run this against the draft **before returning it**, in every mode. Answer each check pass or fail. On any fail, fix the draft and re-run the affected section. Do this yourself, in one pass — this doesn't need a separate evaluator agent, and splitting it into one costs a full regeneration for no accuracy gain.

Skip the sections that don't apply to the mode you're in. Detect mode runs only "Invisible marks," "Detect-mode output," and "Restraint."

---

## Invisible marks (all modes, whenever a file is involved)

1. Did you actually run `scripts/scan_marks.py` on the file, rather than assuming the text was clean because nothing looked wrong?
2. Were the marks it found stripped with `--fix`, not retyped by hand?
3. Did you leave the `keep` hits alone — emoji joiners, Indic and Arabic ZWJ/ZWNJ, variation selector 16?
4. Were unfilled placeholders surfaced to the writer instead of silently deleted?
5. If you couldn't run the scanner (inline paste, no file), did you say so rather than implying the draft is clean?
6. Did you avoid claiming that a clean scan means the text is human-written?

---

## Restraint (all modes)

7. Did you avoid inventing claims, examples, statistics, quotes, dates, or opinions the writer didn't have?
8. Where a rule demanded specificity and the draft had no fact to supply it, did you flag the gap and ask, rather than filling it with a plausible-sounding number or name?
9. Is the amount of cutting proportional to the actual slop — no aggressive compression that strips character along with the filler?
10. Did strong human sentences survive untouched, instead of being rewritten for consistency?
11. Are the writer's distinctive vocabulary, cadence, bluntness, humor, admitted uncertainty, and digressions still recognizable?
12. Did you keep "I think," "maybe," "honestly," and similar where they carry real uncertainty or spoken rhythm, and cut them only where they padded?
13. Is edge intact — strong opinions, blunt language, profanity, self-interruptions, honest admissions — rather than laundered into safer wording?
14. If you reorganized the structure, did you say why in the "What changed" section?

## Words and phrases

15. Are Tier 1 words replaced, or explicitly preserved because they're the right word in context?
16. Are Tier 2 words handled where two or more appear in the same paragraph?
17. Are Tier 3 words and phrases flagged only at genuine density, not swept on sight?
18. Are filler phrases, hollow intensifiers, and nominalized verbs ("made a decision," "has the ability to") resolved?
19. Are quoted examples, code blocks, and text attributed to someone else left alone?

## Patterns

20. Are binary contrasts, negative listings, and rhetorical setups gone?
21. Are throat-clearing openers, faux-insight setups ("what nobody tells you"), and reader-steering frames ("here's what's interesting") gone?
22. Are colon reveals folded into plain sentences, and is text after a mid-sentence colon in sentence case unless grammar requires otherwise?
23. Are superficial `-ing` analyses, importance puffery, and significance inflation replaced with facts?
24. Is weasel attribution either sourced by name or flagged for the writer — never invented?
25. Are fake-strong verbs replaced by "is" and "has" where those are clearer, and do abstractions no longer perform human verbs?
26. Is synonym cycling gone, with the clearest word repeated instead?
27. Were fake-profound kickers **deleted** rather than rewritten into better metaphors, with the piece ending on a concrete sentence already in the draft?
28. Are summary-recap endings cut — including the unmarked kind that restates the piece without saying "in conclusion"?
29. Is formatting slop gone: emoji headings, decorative bold, bullets that should be prose, headers over two-sentence sections, title-case subheads?
30. Are em dashes within budget for the context profile, and are chatbot artifacts, citation-markup leaks, AI-tool URL parameters, and unfilled placeholders stripped?

## Rhythm

31. Do sentence lengths vary — short ones next to long ones — rather than clustering at 15–25 words?
32. Do paragraph lengths vary, instead of every paragraph running 3–5 sentences?
33. Is dramatic fragmentation gone (3+ consecutive same-shape fragments), while deliberate single fragments that break rhythm remain?
34. Read it aloud: does it resist flat text-to-speech delivery?
35. Did the edit avoid over-polishing — is there still natural unevenness, or did you sand the draft toward the uniformity this skill exists to remove?

## Voice (generate and rewrite)

36. If a voice profile applies, does the draft hit its concrete targets rather than a general impression of it?
37. If the writer supplied a sample, did the sample win over the named profile wherever they disagreed?
38. In `karthik` voice: exactly one of the four structures, a number or concrete noun in the first sentence, at most one signature phrase, no "X, not Y" slogan unless it's genuinely the best line, none of the hard nos?
39. Would the writer recognize this as their own voice?
40. Would it sound natural read aloud to a sharp colleague?

## Detect-mode output

41. Does every finding name the pattern from SKILL.md, quote the line, and give a short fix — with invisible marks reported as codepoint, count, and line:col instead of a quote?
42. Are findings grouped by severity (P0, P1, P2)?
43. Did you avoid scoring the draft — no percentage, no grade, no "reads 70% AI"?
44. Did you avoid claiming or guessing AI authorship?
45. Did you avoid rewriting, even where the fix was obvious?
46. Did you offer to run the rewrite?

## Final output

47. Does the response match the output format for the mode (rewrite: four sections; generate: three; detect: two; edit: a short report, not the full file)?
48. In rewrite and generate modes, did the second pass actually re-read the new draft, rather than restating the first pass's changes?
49. In edit mode, did you re-read the file after editing and confirm the flagged spans are resolved?
