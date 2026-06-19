# Skill Linter — Memory

Track audit history, common issue patterns, and auto-fixes applied.

## Format

Each entry: `- [YYYY-MM-DD] learning sentence`

## Audit History

| Date | Skills Audited | Avg Score | Top Issue |
|------|---------------|-----------|-----------|
| 2026-06-07 | 41 | 5.2/7 | Meta cross-refs (23/41 FAIL), Context examples (9/41 FAIL) |

## Common Issue Patterns

Track recurring gaps across audits. Update after each full audit.

- Missing evals.md — (count: 32 → fixed to 0)
- Missing memory.md — (count: 32 → fixed to 0)
- No output examples — (count: 9 → fixed to ~4)
- Vague triggers — (count: 3 → fixed to ~1)
- AI slop detected — (count: 2 skills, paper-analyze + start-my-day → fixed)

## Auto-Fixes Applied

| Date | Skill | Fix Type | Description |
|------|-------|----------|-------------|
| 2026-06-07 | 32 skills | Create evals.md | Added domain-specific pass/fail checks |
| 2026-06-07 | 32 skills | Create memory.md | Added template with Learnings section |
| 2026-06-07 | 8 skills | Add examples | Added Good Output Examples to SKILL.md |
| 2026-06-07 | 10 skills | Add cross-refs | Added Integration/Follow-up sections |
| 2026-06-07 | slack-gif-creator | Create SKILL.md | Was 0/7, now functional |
| 2026-06-07 | cfp-study | Create SKILL.md | Was 0/7, now functional |
| 2026-06-07 | conf-papers.backup | Delete | Identical duplicate removed |
| 2026-06-07 | paper-analyze | Dedup | Removed 107 lines of duplicate content |
| 2026-06-07 | start-my-day | Dedup | Removed 55 lines of duplicate content |
| 2026-06-07 | theme-factory | Fix trigger+slop | Added explicit triggers, removed redundancy |

## Learnings

- [2026-06-07] Initial creation. Most skills in the ecosystem lack evals.md and memory.md — this is the highest-impact gap to close.
- [2026-06-07] First full audit: 41 skills, avg 5.2/7. Meta cross-refs is the most common failure (23/41). Skills that reference each other form a network, not islands.
