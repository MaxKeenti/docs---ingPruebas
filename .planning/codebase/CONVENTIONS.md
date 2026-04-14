# CONVENTIONS.md — Code Style & Conventions

## Document Language
All academic content is written in **Spanish** (`lang: "es"` set in Typst documents). Code samples within documents are translated to TypeScript for illustration purposes.

---

## Typst Writing Style

### Global Typography
Set once near the top of each `.typ` file:
```typ
#set text(
  font: "ITC Avant Garde Gothic",
  lang: "es",
  weight: "semibold",
)
#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)
```

### Code Block Style
```typ
#show raw: set text(
  font: "JetBrainsMono NFM",
  weight: "medium",
  size: 1em,
)
#import "@preview/codly:1.3.0": *
#show: codly-init.with()
#codly(
  languages: (
    ts: (name: "TypeScript", icon: "", color: rgb("#3178C6")),
    typ: (name: "Typst", icon: "", color: rgb("#239DAD")),
  ),
  number-format: n => str(n),
)
```

---

## Document Structure Pattern

### Header ordering (consistent across all files):
1. `#import` statements (cetz, local template, codly)
2. `#show raw` code font override
3. codly initialization
4. `#set text` global font
5. (Optional) `#show heading` override
6. `#set page` layout
7. `#let integrantes = (...)` team roster
8. `#portada(...)` cover page
9. `#pagebreak()`
10. `#set par`, `#set heading`, `#set list`
11. Document body sections

---

## Section Heading Conventions

| Typst Syntax | Render | Use |
|---|---|---|
| `=` | H1 | Main section (numbered: "1.") |
| `==` | H2 | Subsection |
| `===` (if used) | H3 | Sub-subsection |

Subsections for test methodology use a lettered suffix convention:
- `== A. Grafo de flujo` — Flow graph
- `== B. Complejidad Ciclomática` — Cyclomatic complexity
- `== C. Caminos Básicos` — Basis paths
- `== D. Casos de Prueba` — Test cases

---

## Table Design

Tables use center alignment and bold header cells with `*asterisks*`:
```typ
#table(
  columns: (auto, auto),
  align: center,
  [*Variable*], [*Dominio*],
  [Row data], [Row data],
)
```

Column widths use `auto` for content-fitting or `1fr` for equal-width columns.

---

## Math Notation

Inline math uses single `$...$` delimiters:
- `$V(G) = E - N + 2$`
- `$-\u003e$` for arrows in path notation

---

## Comment Style
Typst comments use `//` C-style syntax. Comments are used extensively in the white-box exam document as a learning aid, explaining each Typst construct:
```typ
// Dibujamos el primer círculo en la coordenada matemática (x: 0, y: 5) de nuestro lienzo.
circle((0, 5), name: "1", ..node-style)
```

---

## CeTZ Diagram Conventions

- **Node style**: Defined as a reusable `let node-style = (radius: 0.35, stroke: 0.7pt, fill: white)` spread with `..node-style`
- **Naming**: Nodes named by their numbering in the analyzed code (e.g., `name: "1"`)
- **Edge labels**: `content()` placed at edge midpoint with `anchor` and `padding`; "V" for True branch, "F" for False
- **Complex paths**: Multi-point `line()` calls using intermediate coordinates for orthogonal routing

---

## portada Template Usage

All 14 parameters are positional (not named). Labels (first 7) come before values (last 7):
```typ
#portada(
  "UNIDAD DE APRENDIZAJE",   // label
  "EXAMEN",                   // label
  "SECUENCIA Y PERIODO",      // label
  "BOLETA",                   // label
  "ALUMNO",                   // label
  "PROFESORA",                // label
  "FECHA",                    // label
  "Ingeniería de Pruebas",    // value: carrera
  "Caja Blanca",              // value: materia/tema
  "6NM61 2026-2",             // value: secuencia
  "2021601769",               // value: boleta
  integrantes,                // value: alumnos (array or string)
  "González Arroyo Lilia",    // value: profesora
  "10 de Marzo de 2026",      // value: fecha
)
```
