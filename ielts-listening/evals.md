# IELTS Listening — Evals

Run these 10 pass/fail checks after every skill execution.

## 成绩录入模式

| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | **Section 统计正确** | Section 1-4 each: total=10, correct=X, accuracy=X%. Sum = 40 | Numbers don't add up |
| 2 | **Band 估算正确** | Band matches conversion table (e.g., 30-31=7.0, 26-29=6.5) | Wrong band for score |
| 3 | **题型分类** | Every wrong answer tagged with question type (Form/MC/Matching/Map/Sentence) | Missing type |
| 4 | **错因标签** | Every error uses one of the defined tags (connected_speech/spelling/synonym/distraction/speed/vocabulary/number/plural/direction/logic) | Undefined tag used |

## 报告完整性

| # | Check | Pass | Fail |
|---|-------|------|------|
| 5 | **有错因分布** | Error tag frequency table with count + percentage | Missing or counts wrong |
| 6 | **精听建议具体** | Recommendation targets weakest section + weakest type with specific drill task | Generic "多听" advice |
| 7 | **音频定位** | Wrong answers include approximate timestamp in audio | No time reference |

## 数据持久化

| # | Check | Pass | Fail |
|---|-------|------|------|
| 8 | **Session 归档** | Report saved to ~/.ielts/listening/sessions/{date}_{source}.md | File not written |
| 9 | **Progress 更新** | progress.json has by_section + by_type with correct numbers | Numbers don't match report |
| 10 | **错题本更新** | Error tags pushed to ~/.ielts/errors/notebook.json with subject=listening | Not updated or wrong subject |
