# SVG Framework Template

Generate a standalone `.svg` file for the conversation's theoretical framework.

## Color Palette (by Semantic Layer)

| Layer | Color Name | Hex | Use For |
|-------|-----------|-----|---------|
| Theoretical Root | Purple | `#8E44AD` | Starting concept, foundational theory |
| Core Observation | Coral | `#E76F51` | Key reframing, structural shifts |
| Mechanism | Amber | `#E9A23B` | Specific mechanisms, pattern detection |
| Synthesis | Teal | `#2A9D8F` | Integration points, positive outcomes |
| Negative Outcome | Gray | `#9E9E9E` | Failure modes, traps |
| Positive Outcome | Teal | `#2A9D8F` | Desired outcomes, momentum loops |

## Structural Rules

1. **Top-down flow only** — no horizontal or circular arrows
2. **One fork point** — where the framework splits into two parallel mechanisms
3. **Convergence point** — where the two mechanisms merge into a synthesis node
4. **Two terminal nodes** — negative (gray, left) and positive (teal, right)
5. **Core thesis pill** — rounded rectangle at the bottom, no fill, teal border

## Node Format

Each node is a rounded rectangle (`rx="14"`) containing:
- **Title**: 700 15px, white text, centered
- **Subtitle**: 12.5px, white with 85% opacity, centered
- **Optional third line**: 12.5px, white with 65% opacity (for key quotes)

Node dimensions:
- Standard: `width="400" height="85"`
- Mechanism (fork): `width="340" height="90"`
- Terminal: `width="340" height="80"`
- Thesis pill: `width="600" height="60" rx="30"`

## SVG Canvas

- Width: 960px
- Height: calculated based on number of layers (typically 1200-1400px)
- Background: `#FAFAFA` with `rx="8"`
- Drop shadow filter on all nodes

## Typography

```css
.title { font: 700 26px 'Helvetica Neue', Arial, sans-serif; }
.subtitle { font: 14px 'Helvetica Neue', Arial, sans-serif; fill: #777; }
.node-title { font: 700 15px 'Helvetica Neue', Arial, sans-serif; }
.node-sub { font: 12.5px 'Helvetica Neue', Arial, sans-serif; }
.thesis { font: italic 14px 'Georgia', serif; }
.layer-label { font: 600 11px 'Helvetica Neue', Arial, sans-serif; fill: #999; letter-spacing: 1.5px; text-transform: uppercase; }
```

## Arrow Styles

```css
.line-solid { stroke: #555; stroke-width: 2; fill: none; marker-end: url(#arrow); }
.line-dashed { stroke: #2A9D8F; stroke-width: 2; fill: none; stroke-dasharray: 6,4; marker-end: url(#arrow-dashed); }
```

- Solid arrows: standard flow
- Dashed arrows: "potential path" or "antithesis" relationships (positive terminal only)

## Layer Labels

Right-aligned, uppercase, tracking 1.5px. Place at `x="920"` with `text-anchor="end"` for each semantic layer.

## Complete Template Skeleton

```svg
<svg width="960" height="[HEIGHT]" xmlns="http://www.w3.org/2000/svg">
<defs>
  <marker id="arrow" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
    <polygon points="0 0, 10 3.5, 0 7" fill="#555"/>
  </marker>
  <marker id="arrow-dashed" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
    <polygon points="0 0, 10 3.5, 0 7" fill="#2A9D8F"/>
  </marker>
  <filter id="shadow" x="-5%" y="-5%" width="110%" height="115%">
    <feDropShadow dx="0" dy="2" stdDeviation="4" flood-opacity="0.12"/>
  </filter>
</defs>

<style>
  .title { font: 700 26px 'Helvetica Neue', Arial, sans-serif; }
  .subtitle { font: 14px 'Helvetica Neue', Arial, sans-serif; fill: #777; }
  .node-title { font: 700 15px 'Helvetica Neue', Arial, sans-serif; }
  .node-sub { font: 12.5px 'Helvetica Neue', Arial, sans-serif; }
  .thesis { font: italic 14px 'Georgia', serif; }
  .layer-label { font: 600 11px 'Helvetica Neue', Arial, sans-serif; fill: #999; letter-spacing: 1.5px; text-transform: uppercase; }
  .line-solid { stroke: #555; stroke-width: 2; fill: none; marker-end: url(#arrow); }
  .line-dashed { stroke: #2A9D8F; stroke-width: 2; fill: none; stroke-dasharray: 6,4; marker-end: url(#arrow-dashed); }
</style>

<!-- Background -->
<rect width="960" height="[HEIGHT]" fill="#FAFAFA" rx="8"/>

<!-- Title area -->
<text x="480" y="48" text-anchor="middle" class="title" fill="#222">[TITLE]</text>
<text x="480" y="74" text-anchor="middle" class="subtitle">Developed across conversation · [DATE]</text>

<!-- LAYER N: [Name] (Purple/Cor/Amber/Teal/Gray) -->
<!-- Repeat for each layer -->

<!-- Core Thesis pill -->
<rect x="180" y="[Y]" width="600" height="60" rx="30" fill="none" stroke="#2A9D8F" stroke-width="2"/>
<text x="480" y="[Y+27]" text-anchor="middle" class="thesis" fill="#333">[THESIS LINE 1]</text>
<text x="480" y="[Y+47]" text-anchor="middle" class="thesis" fill="#333">[THESIS LINE 2]</text>
</svg>
```

## Vertical Spacing Guide

| Section | Y Start | Node Height | Gap |
|---------|---------|-------------|-----|
| Title area | 0 | 80 | — |
| Layer 1 (root) | 100 | 85 | 60 |
| Layer 2 (observation) | 245 | 85 | 60 |
| Layer 3 (pattern) | 395 | 85 | 60 |
| Layer 4 (shift) | 545 | 85 | 60 |
| Fork → Layer 5a/5b | 720 | 90 | 90 |
| Converge → Layer 6 | 895 | 100 | 85 |
| Fork → Layer 7a/7b | 1090 | 80 | 95 |
| Core thesis | 1220 | 60 | 50 |

Total: ~1320px height (adjust based on content)
