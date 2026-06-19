# Evals — Codebase-to-Course
> Pass/fail checks for interactive HTML course quality.

## Content Accuracy
- [ ] Course correctly explains what the codebase does (not hallucinated features)
- [ ] Code snippets referenced in course actually exist in the codebase
- [ ] Data flow descriptions match actual code behavior
- [ ] Technical vocabulary is used correctly (no misuse of terms like "API" or "middleware")

## Pedagogical Quality
- [ ] Target learner assumption is "vibe coder" -- zero CS background, no jargon without definition
- [ ] Each module connects back to a practical skill (steering AI, debugging, decisions)
- [ ] Metaphors are unique per module -- no repeated metaphors, no "restaurant" default
- [ ] Course arc moves from user-facing behavior toward code internals (outside-in)

## Interactive Elements (mandatory per SKILL.md)
- [ ] At least one Group Chat animation exists across the course
- [ ] At least one Message Flow / Data Flow animation exists
- [ ] Every module has at least one Code-to-English translation block
- [ ] Every module has at least one quiz
- [ ] Glossary tooltips appear on first use of technical terms per module

## Output Structure
- [ ] Output is a directory (not a single file) with styles.css, main.js, modules/, index.html
- [ ] styles.css and main.js are copied from references/, not regenerated
- [ ] build.sh produces a working index.html that opens in browser
- [ ] Module files contain only `<section>` content, no boilerplate

## Visual Design
- [ ] Warm palette (off-white backgrounds, warm grays) -- no cold whites/blues
- [ ] Distinctive display font for headings (NOT Inter/Roboto/Arial)
- [ ] Dark code blocks with Catppuccin-style syntax highlighting
- [ ] Alternating module backgrounds for visual rhythm

---
Score: X/Y passed
