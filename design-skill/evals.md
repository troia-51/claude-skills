# Design Skill — Evals

Run after every execution. Fix before reporting completion.

| # | Check | Category | Pass | Fail |
|---|-------|----------|------|------|
| 1 | Phase 1 (Requirements) completed before Phase 2 (Draft) | Process | Requirements shown first | Skipped to draft |
| 2 | Draft presented as code block, NOT written to file | Process | Code block shown | File written without approval |
| 3 | User explicitly approved before file write | Process | "A" / "批准" / "ok" received | Auto-wrote without confirmation |
| 4 | SKILL.md has valid YAML frontmatter | Output Quality | `---` + name + description | Missing or malformed |
| 5 | SKILL.md has trigger phrases in description | Output Quality | "Triggers on:" present | No trigger phrases |
| 6 | SKILL.md has workflow steps (numbered) | Output Quality | 3+ steps | No clear steps |
| 7 | SKILL.md has error handling section | Output Quality | Table or list present | No error handling |
| 8 | Modification proposals show Before/After diff | Process | Diff format used | No diff shown |
| 9 | Scope confirmed before each change | Process | "講邊度要改" asked | Changes applied without asking |
| 10 | Cantonese UI, English code/technical | Language | Mixed correctly | Wrong language |
| 11 | Phase 6: STATUS.md updated after skill creation | Process | Last Session + Momentum Trend updated | STATUS.md unchanged |

## Auto-Fix Triggers

- If check 2 fails: Stop, output draft as code block
- If check 3 fails: Stop, ask for explicit approval
- If check 4 fails: Add frontmatter with name + description
- If check 8 fails: Re-present with Before/After format
