# Evals — Theme Factory
> Pass/fail checks for output quality. 每次套用 theme 之後用呢個 checklist 驗收。

## Theme Selection
- [ ] Theme showcase PDF 正確顯示畀用戶選擇
- [ ] 用戶選擇確認後先開始套用，唔自動揀
- [ ] 10 個預設主題名稱正確（Ocean Depths 到 Midnight Galaxy）

## Color Application
- [ ] 主題顏色 palette 一致應用到所有 slides / pages
- [ ] Hex codes 同 theme file 定義一致
- [ ] Contrast ratio 足夠（text readable against background）
- [ ] Accent color 用於 highlights / emphasis，唔濫用

## Typography
- [ ] Header font 同 body font 按 theme pairing 搭配
- [ ] Font sizes 有層次（h1 > h2 > body）
- [ ] Font weights 用於 hierarchy，唔係全部同一 weight

## Visual Consistency
- [ ] Theme identity 貫穿所有頁面 / slides，唔中途變風格
- [ ] Background、border、shadow 等細節都跟主題
- [ ] Custom theme（如果用戶揀自訂）有完整嘅 name + color + font spec

## Application Process
- [ ] 讀咗對應嘅 theme file from `themes/` directory
- [ ] 改動 apply 到所有 relevant elements
- [ ] Apply 完有 visual check（contrast / readability）

---
Score: X/Y passed
