---
name: theme-factory
description: Apply visual themes to artifacts (slides, docs, reports, HTML pages). Use when the user wants to style an artifact, apply a color scheme, change fonts, or make something look polished. Triggers: "apply theme", "style this", "make it look better", "change colors", "pick a theme".
allowed-tools: Read, Glob, Write, Edit, Bash
license: Complete terms in LICENSE.txt
---


# Theme Factory Skill

This skill provides a curated collection of professional font and color themes, each with carefully selected color palettes and font pairings. Once a theme is chosen, it can be applied to any artifact.

## Usage Instructions

To apply styling to a slide deck or other artifact:

1. **Show the theme showcase**: Display the `theme-showcase.pdf` file to allow users to see all available themes visually. Do not make any modifications to it; simply show the file for viewing.
2. **Ask for their choice**: Ask which theme to apply to the deck
3. **Wait for selection**: Get explicit confirmation about the chosen theme
4. **Apply the theme**: Once a theme has been chosen, apply the selected theme's colors and fonts to the deck/artifact

## Themes Available

The following 10 themes are available, each showcased in `theme-showcase.pdf`:

1. **Ocean Depths** - Professional and calming maritime theme
2. **Sunset Boulevard** - Warm and vibrant sunset colors
3. **Forest Canopy** - Natural and grounded earth tones
4. **Modern Minimalist** - Clean and contemporary grayscale
5. **Golden Hour** - Rich and warm autumnal palette
6. **Arctic Frost** - Cool and crisp winter-inspired theme
7. **Desert Rose** - Soft and sophisticated dusty tones
8. **Tech Innovation** - Bold and modern tech aesthetic
9. **Botanical Garden** - Fresh and organic garden colors
10. **Midnight Galaxy** - Dramatic and cosmic deep tones

Each theme is defined in the `themes/` directory with complete color palette (hex codes) and font pairings.

## Application Process

After a preferred theme is selected:
1. Read the corresponding theme file from the `themes/` directory
2. Apply the specified colors and fonts consistently throughout the deck
3. Ensure proper contrast and readability
4. Maintain the theme's visual identity across all slides

## Create your Own Theme
To handle cases where none of the existing themes work for an artifact, create a custom theme. Based on provided inputs, generate a new theme similar to the ones above. Give the theme a similar name describing what the font/color combinations represent. Use any basic description provided to choose appropriate colors/fonts. After generating the theme, show it for review and verification. Following that, apply the theme as described above.

---

## Good Output Examples

### Example 1: Applying a Theme to an HTML Presentation

User: "Apply the Tech Innovation theme to my slides."

**Step 1: Read theme file**

```
Reading themes/tech-innovation.json...

{
  "name": "Tech Innovation",
  "colors": {
    "primary": "#0F172A",
    "secondary": "#1E40AF",
    "accent": "#06B6D4",
    "background": "#F8FAFC",
    "text": "#1E293B",
    "muted": "#94A3B8",
    "success": "#10B981",
    "border": "#E2E8F0"
  },
  "fonts": {
    "heading": "Inter, system-ui, sans-serif",
    "body": "Inter, system-ui, sans-serif",
    "mono": "JetBrains Mono, monospace"
  },
  "borderRadius": "8px",
  "shadow": "0 4px 6px -1px rgba(0, 0, 0, 0.1)"
}
```

**Step 2: Apply to presentation HTML**

The skill updates the CSS variables and inline styles in the presentation file:

```html
<style>
  :root {
    --color-primary: #0F172A;
    --color-secondary: #1E40AF;
    --color-accent: #06B6D4;
    --color-background: #F8FAFC;
    --color-text: #1E293B;
    --font-heading: 'Inter', system-ui, sans-serif;
    --font-body: 'Inter', system-ui, sans-serif;
  }

  body {
    font-family: var(--font-body);
    color: var(--color-text);
    background: var(--color-background);
  }

  h1, h2, h3 {
    font-family: var(--font-heading);
    color: var(--color-primary);
  }

  .accent { color: var(--color-accent); }
  .highlight { background: var(--color-accent); color: white; padding: 2px 8px; border-radius: 8px; }
</style>
```

**Step 3: Confirm**

```
Applied "Tech Innovation" theme to presentation.
Updated: 14 slides, color palette + font pairing + shadows.
Preview: open slides.html in browser to review.
```

### Example 2: Applying a Theme to a Document/Report

User: "Make my quarterly report look like Forest Canopy."

**Theme applied:**

```css
:root {
  --color-primary: #1B4332;
  --color-secondary: #2D6A4F;
  --color-accent: #52B788;
  --color-background: #FEFDF8;
  --color-text: #2D3436;
  --color-muted: #7F8C8D;
  --font-heading: 'Playfair Display', Georgia, serif;
  --font-body: 'Source Sans 3', system-ui, sans-serif;
}
```

**Changes made to the report HTML:**

```
- Headings: Playfair Display, forest green (#1B4332), letter-spacing: -0.02em
- Body text: Source Sans 3, warm dark gray (#2D3436), line-height: 1.6
- Tables: alternating row backgrounds (#F0F7F2 / white), green header (#2D6A4F)
- Links: accent green (#52B788), underline on hover
- Charts: recolored to forest palette (deep green, sage, moss, bark)
- Page background: warm off-white (#FEFDF8)
- Dividers: thin sage green lines (#D8E8DC)
```

**Confirm:**

```
Applied "Forest Canopy" theme to quarterly report.
Updated: typography, color palette, table styles, chart colors, page layout.
Report saved. Open in browser to review.
```

### Example 3: Theme Customization Request

User: "I like Ocean Depths but the blue is too corporate. Make it warmer — more like a tropical lagoon."

**Step 1: Read Ocean Depths as base**

```
Reading themes/ocean-depths.json...

Base palette:
  primary: #0C4A6E (deep navy)
  secondary: #0369A1 (ocean blue)
  accent: #22D3EE (cyan)
  background: #F0F9FF (ice blue)
```

**Step 2: Generate custom theme**

```
Creating custom theme: "Tropical Lagoon"
Based on: Ocean Depths, adjusted for warmth

Changes from Ocean Depths:
  - Shifted primary from deep navy (#0C4A6E) to warm teal (#115E59)
  - Shifted secondary from ocean blue (#0369A1) to lagoon green (#0D9488)
  - Shifted accent from cyan (#22D3EE) to warm turquoise (#2DD4BF)
  - Shifted background from ice blue (#F0F9FF) to warm sand (#FFFBEB)
  - Added warm neutral for text: (#44403C) instead of cold gray

Custom theme palette:
  primary: #115E59 (warm teal)
  secondary: #0D9488 (lagoon green)
  accent: #2DD4BF (warm turquoise)
  background: #FFFBEB (warm sand)
  text: #44403C (warm charcoal)
  muted: #A8A29E (sand gray)
```

**Step 3: Show for review**

```
Here's the "Tropical Lagoon" theme:

  ██████  Primary:    #115E59 (warm teal)
  ██████  Secondary:  #0D9488 (lagoon green)
  ██████  Accent:     #2DD4BF (warm turquoise)
  ██████  Background: #FFFBEB (warm sand)
  ██████  Text:       #44403C (warm charcoal)

Fonts unchanged from Ocean Depths:
  Heading: DM Sans (clean, modern)
  Body: Inter (high readability)

Apply this theme? (yes / adjust further)
```
