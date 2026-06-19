# Evals — DOCX Toolkit
> Pass/fail checks for document quality.

## New Document Creation (docx-js)
- [ ] Document opens without errors in Word / LibreOffice / Google Docs
- [ ] Formatting matches specification (fonts, sizes, colors, alignment)
- [ ] Sections, headings, and paragraphs follow logical hierarchy
- [ ] Page breaks occur at appropriate points

## Editing Existing Documents
- [ ] Unpack -> edit -> pack workflow is followed
- [ ] Existing formatting is preserved (not overridden with defaults)
- [ ] Tracked changes use minimal, precise edits (only changed text marked, not whole sentences)
- [ ] RSID values are reused from original document for unchanged text

## Redlining / Tracked Changes
- [ ] Changes are batched in groups of 3-10 for debuggability
- [ ] XML grep is run immediately before each script to get current line numbers
- [ ] Final verification: pandoc conversion confirms all changes applied correctly
- [ ] No unintended changes introduced (only requested edits present)

## Edge Cases
- [ ] Comments are preserved when editing document body
- [ ] Embedded images/media are not corrupted by edits
- [ ] Large documents (50+ pages) are handled without memory issues
- [ ] PDF conversion (via LibreOffice) produces correct visual output

---
Score: X/Y passed
