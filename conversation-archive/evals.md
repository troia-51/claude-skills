# Evals — Conversation Archive
> Pass/fail checks for output quality. 每次歸檔對話之後用呢個 checklist 驗收。

## Text Preservation (最重要)
- [ ] 原文所有對話內容完整保留，冇刪減、冇 paraphrase、冇 summarize
- [ ] Strategy Cards 原樣保留（包括空字段），唔拆開做獨立 section
- [ ] Code blocks、ASCII 圖、tables 原樣 fenced 保留
- [ ] 用戶引文用 `>` blockquote 格式，AI 分析保持 verbatim

## Structure & Chapters
- [ ] Chapter 劃分反映對話嘅 natural topic shifts，唔係機械式每 N 句一章
- [ ] AI 原有嘅 section headers 優先用做 chapter title
- [ ] 每章結構包含「用戶原話」同「AI 分析」兩部分

## SVG & Mermaid
- [ ] SVG 顏色編碼按 semantic layer 分（purple/coral/amber/teal/gray）
- [ ] SVG 結構反映對話框架嘅實際形狀（linear / dual-mechanism / fork）
- [ ] Mermaid flowchart 同 SVG 結構一致，fork points 對應
- [ ] Core thesis 出現在 SVG 底部 pill 同 Mermaid 圖中

## Metadata & Index
- [ ] Frontmatter 包含 title, date, tags (8-20), status, type, source, related
- [ ] Terminology index 有 10-20 個 terms，每個有 origin field 同 framework role
- [ ] Research actions 有 8-15 items，用 checkbox format

## Completeness Verification
- [ ] Output line count >= source line count（加咗結構所以一定更多）
- [ ] SVG asset 存在且非空
- [ ] Source 嘅第一個同最後一個對話 turn 都喺 output 出現

---
Score: X/Y passed
