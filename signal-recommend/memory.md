# Signal Recommend — Memory

## How to use this memory

Read this file before generating any digest output. These learnings encode quality
standards for the bilingual remix — what to include, what to skip, and format rules
that the JSON prompts alone don't cover. After each session, append one new learning.

## Format

Each entry: `- [YYYY-MM-DD] learning sentence`

## What makes good output for this skill

- Every piece of content MUST have a source URL. No URL = skip the item.
- English paragraph → Cantonese paragraph, interleaved. Never all-English-then-all-Cantonese.
- Technical terms (AI, LLM, GPU, API, RAG) stay in English in both languages.
- Full name + role/company. Never just a last name or @ handle.
- Skip mundane tweets (RTs without commentary, engagement bait, "great event!" posts).
- If all stats are 0, output "No new updates" and stop. Don't fabricate.

## Learnings

- [2026-06-07] User wants Traditional Cantonese (繁體廣東話), not simplified Mandarin. Custom translate prompt at ~/.follow-builders/prompts/translate.md.
- [2026-06-07] Podcast section must start with "The Takeaway:" (English) + "核心洞察：" (Cantonese). Missing takeaway = failed check #8.
- [2026-06-07] If a builder has nothing substantive (only retweets, no original takes), skip them entirely. Don't pad with filler.
- [2026-06-07] The "no @ handles" rule exists because output gets delivered to Telegram, where @ mentions create broken links.
