# Evals — Extract Paper Images
> Pass/fail checks for paper image extraction quality.

## Extraction Strategy
- [ ] Attempts arXiv source package extraction first (highest priority)
- [ ] Falls back to PDF figure extraction if source package unavailable
- [ ] Falls back to TikZ/PGFplots cropping for pure-vector papers
- [ ] Filters out small icons (width/height < 200px)

## Output Quality
- [ ] Images saved to correct path: `20_Research/Papers/[domain]/[title]/images/`
- [ ] Index file (index.md) is generated with source attribution (arxiv-source / pdf-figure / pdf-extraction)
- [ ] Extracted images are actual figures, not logos or decorative elements
- [ ] Image resolution is sufficient for reading (not pixelated)

## Source Package Handling
- [ ] Downloads from `https://arxiv.org/e-print/[PAPER_ID]`
- [ ] Checks common image directories: pics/, figures/, fig/, images/, img/
- [ ] Converts PDF figures to PNG using PyMuPDF
- [ ] Handles TikZ papers by cropping figure regions from compiled PDF

## Edge Cases
- [ ] Gracefully handles download failures (reports limitation, does not crash)
- [ ] Correctly identifies arXiv ID format (YYYYMM.NNNNN)
- [ ] Returns image path list for easy integration with notes

---
Score: X/Y passed
