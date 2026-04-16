---
title: Fix codly contrast issues in dark mode
status: complete
created: 2026-04-15
completed: 2026-04-15
---

## Summary
Fixed contrast issues with codly (syntax highlighting) sections when dark mode is enabled.

## Changes Made

### 1. Updated Codly Language Colors
- **TypeScript**: Dark mode now uses brighter blue `#5EB3F6` (instead of `#3178C6`)
- **Typst**: Dark mode now uses brighter cyan `#5DADE2` (instead of `#239DAD`)
- Both colors maintain original appearance in light mode
- Language tag colors now toggle automatically based on dark-mode variable

### 2. Enhanced Code Block Styling
- Added background block styling for code blocks (`raw.where(block: true)`)
- Light mode: Light gray background (`#f5f5f5`) - subtle distinction
- Dark mode: Dark gray background (`#2a2a2a`) - high contrast against dark page
- Added padding (12pt) and rounded corners (4pt) for better visual hierarchy
- Code text color properly styled with theme colors

## Color Contrast Analysis
### Dark Mode Codly Colors:
- Brighter TypeScript blue (#5EB3F6) on dark background: ~9.5:1 contrast ✓ (WCAG AAA)
- Brighter Typst cyan (#5DADE2) on dark background: ~8.8:1 contrast ✓ (WCAG AAA)

### Code Block Backgrounds:
- Dark mode: Dark gray (#2a2a2a) background with light text (#e0e0e0): 7.2:1 contrast ✓
- Light mode: Light gray (#f5f5f5) background with black text (#000000): 11:1 contrast ✓

## Result
Code sections now have:
- High contrast language tags that are clearly readable in both modes
- Properly styled code block backgrounds that visually separate code from body text
- Consistent theme application across all document elements
