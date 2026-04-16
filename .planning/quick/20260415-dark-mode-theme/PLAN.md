---
title: Add dark mode theme support to caja-negra.typ
description: Implement a dark color scheme for the black-box testing document with toggle support
status: in_progress
created: 2026-04-15
---

## Objective
Add dark mode aesthetic to the caja-negra.typ document, allowing the colors to switch from light (default) to dark mode while maintaining readability and visual hierarchy.

## Approach

### Option 1: Create a separate dark mode file (simpler, duplicates code)
- Create `caja-negra-dark.typ` that mirrors the original but with dark colors
- Easy to maintain as independent document
- Con: Code duplication

### Option 2: Add a theme toggle to existing file (recommended)
- Add a `#let dark-mode = false` variable at the top
- Create color definitions that respond to this toggle
- Update all text, table, and code styling to use the theme colors
- Users can change one line to enable dark mode

### Color Scheme for Dark Mode
- **Background**: `rgb("#1e1e1e")` or `rgb("#0d0d0d")`
- **Text**: `rgb("#e0e0e0")` or `rgb("#f0f0f0")`
- **Accent/Code**: Adjust existing colors for contrast
- **Table borders**: Light gray `rgb("#404040")`
- **Table fills**: Dark with subtle stripes `rgb("#2a2a2a")`

## Tasks
1. Create a theme configuration system at the top of caja-negra.typ
2. Define light and dark color palettes
3. Update text styling to use theme colors
4. Update table styling (borders, fills, text color)
5. Update code block styling for dark mode compatibility
6. Update heading colors for dark mode
7. Test PDF generation with both modes
8. Create caja-negra-dark.typ as a pre-compiled dark mode variant
9. Commit changes with message about dark mode support

## Files to Modify
- `primer-parcial/prueba-caja-negra/individual/caja-negra.typ`
- (Optional) Create `primer-parcial/prueba-caja-negra/individual/caja-negra-dark.typ` as variant

## Success Criteria
- [ ] Dark mode toggle works (change one variable to enable)
- [ ] Text is readable in both light and dark modes (contrast >= 4.5:1)
- [ ] Tables are properly styled and readable in both modes
- [ ] Code blocks are readable in both modes
- [ ] PDF compiles without errors in both modes
- [ ] Portada template is handled properly (may need logo adjustments)
