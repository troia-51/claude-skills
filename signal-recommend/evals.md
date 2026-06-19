# Signal Recommend — Evals

Run these 10 pass/fail checks after every skill execution.

## 内容完整性

| # | Check | Pass | Fail |
|---|-------|------|------|
| 1 | **每条有 URL** | Every tweet, podcast, blog entry has a clickable source URL | Content without URL |
| 2 | **无 fabricate** | All content comes from the JSON feed data. No invented quotes or opinions | Content not in source JSON |
| 3 | **无 @ handle** | No @ handles in output (breaks Telegram) | @ handle found |

## Bilingual 格式

| # | Check | Pass | Fail |
|---|-------|------|------|
| 4 | **Interleave 正确** | English paragraph → Cantonese paragraph → next builder. Not all English then all Cantonese | Languages not interleaved |
| 5 | **繁體字** | Chinese text uses traditional characters (繁體字), not simplified (简体字) | Simplified characters found |
| 6 | **广东话口语** | Uses 係/嘅/咁/佢/哋/嚟/冇 not 是/的/那/他/們/來/沒 | Mandarin word choices |

## 输出结构

| # | Check | Pass | Fail |
|---|-------|------|------|
| 7 | **Section 顺序** | X/Twitter → Official Blogs → Podcasts (only sections with content) | Wrong order or empty sections included |
| 8 | **Podcast 有 Takeaway** | Podcast section starts with one-sentence "The Takeaway" + "核心洞察" | Missing takeaway |
| 9 | **Builder 用全名** | Full name + role/company used, not just last name or handle | "Levie" instead of "Box CEO Aaron Levie" |
| 10 | **尾行有 attribution** | Ends with "Generated through the Follow Builders skill: URL" | Attribution missing |

## Edge Cases

| # | Check | Pass | Fail |
|---|-------|------|------|
| 11 | **零内容处理** | If all stats are 0, outputs "No new updates" message and stops | Tries to generate empty digest |
| 12 | **Script 失败** | If prepare-digest.js fails, tells user to check internet | Silently fails or fabricates content |

## Language Quality

| # | Check | Pass | Fail |
|---|-------|------|------|
| 13 | **Technical terms 英文** | AI, LLM, GPU, API, RAG etc. stay in English in both languages | Translated to Chinese |
| 14 | **人名公司名 英文** | Proper nouns (names, companies, products) kept in English | Transliterated to Chinese |
