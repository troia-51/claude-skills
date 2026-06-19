# Evals — IELTS Dashboard

> Auto-generated pass/fail checks for output quality. Run after each skill invocation.

## Data Loading

- [ ] All JSON data sources attempted (config, errors/notebook, reading/synonym-bank, vocab/bank, 4x progress.json)
- [ ] Missing files return empty object `{}` rather than crashing
- [ ] Data injected into HTML as valid JSON constant (no parse errors)

## HTML Generation

- [ ] Output is a single self-contained HTML file (no external dependencies except Chart.js CDN)
- [ ] Dark theme applied (#1a1a2e background, #16213e cards)
- [ ] CSS Grid responsive layout with minmax(350px, 1fr)
- [ ] Chart.js loaded from CDN (https://cdn.jsdelivr.net/npm/chart.js)

## Dashboard Components

- [ ] Countdown: days left calculated from exam_date in config.json
- [ ] Overall score: average of latest listening/reading/writing scores (excluding missing data)
- [ ] Writing trend chart: 4 lines (TR/CC/LR/GRA) with correct score data
- [ ] Radar chart: current vs target scores across 4 subjects
- [ ] Reading type accuracy: horizontal bar chart from by_type_summary
- [ ] Listening section accuracy: grouped bar chart (S1-S4, correct vs total)
- [ ] Vocab box distribution: stacked bar chart (Box 1-5)
- [ ] Error heatmap: Top 10 errors with color coding (high/med/low)

## Data Accuracy

- [ ] All numbers in charts match source JSON data (no hardcoded placeholder values)
- [ ] "今日建议" correctly identifies weakest subject from latest scores
- [ ] Synonym count matches synonym-bank.json total_pairs

## Output & Service

- [ ] HTML written to ~/.ielts/dashboard/index.html
- [ ] User instructed to run `python3 -m http.server 5173` or service auto-started

---
Score: X/18 passed
