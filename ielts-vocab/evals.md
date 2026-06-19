# IELTS Vocab — Evals

Run these 10 pass/fail checks after every skill execution to validate output quality.

## Auto-Recommend Mode

| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | **Word count** | Recommended exactly 70 words (or all available if < 70) | Count is wrong or silently skipped words |
| 2 | **No duplicates** | Every recommended word is NOT already in bank.json | A word already in bank was recommended again |
| 3 | **Filter criteria** | All words pass: frequency 5-25, length > 4, definition > 25 chars | A word outside filter criteria was included |
| 4 | **Stagger correct** | next_review staggered: words 1-10 = today, 11-20 = tomorrow, 21-30 = day+2, etc. | All words have the same next_review date |

## Review Mode

| # | Check | Pass | Fail |
|---|-------|------|------|
| 5 | **SRS box logic** | Correct answer: box += 1 (max 5). Wrong answer: box = 1 | Box didn't change, or went above 5, or wrong answer didn't reset |
| 6 | **Interval calculation** | next_review = today + BOX_INTERVAL[box] where intervals = {1:1, 2:2, 3:4, 4:8, 5:16} | Interval doesn't match the box's defined interval |
| 7 | **Due word selection** | Reviewed words have next_review <= today, max 70, oldest first | Reviewed a word not yet due, or exceeded 70 limit |

## Obsidian Sync

| # | Check | Pass | Fail |
|---|-------|------|------|
| 8 | **Format correct** | Every word line: `- [ ] **word** — definition` with Traditional Chinese definition | Wrong format, simplified Chinese, missing checkbox/bold/dash |
| 9 | **Frontmatter valid** | YAML frontmatter has: title, date, tags (ielts, vocab, reading), status, type | Missing fields or wrong date format |

## Data Integrity

| # | Check | Pass | Fail |
|---|-------|------|------|
| 10 | **Stats match reality** | stats.total = len(words). stats.new = box 1 count. stats.learning = box 2+3. stats.mastered = box 5 | Any stat doesn't match actual word distribution |

---

## How to Use

After executing any ielts-vocab mode, run through the relevant checks:

- **Auto-recommend** → checks 1-4
- **Review** → checks 5-7
- **Obsidian sync** → checks 8-9
- **Any mode** → check 10

If any check fails, fix the issue before reporting completion to the user.
