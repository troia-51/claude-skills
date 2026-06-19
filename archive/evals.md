# Archive Skill — Evals

Run after every execution. Fix before reporting completion.

| # | Check | Category | Pass | Fail |
|---|-------|----------|------|------|
| 1 | Output file exists in Obsidian vault root | Output Quality | File exists at vault path | No file created |
| 2 | Has YAML frontmatter with title, date, source, type, tags, status | Output Quality | All 6 fields present | Missing fields |
| 3 | Original content preserved verbatim | Content Fidelity | Line count ≥ source | Content compressed/summarized |
| 4 | Mermaid diagram uses `flowchart TD` format (not SVG) | Format | Mermaid block present | SVG file generated |
| 5 | Duplicate check performed before archiving | Process | Grep/Glob ran first | No duplicate check |
| 6 | Xiaohongshu URLs handled correctly (no fetch attempt) | Edge Cases | Asked user to paste | Tried WebFetch |
| 7 | Conversation logs routed to /conversation-archive | Routing | Correctly detected and routed | Processed as regular content |
| 8 | Cantonese UI text, English data fields | Language | Mixed correctly | Wrong language used |
| 9 | File written to correct vault path | Output Quality | `/Users/troia/Obsidian/...` | Wrong directory |
| 10 | Spot-check: first and last paragraphs present | Content Fidelity | Both found | Missing content |

## Auto-Fix Triggers

- If check 3 fails: Re-read source, re-generate output preserving all text
- If check 5 fails: Run duplicate check, inform user if found
- If check 7 fails: Re-route to /conversation-archive
