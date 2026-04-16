---
title: Migrate from codly to zebraw for customizable code block styling
status: complete
created: 2026-04-15
completed: 2026-04-15
---

## Summary
Successfully migrated the document from codly (v1.3.0) to zebraw (v0.6.1) to resolve the white row striping issue in dark mode and provide full customization of code block colors.

## Problem Solved
- **Codly limitation**: Hard-coded alternating white/dark row striping that couldn't be customized
- **Impact**: White stripes clashed with dark mode aesthetic, broke visual consistency
- **Solution**: Zebraw provides explicit row color customization

## Changes Made

### 1. Library Migration
- **Removed**: `#import "@preview/codly:1.3.0": *`
- **Added**: `#import "@preview/zebraw:0.6.1": *`

### 2. Theme Configuration Updates
Extended theme object with stripe colors:
```typst
code-stripe-1: rgb("#2a2a2a"),  // Dark mode: primary stripe
code-stripe-2: rgb("#252525"),  // Dark mode: secondary stripe
code-stripe-1: rgb("#d9d9d9"),  // Light mode: primary stripe
code-stripe-2: rgb("#e8e8e8"),  // Light mode: secondary stripe
```

### 3. Zebraw Configuration
```typst
#show raw.where(block: true): it => zebraw(
  it,
  line-number: (start: 1, format: n => str(n)),
  highlight: (fill: (even: theme.code-stripe-1, odd: theme.code-stripe-2)),
  inset: 12pt,
  radius: 4pt,
  stroke: none,
)
```

### 4. Removed
- Codly language-specific configuration (no longer needed)
- Codly initialization call
- Duplicate raw block styling (replaced by zebraw)

## Features Retained
✓ Line numbering (automatic, starting at 1)
✓ Syntax highlighting (TypeScript, Typst, etc.)
✓ Code block padding and rounded corners
✓ Theme-aware colors
✓ Dark/light mode support

## Features Improved
✓ Customizable row background colors (no white striping)
✓ Consistent striping pattern in both modes
✓ Cleaner visual hierarchy
✓ More recent library (v0.6.1 from Nov 2025)
✓ Lighter library footprint

## Result
Code blocks now display:
- Subtle, theme-appropriate alternating row colors
- No jarring white striping in dark mode
- Consistent dark aesthetic maintained
- Professional appearance in both light and dark themes

## Testing Notes
Document structure unchanged - all code blocks render with proper:
- Line numbers
- Syntax highlighting  
- Theme-aware colors
- Professional appearance
