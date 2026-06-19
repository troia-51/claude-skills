# Skill Linter — Evals

Run these 10 pass/fail checks after every skill audit execution.

## Discovery (Step 1)

| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | **Skill discovery complete** | All directories in `~/.claude/skills/` scanned, symlinks resolved | Missed directories or failed to resolve symlinks |
| 2 | **Non-skills skipped** | Directories without SKILL.md are excluded from report | Non-skill directories included in audit |

## Scoring (Steps 2-3)

| # | Check | Pass | Fail |
|---|-------|------|------|
| 3 | **Catches missing evals.md** | Skills without evals.md scored FAIL on Evals dimension | Skill missing evals.md but scored PASS or WARN |
| 4 | **Catches missing memory.md** | Skills without memory.md scored FAIL on Memory dimension | Skill missing memory.md but scored PASS or WARN |
| 5 | **Detects duplicate instructions** | Repeated paragraphs or instructions flagged under Staleness | Duplicate content present but not flagged |
| 6 | **Flags vague rules** | Generic/hedging language flagged under Staleness | Vague rules present but scored PASS |

## Cross-Reference (Step 4)

| # | Check | Pass | Fail |
|---|-------|------|------|
| 7 | **Orphan detection works** | Skills not referenced by any other skill flagged under Meta | Orphaned skill scored PASS on Meta |

## Output (Step 5)

| # | Check | Pass | Fail |
|---|-------|------|------|
| 8 | **Report has all columns** | Summary table includes all 7 dimensions + Score | Missing columns in report |
| 9 | **Actionable recommendations** | Each FAIL includes a specific fix suggestion | FAIL listed without fix guidance |
| 10 | **Auto-fix offers confirmation** | Auto-fix mode asks before modifying any file | Auto-fix applied without user confirmation |
