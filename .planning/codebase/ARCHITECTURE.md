# ARCHITECTURE.md — Architecture & Design

## Document Type
This is an **academic documentation repository** for the UPIICSA course _6NM61 — Ingeniería de Pruebas_ (Software Testing Engineering), taught by Prof. González Arroyo Lilia, semester 2026-2.

There is no software application architecture. The "architecture" here refers to the organization and composition patterns of Typst documents.

---

## Document Composition Pattern

Each deliverable follows a consistent composition model:

```
[document].typ
├── imports           → @preview/cetz, portada-template.typ, @preview/codly
├── global settings   → #set text(), #set page(), #set par()
├── portada()         → cover page with institutional branding
├── pagebreak()       → separates cover from content
└── sections          → #heading levels (=, ==) with tables, figures, code blocks
```

---

## Reusable Template System

A shared `portada-template.typ` exists in **each document folder** (they are copies, not symlinked). It exports a single `#let portada(...)` function that accepts 14 positional label+value parameters and renders the IPN/UPIICSA branded cover page.

```
portada(
  label_carrera, label_materia, label_practica, label_secuencia,
  label_alumno, label_profesorx, label_fecha,
  value_carrera, value_materia, value_practica, value_secuencia,
  value_alumnos, value_profesorx, value_fecha
)
```

The `alumnos` parameter accepts either a string (solo) or an array (team), with conditional rendering using `#if type(alumnos) == array`.

---

## Diagram Architecture (CeTZ)

Flow graphs for white-box testing are built using the `cetz` library:
- Nodes: `circle()` with named anchors
- Edges: `line()` with arrow marks and label annotations
- Layout: Manual coordinate-based positioning (no auto-layout)
- Encapsulated in `#figure()` for caption support

Example pattern from `Caja-Blanca_GonzalezCalzadaMaximiliano.typ`:
```typ
#figure(
  cetz.canvas({
    import cetz.draw: *
    let node-style = (radius: 0.35, stroke: 0.7pt, fill: white)
    circle((0, 5), name: "1", ..node-style)
    content("1", [1])
    line("1", "2", mark: (end: ">"), name: "e12")
    content("e12", [V], anchor: "south-east", padding: 0.1)
  }),
  caption: [Grafo del primer código],
)<primer-grafo>
```

---

## Data Flow (Document Compilation)

```
.typ source
  ↓ Typst compiler
  ├── @preview/cetz   → SVG diagram rendering
  ├── @preview/codly  → Code block decoration
  ├── portada-template.typ → Cover page
  ├── media/logos/*.svg → Institutional logos
  └── media/*.pdf (optional) → Embedded reference PDFs
  ↓
compiled .pdf
```

---

## Testing Subjects Documented

The repository captures academic analysis of two software testing methodologies:

| Methodology | Technique | Documents |
|-------------|-----------|-----------|
| White-box (Caja Blanca) | Control flow graphs, cyclomatic complexity, basis path testing | `primer-examen/Caja-Blanca_*.typ` |
| Black-box (Caja Negra) | Boundary Value Analysis | `prueba-caja-negra/equipo/caja-negra.typ` |
| Black-box (Caja Negra) | Equivalence Partitioning | `prueba-caja-negra/individual/caja-negra.typ` |

---

## Milestone Structure

```
primer-parcial/         ← Completed (first partial exam period)
  primer-examen/        ← White-box exam deliverable
  prueba-caja-negra/    ← Black-box test deliverable
    equipo/             ← Team submission (7 members)
    individual/         ← Solo submission
segundo-parcial/        ← In progress (empty, work not yet started)
```
