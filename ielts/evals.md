# Evals — IELTS Router

> Auto-generated pass/fail checks for output quality. Run after each skill invocation.

## Initialization Flow

- [ ] config.json existence checked before any routing
- [ ] If config.json missing: 3 questions asked in order (target score + exam date → current level → today's goal)
- [ ] Directory structure created: writing/essays, reading/sessions, speaking/stories, listening/sessions, vocab, errors, diagnosis/plans, dashboard, backups
- [ ] config.json written with valid schema (schema_version, profile.exam_date, profile.target_score, settings.ai_score_calibration)
- [ ] Empty progress.json, notebook.json, synonym-bank.json, topic-map.json, bank.json created with correct initial structure

## Status Summary

- [ ] One-line status shown: 距考试 N 天 | 目标 X 分 | 最近活动 | 最弱科目
- [ ] Days left calculated correctly from exam_date
- [ ] Weakest subject identified from latest session scores

## Routing Logic

- [ ] Menu options A-H presented with clear descriptions
- [ ] Smart detection: essay text → /ielts-writing, reading passage → /ielts-reading, 40 answers → /ielts-listening
- [ ] Unknown input → show menu rather than guessing wrong route

## Core Strategy Accuracy

- [ ] Overall score formula correct: average of 4 subjects, .25/.75 rounds UP (e.g., 7.25→7.5)
- [ ] Listening band conversion table matches official IELTS scoring
- [ ] Reading band conversion table matches official IELTS scoring
- [ ] 80/20 time allocation principle stated (80% listening+reading, 20% writing+speaking)

## Backup/Restore

- [ ] Backup creates tar.gz with today's date in filename
- [ ] Restore lists available backups before user selects
- [ ] Export copies backup to ~/Desktop/

## Data Integrity

- [ ] Data persistence spec clearly states: report output priority, persistence failure never blocks output
- [ ] Error handling: JSON corruption → skip write + report warning, don't crash

---
Score: X/17 passed
