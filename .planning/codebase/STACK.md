# STACK.md — Technology Stack

## Document Type
Academic documentation repository (not a software application)

## Primary Language
**Typst** (`.typ`) — A modern markup-based typesetting system for technical documents.
All source files are authored in Typst and compiled to PDF.

## Document Toolchain
| Tool | Version | Role |
|------|---------|------|
| [Typst](https://typst.app) | Compatible with preview packages | Document compilation language |
| `@preview/cetz` | `0.4.2` | Vector drawing / diagram library (flow graphs) |
| `@preview/codly` | `1.3.0` (some files use `1.2.0`) | Syntax-highlighted code blocks with line numbers |

## Typst Package Registry (Universe / Preview)
Packages imported via the `@preview/` namespace from the official Typst Universe registry. No local `typst.toml` or manifest file is present — packages are fetched on-demand by the Typst compiler.

## Fonts in Use
| Font | Purpose |
|------|---------|
| `ITC Avant Garde Gothic` | Body text (primary) |
| `JetBrainsMono NFM` | Monospace / code blocks |
| `Fraunces 72pt` | Headings in individual black-box document |

All fonts must be installed locally for successful compilation.

## Assets
- **SVG logos** — `media/logos/IPN_Logo.svg`, `media/logos/UPIICSA_Logo.svg` (duplicated per document folder)
- **PDF attachments** — embedded via `#image(read(..., encoding: none))` trick to embed raw PDFs as images

## Output Format
Compiled artifacts are PDF files co-located with their source `.typ` files:
- `primer-parcial/primer-examen/Caja-Blanca_GonzalezCalzadaMaximiliano.pdf`
- `primer-parcial/prueba-caja-negra/equipo/caja-negra.pdf`
- `primer-parcial/prueba-caja-negra/individual/caja-negra.pdf`

## Version Control
Git repository. `.gitignore` is macOS-specific (generated from gitignore.io template for macOS), covering `.DS_Store`, `*.icloud`, etc. No language-specific ignores.

## Dependency Management
No package manager (npm, pip, cargo, etc.) is used for the document content. The GSD tooling installs `get-shit-done-cc` via npm (`package.json` written by installer), but this is exclusively for agentic tooling infrastructure.

## Node.js (Tooling Only)
| Package | Version | Role |
|---------|---------|------|
| `get-shit-done-cc` | `1.36.0` | Agentic GSD workflow scaffolding for agents |

`package.json` is present but scoped only to the `.agent/` toolchain — not the document content.
