# Evals — IELTS Diagnosis

> Auto-generated pass/fail checks for output quality. Run after each skill invocation.

## Data Reading & Integrity

- [ ] All 5 subject progress.json files attempted (writing, reading, listening, speaking, vocab)
- [ ] config.json read successfully with exam_date and target_score extracted
- [ ] Missing data files handled gracefully (show "尚无数据", don't crash)

## Score Calculation

- [ ] Each subject's latest score correctly extracted from most recent session
- [ ] Overall estimated score = average of available valid scores (excluding nulls)
- [ ] Trend calculation uses at least 4 sessions (recent 3 vs earlier 3); "数据不足" shown when < 4 sessions
- [ ] Days left = exam_date - today, displayed prominently

## Diagnosis Report Structure

- [ ] Report includes: 当前状态 table (科目/最近分数/目标分数/差距/趋势/Session数)
- [ ] High-frequency errors Top 5 table present with: 排名/错误标签/科目/次数/纠正方法
- [ ] Vocab & synonym stats included (total words, Box distribution, due count, synonym pairs)

## Training Plan Quality

- [ ] Weekly plan follows 80/20 rule (80% time to listening+reading, 20% to writing+speaking)
- [ ] Each day has specific subject, content, duration, and skill command
- [ ] Plan prioritizes weakest subject (largest gap to target score)
- [ ] Plan accounts for days remaining (< 30 days = increase mock exam frequency)

## Edge Cases

- [ ] Zero data scenario: clear guidance to run baseline tests across all 4 subjects
- [ ] Report saved to ~/.ielts/diagnosis/plans/{date}_plan.md
- [ ] Specificity: no generic advice like "你需要努力"; all suggestions backed by data

---
Score: X/15 passed
