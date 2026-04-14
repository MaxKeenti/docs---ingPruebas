# STRUCTURE.md — Directory Layout & Organization

## Root Layout

```
docs---ingPruebas/
├── primer-parcial/              # First partial exam content (completed)
│   ├── .DS_Store
│   ├── primer-examen/           # White-box exam deliverable
│   │   ├── Caja-Blanca_GonzalezCalzadaMaximiliano.typ   # Main source
│   │   ├── Caja-Blanca_GonzalezCalzadaMaximiliano.pdf   # Compiled output
│   │   ├── portada-template.typ                         # Cover page template
│   │   └── media/
│   │       ├── Examen-practico_IP.pdf                   # Embedded exam instructions
│   │       └── logos/
│   │           ├── IPN_Logo.svg
│   │           └── UPIICSA_Logo.svg
│   └── prueba-caja-negra/       # Black-box test deliverable
│       ├── equipo/              # Team submission (7 members)
│       │   ├── caja-negra.typ
│       │   ├── caja-negra.pdf
│       │   ├── portada-template.typ
│       │   └── media/logos/
│       │       ├── IPN_Logo.svg
│       │       └── UPIICSA_Logo.svg
│       └── individual/          # Solo submission (Gonzalez Calzada Maximiliano)
│           ├── caja-negra.typ
│           ├── caja-negra.pdf
│           ├── portada-template.typ
│           └── media/
│               ├── logos/
│               │   ├── IPN_Logo.svg
│               │   └── UPIICSA_Logo.svg
│               └── pictures/
│                   └── UT2. CAJA NEGRA2.pdf
├── segundo-parcial/             # Second partial period (empty, not started)
├── .planning/                   # GSD planning artifacts (agentic tooling)
│   └── codebase/                # This codebase map
├── .agent/                      # GSD Antigravity runtime (73 skills)
├── .claude/                     # GSD Claude Code runtime (73 commands)
├── .gemini/                     # GSD Gemini runtime
├── .github/                     # GSD Copilot runtime
├── .gitignore                   # macOS-generated ignore patterns
└── .DS_Store                    # macOS metadata (should be gitignored)
```

---

## Key Locations

| Location | Purpose |
|----------|---------|
| `primer-parcial/primer-examen/` | White-box (Caja Blanca) exam |
| `primer-parcial/prueba-caja-negra/equipo/` | Team black-box test |
| `primer-parcial/prueba-caja-negra/individual/` | Solo black-box test |
| `segundo-parcial/` | Future second partial content (empty) |
| `.planning/` | GSD agentic planning state |
| `*/portada-template.typ` | Shared cover page template (copied per folder) |
| `*/media/logos/` | Institutional brand assets |

---

## Naming Conventions

| Convention | Example |
|------------|---------|
| Deliverable source files | `Caja-Blanca_GonzalezCalzadaMaximiliano.typ` (PascalCase-ish with hyphens and underscores) |
| PDF outputs | Same stem as `.typ` source |
| Team submissions | `caja-negra.typ` (kebab-case, lowercase) |
| Media folders | `media/` under each document root |
| Logo assets | `logos/` under `media/` |
| Parcial folders | `primer-parcial/`, `segundo-parcial/` (Spanish, kebab-case) |

---

## Template Duplication

`portada-template.typ` is duplicated (not symlinked) in each of the 3 document directories. This simplifies Typst compilation (relative imports work out of the box) at the cost of maintenance synchronization.

Locations:
- `primer-parcial/primer-examen/portada-template.typ`
- `primer-parcial/prueba-caja-negra/equipo/portada-template.typ`
- `primer-parcial/prueba-caja-negra/individual/portada-template.typ`

Content is identical across all three copies.

---

## Compiled Outputs

PDFs are committed alongside sources. This is typical for academic repositories where reviewers may not have Typst installed.

| Source | Output |
|--------|--------|
| `primer-examen/Caja-Blanca_GonzalezCalzadaMaximiliano.typ` | `primer-examen/Caja-Blanca_GonzalezCalzadaMaximiliano.pdf` |
| `prueba-caja-negra/equipo/caja-negra.typ` | `prueba-caja-negra/equipo/caja-negra.pdf` |
| `prueba-caja-negra/individual/caja-negra.typ` | `prueba-caja-negra/individual/caja-negra.pdf` |
