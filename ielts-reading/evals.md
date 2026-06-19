# IELTS Reading — Evals

Run these 10 pass/fail checks after every skill execution.

## 错题分析模式

| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | **题型分类** | Every question tagged with correct type (T/F/NG, Matching, Completion, MC) | Missing type or wrong type |
| 2 | **T/F/NG 逻辑** | T/F/NG questions follow 3-step logic: topic exists? → same or opposite? → insufficient info? | Skipped steps or wrong conclusion |
| 3 | **定位有原文引用** | Every error analysis includes specific paragraph + sentence from passage | No source quote or vague "paragraph X" |
| 4 | **同义替换对格式** | Synonym table has: 题目用词, 原文用词, 出处. Every row has all 3 fields | Missing fields or empty rows |
| 5 | **推导链完整** | Each wrong answer has: 定位 → 同义替换 → 错因 → 正确推导 | Missing any step |

## 同义替换库更新

| # | Check | Pass | Fail |
|---|-------|------|------|
| 6 | **无重复 pairs** | New pairs not already in synonym-bank.json | Duplicate pair added |
| 7 | **JSON 有效** | synonym-bank.json remains valid JSON after update | Parse error |

## 报告完整性

| # | Check | Pass | Fail |
|---|-------|------|------|
| 8 | **有总览** | Report includes: 文章, 题数, 得分, 错题列表 | Missing any field |
| 9 | **有错因总结** | Report ends with: 主要错因 + 需要练的 | Missing summary |
| 10 | **数据持久化** | Session saved to ~/.ielts/reading/sessions/ and progress.json updated | File not written or JSON invalid |
