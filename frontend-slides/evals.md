# Evals — Frontend Slides
> Pass/fail checks for output quality. 每次生成 slides 之後用呢個 checklist 驗收。

## Stage & Layout (NON-NEGOTIABLE)
- [ ] 16:9 fixed stage（1920x1080）正確實作，唔 reflow on mobile
- [ ] `viewport-base.css` 完整 included
- [ ] Slide visibility 用 `.active` / `.visible` + `visibility` / `opacity`，唔用 `display: none`
- [ ] `prefers-reduced-motion` support 有 included

## Zero Dependencies
- [ ] 單一 HTML file，所有 CSS/JS inline
- [ ] 冇 npm / build tools / external dependencies（font CDN 除外）
- [ ] Fonts 來自 Fontshare 或 Google Fonts，唔用 system fonts

## Design Quality
- [ ] 冇 generic AI slop（冇 Inter / Roboto / Arial / 紫色 gradient on white）
- [ ] Typography 有 distinctive choices，唔係 default
- [ ] Color palette committed，唔係 timid evenly-distributed
- [ ] Motion / animation 有 purpose，唔係純裝飾

## Content Density
- [ ] Speaker-led mode：每 slide 一個 idea，large type，generous whitespace
- [ ] Reading-first mode：self-contained slides，structured grids/tables
- [ ] 冇 scrolling / overflow / overlapping panels
- [ ] Text 大細 readable at rendered size

## Delivery
- [ ] File location + style name + slide count 已報告
- [ ] Navigation instructions已提供（arrow keys, space, swipe）
- [ ] Inline editing功能已說明（hover top-left / press E）

---
Score: X/Y passed
