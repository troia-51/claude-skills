---
name: skill-linter
description: |
  Meta-skill: audit other Claude Code skills for quality, completeness, and staleness.
  Reports scores across 7 dimensions with actionable recommendations.
  Can auto-fix common issues (missing files, vague rules) with user confirmation.
  Use when the user says "/skill-linter", "lint skills", "audit skills",
  "check skill quality", "skill quality", "skill 品質", "audit 個 skill",
  "check 下 d skills", or any intent to review skill health.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - AskUserQuestion
---

# Skill Linter — Meta-Skill Auditor

Audits Claude Code skills against Peter Yang's 5-step self-improving agent framework.
Outputs a structured report with scores, issues, and fix recommendations.

---

## When to Use

- Periodic skill health check (monthly recommended)
- After installing new skills
- Before sharing a skill repo
- When a skill feels "off" but you can't pinpoint why

---

## Audit Dimensions

Each skill is scored across 7 dimensions. Score: PASS / WARN / FAIL.

### 1. Step 1 — Context (Output Examples)

Does SKILL.md contain concrete output examples?

**PASS criteria:**
- Has a section titled "Good Output Examples", "Example Output", or "Examples"
- Contains 1+ realistic output blocks showing what the skill produces
- Examples are specific (not generic placeholders)

**WARN:** Section exists but examples are vague or only 1.
**FAIL:** No examples section at all.

### 2. Step 2 — Trigger (Clear Activation)

Does SKILL.md define when to activate?

**PASS criteria:**
- Frontmatter `description` field contains trigger phrases
- OR body has a "When to Use" / "Trigger" section
- Trigger conditions are specific (not just "use when needed")

**WARN:** Trigger exists but is vague or generic.
**FAIL:** No trigger conditions defined.

### 3. Step 3 — Evals (Quality Checks)

Does the skill have evals.md with meaningful pass/fail checks?

**PASS criteria:**
- `evals.md` exists in skill directory
- Contains a table or checklist with specific pass/fail criteria
- Has 5+ checks covering the skill's core behavior

**WARN:** File exists but checks are vague or fewer than 5.
**FAIL:** No evals.md file.

### 4. Step 4 — Memory (Learning Loop)

Does the skill have memory.md for session learnings?

**PASS criteria:**
- `memory.md` exists in skill directory
- Contains a "Learnings" section or similar
- Has format instructions for entries

**WARN:** File exists but is empty or has no format guidance.
**FAIL:** No memory.md file.

### 5. Step 5 — Meta (Cross-Reference)

Is the skill referenced by any meta-skills or integration points?

**PASS criteria:**
- Referenced by another skill (e.g., good-morning references signal-recommend)
- OR has explicit integration instructions in SKILL.md
- OR is part of a skill family/router pattern

**WARN:** Has integration hints but no concrete references.
**FAIL:** Completely standalone, no cross-references.

### 6. Documentation Quality

Is SKILL.md well-structured and complete?

**PASS criteria:**
- Has YAML frontmatter with `name` and `description`
- Has clear section structure (not just a wall of text)
- Contains error handling or edge case guidance
- Has `allowed-tools` in frontmatter (if applicable)

**WARN:** Missing frontmatter fields or has structural issues.
**FAIL:** No frontmatter, no structure, or unreadable.

### 7. Staleness / AI Slop

Does the skill have duplicate instructions, vague rules, or AI-generated filler?

**PASS:** Clean, specific, no duplication.
**WARN:** Minor issues (1-2 vague rules, slight repetition).
**FAIL indicators:**
- Duplicate paragraphs or instructions
- Phrases like "it's important to note that", "feel free to", "don't hesitate to"
- Rules that say the same thing in different words
- Excessive hedging ("you might want to consider perhaps...")
- Empty sections or placeholder text left in

---

## Audit Process

### Step 1: Discover Skills

```bash
# Find all skill directories (local and symlinked)
SKILLS_DIR=~/.claude/skills
ls -d "$SKILLS_DIR"/*/ 2>/dev/null
```

For each directory, check if it contains SKILL.md.
If the directory is a symlink, resolve it and audit the target.

### Step 2: Read Each Skill

For each skill directory:
1. Read `SKILL.md`
2. Check for `evals.md` (read if exists)
3. Check for `memory.md` (read if exists)
4. Check for `README.md` (read if exists)
5. Record the skill name from frontmatter or directory name

### Step 3: Score Each Dimension

Apply the 7 audit dimensions above.
Record: dimension name, score (PASS/WARN/FAIL), specific evidence.

### Step 4: Cross-Reference Check

After scoring all skills individually:
- Search all SKILL.md files for references to each skill name
- Identify orphaned skills (not referenced anywhere)
- Identify well-integrated skills (referenced by 2+ others)

### Step 5: Generate Report

Output the structured report (see Output Format below).

---

## Output Format

### Summary Table

```
## Skill Audit Report — [date]

| Skill | Context | Trigger | Evals | Memory | Meta | Docs | Slop | Score |
|-------|---------|---------|-------|--------|------|------|------|-------|
| name  | PASS    | PASS    | FAIL  | FAIL   | WARN | PASS | PASS | 4/7   |
```

Score = count of PASS.

### Per-Skill Detail

For each skill with issues:

```
### [skill-name] — [score]/7

**Issues:**
- [FAIL/WARN] Context: No output examples found. Add a "Good Output Examples" section.
- [FAIL] Evals: Missing evals.md. Create with 5+ pass/fail checks.

**Auto-fixable:**
- [ ] Create evals.md with template (requires confirmation)
- [ ] Add memory.md with template (requires confirmation)
```

### Aggregate Insights

```
## Patterns

- [X] skills missing evals.md (most common gap)
- [X] skills missing memory.md
- [X] skills with vague triggers
- [X] orphaned skills (not referenced by others)

## Recommendations

1. [Highest-impact fix]
2. [Second priority]
3. [Third priority]
```

---

## Auto-Fix Mode

When the user confirms, auto-fix these common issues:

### Fix 1: Create missing evals.md

Generate a starter evals.md with:
- 5 generic quality checks based on SKILL.md content
- Proper table format matching good-morning/evals.md convention
- Placeholders marked with `[TODO]` for skill-specific checks

### Fix 2: Create missing memory.md

Generate from template:
```markdown
# [Skill Name] — Memory

Capture one-sentence learnings from past sessions using this skill.

## Format

Each entry: `- [YYYY-MM-DD] learning sentence`

## Learnings

```

### Fix 3: Add trigger section

If SKILL.md has no "When to Use" section, append one based on the description field.

### Fix 4: Remove AI slop

Flag and offer to remove:
- Duplicate paragraphs
- Filler phrases
- Empty sections

**Always ask before applying fixes.** Never auto-modify without confirmation.

---

## Usage Examples

### Lint all skills

User: `/skill-linter`
or: `audit all skills`
or: `lint skills`

Action: Run full audit on all skills in `~/.claude/skills/`.

### Lint specific skill

User: `/skill-linter good-morning`
or: `check skill quality for follow-builders`

Action: Audit only the named skill.

### Lint and fix

User: `/skill-linter --fix`
or: `lint skills and fix what you can`

Action: Run audit, then offer auto-fixes for each issue found.

---

## Rules

- Never modify a skill without user confirmation
- Symlinked skills: audit the target, report the source path
- Skip directories that are not skills (no SKILL.md after checking)
- Report in bilingual format: English primary, Cantonese annotations where helpful
- Respect the existing skill directory conventions (frontmatter, file structure)
