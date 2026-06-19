# Evals — Conference Papers
> Pass/fail checks for output quality. 每次搜完論文之後用呢個 checklist 驗收。

## Search & Scoring
- [ ] 指定嘅年份同會議正確傳入 search script
- [ ] 三維評分（相關性 40% + 熱門度 40% + 質量 20%）正確計算
- [ ] Top N 結果按 recommendation score 排序
- [ ] 雙年會議（ICCV 偶數年 / ECCV 奇數年）空結果時正確 skip，唔報錯

## Output Format
- [ ] 推薦筆記 frontmatter 包含 keywords 同 tags
- [ ] 每篇論文有完整 metadata：authors, conference, year, citations, links
- [ ] 前 3 篇有 wikilink 格式嘅論文名（`[[論文名]]`）
- [ ] 有 arXiv ID 嘅論文提供 arXiv + PDF link；冇嘅標注「無 arXiv 版本」

## Deep Analysis (Top 3)
- [ ] 有 arXiv ID 嘅前 3 篇：提取圖片 + 調用 paper-analyze 生成報告
- [ ] 已有筆記嘅論文：唔重複生成，直接引用已有路徑
- [ ] 詳細報告 wikilink 路徑用 JSON 嘅 `note_filename`，唔用原始標題
- [ ] Domain 名稱完整保留（如「Foundation Models & LLM」唔截斷）

## Link Quality
- [ ] 所有 DBLP / arXiv / PDF URL 可訪問（非空、格式正確）
- [ ] DOI link 喺有 DOI 嘅論文上出現
- [ ] 關鍵詞自動鏈接腳本成功執行

## Edge Cases
- [ ] DBLP 失敗時有 3 次重試 + 指數退避
- [ ] S2 429 限流時等 30 秒重試
- [ ] S2 補充失敗嘅論文保留，abstract=None，僅憑標題評分

---
Score: X/Y passed
