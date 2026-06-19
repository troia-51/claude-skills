# Evals — Tutor Setup
> Pass/fail checks for StudyVault generation quality.

## Mode Detection
- [ ] Correctly detects Codebase Mode when package.json / Cargo.toml / etc. exists
- [ ] Correctly detects Document Mode when no project markers found
- [ ] Announces detected mode and asks user to confirm before proceeding
- [ ] Tie-break: .git/ alone without source files defaults to Document Mode

## Document Mode - Content Fidelity
- [ ] Source-to-note mapping is verified (not guessed from filename)
- [ ] Every topic/subtopic from source gets a dedicated note (Equal Depth Rule)
- [ ] source_pdf in frontmatter matches verified Phase D1 mapping
- [ ] Practice questions exist for every topic folder (8+ per file)

## Document Mode - Structure
- [ ] StudyVault/ directory created with numbered folders
- [ ] Dashboard contains: MOC, Quick Reference, Exam Traps
- [ ] Tag vocabulary is English, lowercase, kebab-case
- [ ] Every concept note has `## Related Notes` with wiki-links

## Codebase Mode - Accuracy
- [ ] Tech stack detection matches actual project files
- [ ] Architecture notes reflect real code patterns (not generic descriptions)
- [ ] Module boundaries match actual code organization
- [ ] Onboarding exercises are grounded in real code, not hypothetical

## Format Rules
- [ ] Uses pdftotext CLI for PDF extraction (NOT Read tool on PDFs)
- [ ] YAML frontmatter uses double-quoted strings
- [ ] Tags are always English regardless of note language
- [ ] CWD boundary rule respected -- no files accessed outside CWD

---
Score: X/Y passed
