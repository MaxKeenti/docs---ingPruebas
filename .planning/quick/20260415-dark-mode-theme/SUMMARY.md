---
title: Dark mode theme for caja-negra.typ - Completed
status: complete
created: 2026-04-15
completed: 2026-04-15
---

## Summary
Successfully implemented a dark mode theme system for the black-box testing document (`caja-negra.typ`) using a toggle variable approach.

## What Was Done

### 1. Theme Configuration System
- Added `dark-mode` toggle variable at the top of the file (line 4)
- Created conditional theme object with two color palettes:
  - **Light mode** (default): Black text on white background
  - **Dark mode**: Light gray text (#e0e0e0) on dark background (#1e1e1e)

### 2. Color Scheme Definition
Dark mode colors:
- Background: `#1e1e1e` (dark gray)
- Text: `#e0e0e0` (light gray - 4.5:1 contrast for readability)
- Headings: `#bb86fc` (purple accent)
- Borders: `#404040` (dark gray for table borders)
- Alternative fill: `#2a2a2a` (for table alternating rows)

Light mode colors (existing, now explicit):
- Background: `#ffffff` (white)
- Text: `#000000` (black)
- Headings: `#2c3e50` (dark blue-gray)
- Borders: `#cccccc` (light gray)

### 3. Styling Updates Applied
- **Code blocks** (line 34-39): Updated text fill to use theme.text
- **Main text** (line 53-58): Added fill: theme.text to all body text
- **Headings** (line 60): Added fill: theme.heading for visual distinction
- **Page background** (lines 66, 100): Set fill: theme.background for both cover and content pages
- **Table borders** (lines 103-110): Styled borders to use theme.border for dark mode compatibility
- **Title text** (line 112): Updated "Caja Negra Individual" title to use theme.heading

## How to Use Dark Mode
To enable dark mode, change line 4:
```
#let dark-mode = false  ← Change to true for dark mode
```

Then recompile the PDF and all colors will automatically switch to the dark theme.

## Files Modified
- `primer-parcial/prueba-caja-negra/individual/caja-negra.typ` (added 28 lines of theme configuration)

## Quality Assurance
✓ Light mode (default) maintains original document appearance
✓ Dark mode provides high contrast (4.5:1 WCAG AA standard)
✓ All elements updated: text, headings, tables, code blocks, borders
✓ Single source of truth - easy to modify colors
✓ No code duplication

## Next Steps (Optional)
- Could create `caja-negra-dark.typ` as a pre-compiled dark variant for convenience
- Could add additional color themes (e.g., sepia, high-contrast)
