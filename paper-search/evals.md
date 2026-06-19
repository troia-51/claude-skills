# Evals — Paper Search
> Pass/fail checks for paper search quality.

## Search Accuracy
| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | Correctly identifies search type (title / author / keyword / domain / tag) | Search type is explicitly stated and matches query intent | Wrong search type inferred, or falls back to keyword when title/author was intended |
| 2 | Primary search terms are extracted and prioritized | Core terms drive results; noise terms are deprioritized | Irrelevant terms pollute the result set equally |
| 3 | Search uses case-insensitive matching | All text matching uses `-i` flag or equivalent | Case-sensitive miss causes relevant papers to be excluded |

## Result Quality
| # | Check | Pass | Fail |
|---|-------|------|------|
| 4 | Each result includes: title, author, date, domain, file path | All five fields present for every result | Missing fields make results unverifiable |
| 5 | Results are ranked by relevance (title match > content match > tag match) | Top results directly match the query | Random or alphabetical ordering obscures best matches |
| 6 | Relevance score is calculated and displayed | Numeric or categorical score accompanies each result | No indication of how relevant a result is |
| 7 | Wikilinks use display alias format `[[path|Display Title]]` | Every wikilink has a readable alias | Raw paths shown without alias, breaking readability |

## Format & Structure
| # | Check | Pass | Fail |
|---|-------|------|------|
| 8 | Output follows the defined markdown template | Consistent heading structure, sections, and separators | Free-form text with no recognizable structure |
| 9 | Chinese/English matches user's language preference | Output language aligns with the query language | Mixed or mismatched language without reason |
| 10 | No broken wikilinks or missing paths | All `[[links]]` resolve to existing files | Links point to non-existent files or wrong paths |

## Edge Cases
| # | Check | Pass | Fail |
|---|-------|------|------|
| 11 | Empty results return helpful suggestions | Suggests alternative keywords, broader scope, or related domains | Returns blank or unhelpful "no results" |
| 12 | Combined search (domain + keyword) works correctly | Both filters applied; results match both criteria | Only one filter applied; unrelated results leak in |
| 13 | Does not read entire large files — uses Grep for efficiency | Grep/search-first approach; only reads relevant sections | Reads full file contents, wasting tokens and time |

---
Score: X/Y passed
