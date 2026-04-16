---
title: Fix codly white row striping in dark mode
status: complete
created: 2026-04-15
completed: 2026-04-15
---

## Summary
Fixed the alternating white/dark row striping in codly code blocks that broke the dark mode aesthetic.

## Issue
Codly was applying default alternating row background colors, creating white stripes in code blocks that clashed with the dark mode design and looked jarring in light mode as well.

## Solution
Added codly `highlight` configuration to use consistent theme-appropriate background colors:
- **Dark mode**: All rows use `#2a2a2a` (dark gray)
- **Light mode**: All rows use `#d9d9d9` (darker gray)

## Result
Code blocks now have:
- Clean, consistent appearance in both light and dark modes
- No jarring white striping in dark mode
- Proper visual hierarchy maintained
- Professional, cohesive aesthetic across all code sections
