---
name: good-morning
description: "Morning cold-start: recover context, scan recent activity, output bilingual momentum summary, auto-update STATUS.md. Non-interactive by default. Triggers on: good morning, 早安, 開始今日, 今日做咩, cold start, morning, 點開始, what's up, start my day."
metadata:
  version: 2.0.0
---

# Good Morning

Non-interactive morning context recovery. Reads STATUS.md, scans recent activity, outputs a bilingual momentum summary with narrative analysis, and auto-updates STATUS.md.

---

## Core Rules

1. **Non-interactive by default.** Output the summary directly. Do NOT ask "四件事" or any questions. At the end, offer an optional interactive prompt.
2. **Bilingual output.** Summary in Cantonese (粵語), structured data in English.
3. **Auto-update STATUS.md.** Update the date and append to momentum trend automatically.
4. **Trust the data.** If STATUS.md is stale or missing, say so — don't ask what to do.
5. **Narrative over tables.** Active Threads, Sessions, and Recommendations should be written as short paragraphs with context — not compressed one-liners.

---

## Workflow

### Step 1: Read Sources (parallel)

Read all sources in parallel:

1. **STATUS.md** — `~/.claude/STATUS.md`
2. **Recent git log** — `git log --oneline -15 --since="3 days ago"` (run in home directory)
3. **Recent file changes** — `find ~ -name "*.md" -mtime -3 -not -path "*/.git/*" -not -path "*/node_modules/*" 2>/dev/null | head -20`
4. **Session log** — `~/.claude/session-log.md` (if exists, read last 10 lines)
5. **Session transcripts** — `python3 ~/.claude/scripts/session-summary.py 48` (last 48 hours of Claude Code sessions)
6. **Learning tracker** — `~/.claude/progress/learning-tracker.md` (if exists)

### Step 2: Generate Momentum Summary

Output the following structure. **Key principle: narrative over tables.** Write like a briefing, not a dashboard.

```markdown
## 🌅 今日 Good Morning

### Momentum State

| Field | Value |
|---|---|
| **Active Threads** | [count] ([names]) |
| **Last Session** | [date] |
| **Last Artifact** | [name + tier] |
| **Momentum Score** | [1-5] — [reason] |
| **STATUS.md Freshness** | [Fresh / Stale (X days)] |

### Active Threads

For each active thread, write a **2-3 sentence narrative** covering:
1. **Context** — what's been done, what data/artifacts exist
2. **Status** — where it stands (days since last touch, blockers)
3. **Next Action** — concrete next step with time estimate

Format:
> **[Thread Name]** — [Context sentence with specific data]. Last touched [X] days ago. Next: [specific action] ([time estimate]).

### Recent Activity (Last 3 Days)

Group by theme, not chronological list. Write 1-2 sentences per theme:
- **[Theme name]** — [what happened across related files/sessions]
- **[Theme name]** — [what happened across related files/sessions]

If nothing happened in last 3 days, say so plainly.

### Recent Sessions (from Transcripts)

Group sessions by theme (not chronological). For each group:
- **[Theme]** — [N] sessions ([dates]). [One sentence summarizing what was attempted and outcome].

Skip sessions < 1 min (likely just context recovery).

### Mode Decision

Analyze momentum score + active threads + recent activity to recommend:

```markdown
### Mode Decision

**Recommended Mode:** [Explore / Execute]
**Reason:** [1-2 sentences explaining why]
**Timebox:** [30 / 45 / 60 / 90 min]
**Energy Routing:** [Low/Medium/High] → [suggested activity type + duration]
```

Energy routing table:
| Energy | + Execute | + Explore |
|--------|-----------|-----------|
| High | Deep work experiment (60-90 min) | Signal deep dive, new question allowed |
| Medium | Continue current experiment (45-60 min) | Signal processing, existing thread only |
| Low | Artifact cleanup (30 min) | Review existing signals, no new experiment |

If energy is not recorded, recommend Medium as default and note it.

### Today's Recommendation

Write a **2-3 sentence narrative** recommendation, not a table. Include:
1. Which thread to focus on and why
2. What specific artifact to produce
3. How it connects to recent momentum

Format:
> 今日建議：[thread name] — [specific action]. [Why this thread, referencing recent activity or momentum score]. 完成後 [secondary action if applicable].

### Learning Status

If learning-tracker.md exists, include:
```markdown
### Learning Status

- **Mastery:** [X/Y topics, Z%]
- **Top unresolved gaps:** [list up to 3, or "None"]
- **Last study session:** [date]
```

If tracker doesn't exist, skip this section.

### Staleness Warnings

If STATUS.md last session date > 2 days ago:
> ⚠️ STATUS.md 已經 [X] 日冇更新。建議跑完今日工作後用 /update-status 更新。

If no active threads:
> ⚠️ 冇 active thread。建議用 /signal-recommend 探索新方向。

### Weekly Review Check

If today is Friday and last Weekly Review was > 7 days ago:
> ⚠️ 今日係 Friday，Weekly Review 已 overdue（上次 [date]）。建議收工前 run 一次。

If last Weekly Review > 10 days ago (any day):
> ⚠️ Weekly Review 已 overdue [X] 日。建議盡快 run 一次。

### Interactive Prompt (optional)

At the very end, after all output, add:

> ---
> 想深入傾今日方向？答 **Y** 進入互動模式（Mode Routing + Experiment Design）。

If user responds Y, continue with:
1. Ask energy level (Low / Medium / High)
2. Run Mode Decision with user's energy
3. Generate Experiment Design (Objective, Question, Method, Timebox, Exit Criteria, Success Criteria, Momentum Score)
4. If Momentum Score ≤ 2, run Momentum Gate: "呢個 experiment 點樣推進現有 thread？"
```

### Step 3: Auto-Update STATUS.md

Update the following fields in `~/.claude/STATUS.md`:

1. **Last Session Date** — update to today's date
2. **Momentum Score Trend** — append new row:
   ```
   | [date] | [score] | Good Morning auto-recovery |
   ```

Do NOT modify:
- Active Threads content (unless obviously stale)
- Completed / Unfinished lists (these require session context)
- Weekly Review Log

### Step 4: Confirm (brief)

Output a one-line confirmation:

```
✅ STATUS.md 已更新。今日建議：[one-line summary of recommendation]
```

---

## Edge Cases

| Situation | Action |
|---|---|
| STATUS.md doesn't exist | Create from template (see below), mark as "首次 session" |
| STATUS.md is empty / corrupted | Flag it, output what you can from git log |
| No git history | Skip Recent Activity section |
| No active threads | Suggest /signal-recommend |
| Session log doesn't exist | Skip, will be created by Stop hook |

---

## STATUS.md Template

If STATUS.md doesn't exist, create it:

```markdown
---
title: "STATUS.md — Momentum OS State Persistence"
date: [today]
tags:
  - momentum-os
  - state-persistence
  - cold-start
status: active
type: system-file
---

# STATUS.md

> Source of truth for Momentum OS context recovery.
> Update at end of every session. Read at start of every session.

---

## Active Threads

### Thread 1 — (Slot Available)

Maximum 3 active threads.

### Thread 2 — (Slot Available)

### Thread 3 — (Slot Available)

---

## Energy Baseline

**Last Recorded:** Not yet tracked
**Pattern:** Unknown

---

## Last Session

**Date:** [today]

**Completed:**
- (first session)

**Unfinished:**
- (none yet)

**Next Action:**
- Run /signal-recommend to explore directions

---

## Momentum Score Trend

| Date | Score | Note |
|------|-------|------|
| [today] | 3 | First session — no existing threads |

---

## Weekly Review Log

> Keep last 4 entries only.

| Date | Threads Reviewed | Decisions | Focus Next Week |
|------|-----------------|-----------|-----------------|

**Last Review:** Not yet performed
**Next Review:** [next Friday]
```

---

## Good Output Example

### Example: Typical Morning (Existing Threads)

**Input:** User says "start my day"

**Output:**

```markdown
## 🌅 今日 Good Morning

### Momentum State

| Field | Value |
|---|---|
| **Active Threads** | 2 (Agent-Native Work, IELTS Preparation) |
| **Last Session** | 2026-06-07 |
| **Last Artifact** | /archive skill (Tier 3, complete) |
| **Momentum Score** | 4 — Existing Thread, strong continuation |
| **STATUS.md Freshness** | Fresh (today) |

### Active Threads

> **Agent-Native Work** — Peter Yang 5-step framework 已部署到 41 個 skills，skill-linter meta-skill 完成。依家處於 memory accumulation phase — skills 自動寫 memory.md，但仲未有足夠數據驗證效果。上次碰係今日。Next: 用 /skill-linter 跑一次新 skills 嘅質量檢查（30 min）。

> **IELTS Preparation** — Vocab system v3.1.0 已建好：140 個 academic words 喺 Obsidian 用 checkbox 跟蹤，auto-recommend 從 CSV 抽取。系統就緒但第一次 review 未做。上次碰係今日。Next: 跑第一次 vocab review（140 words, 45 min），完成後加更多 words。

### Recent Activity (Last 3 Days)

- **Skill 生態系統** — 建咗 /archive（content type routing）同 /design-skill（Draft-Review-Apply workflow），加咗 hooks 到 settings.json，更新 CLAUDE.md 加入 4 條新規則。呢啲全部屬於 Agent-Native Work thread。
- **IELTS** — Vocab workflow 從零開始建到 v3.1.0，包含 CSV → Obsidian → SRS 嘅完整 pipeline。

### Recent Sessions (from Transcripts)

- **Skill 建設** — 3 sessions（6/7）。建咗 /archive、/design-skill、/start-day，加 hooks，改 CLAUDE.md。全部完成。
- **IELTS 備考** — 2 sessions（6/7）。建咗 vocab skill、push 到 GitHub、處理 N1 vocab PDF。Vocab 系統就緒，review 未開始。

### Mode Decision

**Recommended Mode:** Execute
**Reason:** 2 條 active thread 都有明確 next step，Momentum Score 4（strong continuation）。冇需要 explore 新方向。
**Timebox:** 60 min
**Energy Routing:** Medium → Continue current experiment (45-60 min)

### Today's Recommendation

今日建議：IELTS Preparation — 跑第一次 vocab review。你依家有 140 個 words 喺 Obsidian 等你 review，系統就緒但從未實際用過。呢個係最 tangible 嘅下一步 — 完成後唔止推進 thread，仲可以驗證成個 workflow 係咪 work。如果 review 完仲有時間，跟住做 Agent-Native Work 嘅 /skill-linter 檢查。

### Learning Status

- **Mastery:** 3/3 topics (100%)
- **Top unresolved gaps:** None
- **Last study session:** 2026-06-06

---
想深入傾今日方向？答 **Y** 進入互動模式（Mode Routing + Experiment Design）。

✅ STATUS.md 已更新。今日建議：IELTS vocab review 係最 tangible 嘅下一步，完成後 run /skill-linter。
```

---

## Changelog

### v2.0.0 (2026-06-13)
- **Narrative over tables**: Active Threads, Sessions, and Recommendations now written as 2-3 sentence briefings with context, not compressed one-liners
- **Mode Decision section**: Replaces simple recommendation table with Explore/Execute routing, timebox, and energy-based suggestions
- **Learning Status**: Reads from learning-tracker.md, shows mastery % and gaps
- **Session grouping**: Recent Sessions grouped by theme instead of chronological list
- **Activity grouping**: Recent Activity grouped by theme with cross-reference to threads
- **Weekly Review check**: Flags overdue weekly reviews (>7 days since last, or Friday without review this week)
- **Optional interactive mode**: End with "答 Y 進入互動模式" — expands to Mode Routing + Experiment Design + Momentum Gate
- **Learning tracker added** as Step 1 source (#6)

### v1.1.0 (2026-06-07)
- Added session transcript reading via `~/.claude/scripts/session-summary.py`
- Reads last 48 hours of Claude Code session transcripts
- Shows skills invoked, files modified, and user intent per session
- Syncs state from OTHER sessions to STATUS.md

### v1.0.0 (2026-06-07)
- Initial release
- Non-interactive context recovery
- Bilingual output (Cantonese summary + English data)
- Auto STATUS.md update (date + momentum trend)
- Merged good-morning context recovery + update-status persistence
- Edge case handling for missing/corrupted STATUS.md
