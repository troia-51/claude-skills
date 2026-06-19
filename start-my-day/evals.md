# Evals — Start My Day
> Pass/fail checks for daily paper recommendation quality.

## Search & Scoring
- [ ] Searches arXiv API with correct categories (cs.AI, cs.LG, cs.CL, cs.CV, etc.)
- [ ] Scoring weights match spec: relevance 40%, recency 20%, popularity 30%, quality 10%
- [ ] Top 10 papers are returned, sorted by score descending
- [ ] Existing notes are checked before generating new analysis (no duplicates)

## Recommendation Note
- [ ] File is saved at `10_Daily/YYYY-MM-DD论文推荐.md` (or English equivalent)
- [ ] "Today's Overview" section summarizes main directions, trends, and reading suggestions
- [ ] All papers use unified format with wikilink display alias
- [ ] Frontmatter includes keywords and tags: `["llm-generated", "daily-paper-recommend"]`

## Top 3 Special Treatment
- [ ] Top 3 papers have images extracted and embedded (wikilink syntax)
- [ ] Top 3 papers trigger `/paper-analyze` for detailed report (if no existing note)
- [ ] Existing notes are referenced via wikilink, not regenerated

## Format Rules
- [ ] Wikilinks use display alias: `[[File_Name|Display Title]]` (bare wikilinks forbidden)
- [ ] Images use `![[filename.png|600]]` (markdown image syntax forbidden)
- [ ] Placeholder uses `--` not `---` (which Obsidian parses as horizontal rule)
- [ ] Language matches config setting for all section headers

---
Score: X/Y passed
