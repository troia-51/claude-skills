# Evals — Follow Builders
> Pass/fail checks for output quality. 每次跑完 digest 之後用呢個 checklist 驗收。

## Signal Quality
- [ ] 所有 tweet 內容都有對應 URL，冇 URL 嘅唔 include
- [ ] 每個 builder 嘅 bio 資料準確，唔靠估 job title
- [ ] 內容全部來自 JSON，冇自己上網 fetch 或者 fabricate

## Remix Quality
- [ ] Summary 有觀點有立場，唔係 copy-paste 原文
- [ ] Podcast summary 提煉咗核心論點，唔係流水帳式 transcript 摘要
- [ ] 每個 builder 嘅觀點有獨立處理，唔係混埋一齊講

## Language & Format
- [ ] Language setting 執行正確（en / zh / bilingual 各自格式）
- [ ] Bilingual 模式係逐段 interleave，唔係英文全部出完先出中文
- [ ] 格式一致：每個 builder 區塊結構統一

## Completeness
- [ ] 有 podcast episodes 就一定要 include，唔可以 skip
- [ ] Stats（podcast 數 + builder 數）同實際 output 一致
- [ ] Delivery method 正確執行（stdout / telegram / email）

## Edge Cases
- [ ] Stats 全零時正確顯示「No new updates」訊息，唔出空 digest
- [ ] Prepare script 失敗時有 fallback 訊息，唔 silent fail

---
Score: X/Y passed
