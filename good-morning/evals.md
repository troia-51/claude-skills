# Start Day — Evals

Run after every execution. Fix before reporting completion.

| # | Check | Category | Pass | Fail |
|---|-------|----------|------|------|
| 1 | STATUS.md read successfully | Process | File found and parsed | File missing or corrupted |
| 2 | Momentum State table complete (5 fields) | Output Quality | All fields present | Missing fields |
| 3 | Active Threads section populated | Output Quality | Thread names shown | Empty or "no threads" |
| 4 | Recent Activity from git log | Output Quality | 3+ items listed | No git data |
| 5 | Session transcripts loaded | Output Quality | Sessions listed | Script failed or no data |
| 6 | Today's Recommendation based on momentum score | Output Quality | Recommendation matches score table | Wrong recommendation |
| 7 | STATUS.md date auto-updated | Process | Date matches today | Date unchanged |
| 8 | Momentum Score Trend appended | Process | New row added | Table unchanged |
| 9 | Non-interactive (no questions asked) | Process | Direct output | Asked "四件事" |
| 10 | Bilingual output (Cantonese UI, English data) | Language | Mixed correctly | Wrong language |
| 11 | Staleness warning if STATUS.md > 2 days | Edge Cases | Warning shown | No warning |
| 12 | Edge case: STATUS.md missing → creates from template | Edge Cases | Template created | Error or skip |

## Auto-Fix Triggers

- If check 1 fails: Create STATUS.md from template
- If check 7 fails: Re-run sed command to update date
- If check 9 fails: Remove any questions, output directly
