# IELTS Speaking — Evals

Run these 10 pass/fail checks after every skill execution.

## 话题分组模式

| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | **分组数量** | Exactly 5 groups (or fewer if < 25 topics provided) | Wrong group count |
| 2 | **覆盖率计算** | coverage_percent = total_covered / 50 * 100, matches actual mapping | Calculation wrong |
| 3 | **每个话题有归属** | Every topic assigned to exactly one group | Topic missing or duplicated |

## 故事生成模式

| # | Check | Pass | Fail |
|---|-------|------|------|
| 4 | **Part 2 字数** | Answer is 200-250 words (2 min speaking) | Too short (< 150) or too long (> 300) |
| 5 | **口语化** | Uses contractions, filler phrases ("The thing is...", "I'd say..."), no academic register | Formal written English |
| 6 | **关键表达标注** | 2-3 uncommon but natural expressions marked with function + alternatives | No expressions or only basic ones |
| 7 | **Part 3 追问** | 4-6 follow-up questions with answer framework (position + reason + example) | Fewer than 4 or no framework |

## 数据持久化

| # | Check | Pass | Fail |
|---|-------|------|------|
| 8 | **故事文件保存** | Story saved to ~/.ielts/speaking/stories/story-{NN}-{theme}.md | File not written |
| 9 | **话题映射更新** | topic-map.json updated with group + coverage recalculation | JSON invalid or coverage not recalculated |
| 10 | **练习提醒** | Output includes reminder to practice with Gemini Live / ChatGPT Voice | Reminder missing |
