# INTEGRATIONS.md — External Integrations

## Overview
This is a pure academic document repository. There are **no runtime integrations**, no APIs, no databases, and no network calls in the document content itself. All integrations are limited to the document toolchain.

---

## Typst Package Registry (Universe / Preview)
Documents fetch packages at compile time from the official Typst package registry (`https://packages.typst.org`).

| Package | Version | Source |
|---------|---------|--------|
| `@preview/cetz` | `0.4.2` | https://typst.app/universe/package/cetz |
| `@preview/codly` | `1.3.0` / `1.2.0` | https://typst.app/universe/package/codly |

Packages are cached by the local Typst installation after first download. Compilation requires internet access on first run or a populated local cache.

---

## GSD / Agentic Toolchain
The `.agent/` directory contains GSD v1.36.0 installed for Antigravity runtime. This is a local file-based system with no external service calls during normal operation.

| Component | Location | Purpose |
|-----------|----------|---------|
| GSD skills | `.agent/skills/` | 73 agentic skill commands |
| GSD workflows | `.agent/get-shit-done/workflows/` | Orchestration logic |
| GSD tools binary | `.agent/get-shit-done/bin/gsd-tools.cjs` | CLI utility |

---

## CI/CD
No CI/CD pipeline configured. The `.github/` directory was created by the GSD installer for Copilot support but contains no GitHub Actions workflows.

---

## External Services
| Service | Status |
|---------|--------|
| Git remote | Unknown (local repo, no remote confirmed) |
| Any cloud storage | None |
| Any API endpoints | None |
| Authentication providers | None |

---

## Asset Dependencies (Local Only)
Documents rely on locally installed fonts and co-located SVG assets. These are not fetched at runtime — they must exist on the compilation machine:
- `media/logos/IPN_Logo.svg` — in each document folder
- `media/logos/UPIICSA_Logo.svg` — in each document folder
- `media/pictures/UT2. CAJA NEGRA2.pdf` — individual black-box reference
- `media/Examen-practico_IP.pdf` — exam instructions embedded in white-box exam
