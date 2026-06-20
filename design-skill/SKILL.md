---
name: design-skill
description: "Design, create, or modify Claude Code skills with a structured Draft-Review-Apply workflow. Triggers on: design skill, 建 skill, 改 skill, create skill, 修改 skill, new skill, skill 設計, build skill. Use when the user wants to create a new skill or modify an existing one."
metadata:
  version: 1.0.0
---

# Design Skill

Structured workflow for creating and modifying Claude Code skills. Prevents scope creep and unwanted changes through a mandatory Draft-Review-Apply gate.

---

## Core Rules (Non-Negotiable)

> ⚠️ This skill overrides the global execute-first rule — confirmation is required before any SKILL.md modification.

1. **Never write SKILL.md without approval.** Always present as code block first.
2. **Never add features the user didn't request.** If tempted, ask first.
3. **Confirm scope before each change.** State what will change and wait.
4. **One change at a time.** Don't batch multiple modifications into one draft.

---

## Workflow

### Phase 1: Requirements

Gather and confirm requirements before drafting. Output a structured summary:

```markdown
## 需求確認

**Goal:** [What the skill does, one sentence]

**Trigger:** [When it activates — slash command + natural language phrases]

**Scope:**
- [What it DOES]
- [What it does NOT do]

**Anti-patterns:**
- [What it should never do]
- [Known failure modes to handle]

**Output:** [What the user gets — note, summary, action, etc.]
```

**Wait for user confirmation before proceeding.** If user says "改" or "唔係咁", revise and re-present.

### Phase 2: Draft

Generate the complete SKILL.md content. Present as a fenced code block:

````markdown
```markdown
---
name: [skill-name]
description: "[description with trigger phrases]"
metadata:
  version: 1.0.0
---

# [Skill Title]

[Content...]
```
````

**Do NOT write to disk.** The code block IS the deliverable for review.

Include in the draft:
- YAML frontmatter (name, description with triggers, version)
- Clear workflow steps (numbered)
- Error handling section
- Good output examples (at least one)

### Phase 3: Review

After presenting the draft, explicitly ask:

> 呢個係 SKILL.md 草稿。你可以：
> A. **批准** — 我寫入檔案
> B. **修改** — 講邊度要改，我重新出草稿
> C. **暫停** — 之後再繼續

**Wait for user response.** Do not proceed until user chooses A.

If user chooses B:
1. Listen to their specific feedback
2. Revise ONLY the parts they mentioned
3. Present the updated draft
4. Return to this phase

### Phase 4: Apply

Only after user explicitly approves (says "A", "批准", "ok", "寫入", etc.):

1. Determine the skill path:
   - New skill: `~/.claude/skills/[skill-name]/SKILL.md`
   - Existing skill: read current path first

2. Check permissions:
   - If `~/.claude/skills/` is writable → write directly
   - If blocked → output final content as code block with instruction:
     > 權限限制，請手動複製以下內容到 `~/.claude/skills/[name]/SKILL.md`

3. After writing, confirm:
   > ✅ 已寫入 `~/.claude/skills/[name]/SKILL.md`

### Phase 5: Test

After the skill is written, offer to test:

> 要唔要即刻測試？講 `/[skill-name]` 或提供測試輸入。

If user wants to test:
1. Invoke the skill with sample input
2. Observe behavior
3. Report results
4. If issues found → return to Phase 2 (Draft) with fixes

### Phase 6: Update STATUS.md

After the skill is written and tested (or user skips testing), update STATUS.md:

1. Read `~/.claude/STATUS.md`
2. Update the **Last Session** section:
   - **Date:** today's date
   - **Completed:** add "Created/Modified /skill-name skill"
   - **Next Action:** add any follow-up items (e.g., "Test /skill-name with real input")
3. Append to **Momentum Score Trend** table:
   ```
   | [date] | [score] | Skill design: /skill-name |
   ```
4. If the skill relates to an existing thread, update that thread's **Current Artifact** field

Output confirmation:
```
✅ STATUS.md 已更新 — 記錄咗 /skill-name 嘅創建/修改。
```

---

## For Existing Skills (Modification)

When modifying an existing skill:

1. **Read current SKILL.md** first
2. **Show current state** — summarize what exists
3. **Identify changes** — list exactly what will be modified
4. **Present diff** — show old vs new for each change
5. **Wait for approval** before applying

Format for modification proposals:

```markdown
## 修改提案

### Change 1: [Description]
**Before:**
[Current content]

**After:**
[Proposed content]

### Change 2: [Description]
**Before:**
[Current content]

**After:**
[Proposed content]
```

---

## SKILL.md Template

Use this as the starting structure for new skills:

```markdown
---
name: [kebab-case-name]
description: "[What it does]. Triggers on: [trigger1], [trigger2], [trigger3]."
metadata:
  version: 1.0.0
---

# [Skill Title]

[One-paragraph description of what the skill does and when to use it.]

---

## Core Rules

1. [Non-negotiable rule 1]
2. [Non-negotiable rule 2]

---

## Workflow

### Step 1: [Action]

[Description]

### Step 2: [Action]

[Description]

---

## Error Handling

| Error | Action |
|---|---|
| [Error 1] | [Action 1] |
| [Error 2] | [Action 2] |

---

## Good Output Examples

### Example 1: [Scenario]

**Input:** [What user provides]

**Output:** [What skill produces]
```

---

## Naming Conventions

- Skill name: `kebab-case` (e.g., `conversation-archive`, `good-morning`)
- Directory: `~/.claude/skills/[skill-name]/`
- File: `SKILL.md` (always uppercase)
- Version: `semver` (e.g., 1.0.0, 2.1.0)

---

## Error Handling

| Error | Action |
|---|---|
| Permission denied writing to ~/.claude/skills/ | Output as code block, ask user to copy |
| User wants to modify non-existent skill | Ask if they want to create it instead |
| Draft is too long (>500 lines) | Split into sections, review one at a time |
| User says "改" without specifics | Ask one focused question about what to change |

---

## Changelog

### v1.1.0 (2026-06-07)
- Added Phase 6: Auto-update STATUS.md after skill creation/modification
- Updates Last Session (Completed + Next Action)
- Appends to Momentum Score Trend
- Updates related thread's Current Artifact if applicable

### v1.0.0 (2026-06-07)
- Initial release
- Draft-Review-Apply workflow
- Modification diff format
- SKILL.md template
- Permission-aware file writing
