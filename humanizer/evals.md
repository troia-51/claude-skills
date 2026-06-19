# Evals — Humanizer
> Pass/fail checks for output quality. 每次 humanize 完文字之後用呢個 checklist 驗收。

## Pattern Detection & Removal
- [ ] 所有 em dashes（—）同 en dashes（–）已移除，用 period / comma / colon / parentheses 替代
- [ ] AI 高頻詞已替換（delve, tapestry, vibrant, crucial, pivotal, underscore, showcase 等）
- [ ] Rule of three 已打散，唔再係三連排比
- [ ] Copula avoidance 已修正（serves as → is, boasts → has 等）

## Meaning Preservation
- [ ] 核心訊息完整保留，冇因改寫而丟失事實
- [ ] 改寫後嘅段落數同原文一致（rewrite, don't delete）
- [ ] 專有名詞、數字、日期等具體資訊冇被改動
- [ ] 原文嘅語域（register）保持一致（technical → technical, casual → casual）

## Voice & Naturalness
- [ ] 句子長度有變化，唔係每句都一樣長
- [ ] 有 opinions 同 personality（如果是 blog/essay 類型）
- [ ] 冇 sycophantic tone（Great question! I hope this helps! 等已移除）
- [ ] 冇 generic positive conclusions（The future looks bright 等已移除）

## Format & Style
- [ ] Boldface 使用克制，唔係機械式強調
- [ ] 冇 inline-header vertical lists（**Label:** description 格式）
- [ ] 冇 signposting（Let's dive in, Here's what you need to know 等已移除）
- [ ] Curly quotes 已換成 straight quotes（如有）

## False Positive Avoidance
- [ ] 合法嘅 human writing patterns 冇被誤改（具體細節、mixed feelings、dated references）
- [ ] 保留咗作者嘅 original voice，唔係統一變成 Claude style

---
Score: X/Y passed
