---
title: Darken code block backgrounds for consistent aesthetic
description: Make light mode code blocks darker to maintain consistent dark aesthetic
status: complete
---

## Objective
Darken the code block background colors in light mode to keep a more consistent dark aesthetic across both light and dark themes, avoiding overly bright/aggressive light backgrounds.

## Implementation
Updated theme configuration:
- Light mode code-bg: `#f5f5f5` → `#d9d9d9` (darker gray)
- Dark mode code-bg: unchanged at `#2a2a2a`

## Result
Code blocks now visually fit better with the overall dark-leaning aesthetic while maintaining proper contrast and readability.
