# skill-linter

Meta-skill that audits other Claude Code skills for quality, completeness, and staleness.

## What It Checks

Scores each skill across 7 dimensions:

1. **Context** — Does it have output examples?
2. **Trigger** — Are activation conditions clear?
3. **Evals** — Does evals.md exist with meaningful checks?
4. **Memory** — Does memory.md exist for learnings?
5. **Meta** — Is it referenced by other skills?
6. **Docs** — Is SKILL.md well-structured?
7. **Slop** — Any duplicate instructions, vague rules, or AI filler?

## How to Use

```
/skill-linter              # audit all skills
/skill-linter good-morning # audit one skill
/skill-linter --fix        # audit + offer auto-fixes
```

Also responds to: "lint skills", "audit skills", "check skill quality"

## Output

- Summary table with PASS/WARN/FAIL per dimension
- Per-skill detail for anything scoring below 7/7
- Aggregate patterns and prioritized recommendations
- Auto-fix offers (with confirmation) for missing files

## Files

- `SKILL.md` — Main skill logic and audit process
- `evals.md` — 10 pass/fail checks for the linter itself
- `memory.md` — Audit history and pattern tracking
- `README.md` — This file

## Based On

Peter Yang's 5-step self-improving agent framework:
Step 1 (Context) → Step 2 (Trigger) → Step 3 (Evals) → Step 4 (Memory) → Step 5 (Meta)
