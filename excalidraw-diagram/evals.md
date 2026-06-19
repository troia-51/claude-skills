# Evals — Excalidraw Diagram
> Pass/fail checks for output quality. 每次生成圖表之後用呢個 checklist 驗收。

## Visual Argument Quality
- [ ] 圖表有明確嘅視覺論點，唔係純 label boxes
- [ ] Isomorphism test：移除所有文字後結構本身能傳達概念
- [ ] 每個主要概念用唔同嘅 visual pattern（fan-out / convergence / timeline 等）
- [ ] Container discipline：<30% 嘅 text elements 在 containers 內

## Technical Accuracy (Technical Diagrams)
- [ ] 有 evidence artifacts（code snippets / JSON examples / real data）
- [ ] 用咗真正嘅 API 名、event 名、method 名，唔係 generic placeholders
- [ ] Multi-zoom：有 summary flow + section boundaries + detail 三層

## JSON Validity
- [ ] JSON 格式正確，可被 Excalidraw 正常載入
- [ ] 所有 elements 有 descriptive string IDs（如 `trigger_rect`）
- [ ] Cross-section bindings 正確：arrow 兩端都綁定到正確 element
- [ ] `fontFamily: 3`, `roughness: 0`, `opacity: 100`（預設值）

## Color & Typography
- [ ] 顏色來自 `references/color-palette.md`，冇自己 invent 新色
- [ ] Color 有 semantic meaning（唔係裝飾）
- [ ] Text 只包含可讀文字，冇 metadata / labels

## Render Validation
- [ ] 已 render 到 PNG 並用 Read tool 視覺檢查
- [ ] 冇 text overflow / clipping
- [ ] 冇 elements 重疊
- [ ] Arrows 正確連接到目標 elements，冇 crossing
- [ ] Spacing 一致，composition balanced
- [ ] 至少跑咗 2-4 次 render-fix loop

---
Score: X/Y passed
