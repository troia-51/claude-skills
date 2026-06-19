# Evals — PPTX Toolkit
> Pass/fail checks for presentation quality.

## New Presentation (html2pptx)
- [ ] Design approach is stated before writing code (content-informed color/font choice)
- [ ] Fonts are web-safe only (Arial, Helvetica, Georgia, etc. -- no Inter/Roboto)
- [ ] Charts/tables use two-column or full-slide layout (never vertically stacked under text)
- [ ] Visual validation via thumbnail.py shows no text cutoff or overlap

## Template-Based Creation
- [ ] Template inventory lists EVERY slide with index and description
- [ ] Layout structure matches content (2 items -> 2-column, not forced into 3-column)
- [ ] Slide indices in rearrange.py are within template range (no out-of-bounds)
- [ ] Replacement JSON includes paragraph properties (bold, bullet, alignment) not just text

## Editing Existing Presentations
- [ ] OOXML validation passes after each edit batch
- [ ] Unpack -> edit -> pack workflow is followed (no direct .pptx manipulation)
- [ ] Typography and colors extracted from theme before editing

## Output Quality
- [ ] Presentation opens without errors in PowerPoint / LibreOffice / Google Slides
- [ ] All slides render with correct layout and positioning
- [ ] No placeholder text remaining in final output

---
Score: X/Y passed
