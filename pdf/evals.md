# Evals — PDF Toolkit
> Pass/fail checks for PDF processing quality.

## Text Extraction
- [ ] Extracted text preserves paragraph structure (not a wall of text)
- [ ] Tables are extracted with correct row/column alignment
- [ ] Page boundaries are respected (content does not bleed across pages)
- [ ] Scanned PDFs fall back to OCR (pytesseract) when text extraction fails

## PDF Creation
- [ ] Output PDF opens without errors in standard viewers
- [ ] Multi-page documents have correct page breaks
- [ ] Text renders with correct fonts (no missing glyphs)
- [ ] Metadata (title, author) is set correctly

## Merge / Split / Rotate
- [ ] Merged PDFs maintain correct page order
- [ ] Split PDFs contain exactly the specified page ranges
- [ ] Rotated pages display correctly in viewers

## Edge Cases
- [ ] Password-protected PDFs are handled (decrypt or report limitation)
- [ ] Encrypted output uses correct user/owner passwords
- [ ] Large PDFs (100+ pages) do not cause memory issues
- [ ] Form filling preserves form field interactivity (see FORMS.md)

---
Score: X/Y passed
