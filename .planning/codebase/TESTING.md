# TESTING.md — Testing Structure & Practices

## Context
This repository IS the test documentation — it captures academic work in Software Testing Engineering (Ingeniería de Pruebas). The documents describe test design techniques, not automated test suites for the repository itself.

---

## No Automated Tests
There are **no test runners, no test files, and no CI assertions** for the repository's own artifacts (the `.typ` source files). Document correctness is validated manually by compiling to PDF and visual inspection.

---

## Documented Testing Methodologies

### 1. White-Box Testing (Caja Blanca)
**Document:** `primer-parcial/primer-examen/Caja-Blanca_GonzalezCalzadaMaximiliano.typ`

**Technique:** Basis Path Testing (McCabe's Structured Testing)

**Process documented:**
1. **Flow graph construction** — Numbered nodes represent statements/conditions; edges represent control flow
2. **Cyclomatic complexity calculation** using 3 equivalent formulas:
   - $V(G) = E - N + 2$ (Edges minus Nodes plus 2)
   - $V(G) = P + 1$ (Predicate nodes plus 1)
   - $V(G) = R$ (Number of regions in the graph)
3. **Basis path identification** — One independent path per unit of complexity
4. **Test case derivation** — One test case per basis path

**Code analyzed:**
- Code 1: Nested if-else (access control with age + membership + promo code) → CC = 4, 4 basis paths
- Code 2: While loop with dual conditions and break (even-number sum) → CC = 4, 4 basis paths

**Test cases pattern:**
```
| Camino | Input vars... | Salida Esperada | Salida Real |
|--------|--------------|-----------------|-------------|
```

---

### 2. Black-Box Testing — Boundary Value Analysis (Team)
**Document:** `primer-parcial/prueba-caja-negra/equipo/caja-negra.typ`

**Technique:** Análisis a la Frontera (BVA — Boundary Value Analysis)

**System under test:** Hypothetical "Telas Inventario" inventory management system

**Input domains analyzed:**

| Variable | Domain | BVA Points |
|----------|--------|-----------|
| Inventario (telas) | [100, 2000] | 99, 100, 101, 1999, 2000, 2001 |
| Playeras por pedido | [50, 500] | 49, 50, 51, 499, 500, 501 |
| Playeras por venta | [1, 10] | 0, 1, 2, 9, 10, 11 |
| Precio playera | [0, 10000] | 0, 249, 250, 251, 9999, 10000, 10001 |
| Stock vs. disponibilidad | [0, da] | combinations of ca, stk, venta |

Standard BVA: min-1, min, min+1, max-1, max, max+1

---

### 3. Black-Box Testing — Equivalence Partitioning (Individual)
**Document:** `primer-parcial/prueba-caja-negra/individual/caja-negra.typ`

**Technique:** Partición de Equivalencia (Equivalence Partitioning)

**Exercises documented:**

#### Exercise 1: Financial Application
Variables: Principal [100, 100M], Inflación [1, 20], Interés [0, 25]
- 3 partitions per variable (valid, invalid-low, invalid-high)
- 9 test cases total

#### Exercise 2: Mathematical Function F(x)
- 3 real-number intervals: (-∞, -2), [-2, 4], (4, +∞)
- 3 equivalence classes, one representative value each

#### Exercise 3: Date Validation
- Variables: Día, Mes, Año
- Accounts for leap years (Año bisiesto) and variable month lengths
- Invalid classes: month out of range, day out of range, June max 30, non-leap February 29, year < 1900, year > 2199

---

## Document Validation (Manual)
The compilation step (Typst → PDF) implicitly validates:
- No syntax errors in `.typ` source
- All referenced packages exist and are compatible
- All linked assets (SVGs, embedded PDFs) are accessible
- Math formulas render without errors
- Tables and figures render correctly

**Compilation command (not automated, manual):**
```bash
typst compile [document].typ
```

---

## Quality Checks (Pending / Not Yet Established)
- [ ] No automated build/compile step in CI
- [ ] No PDF diff checking between commits
- [ ] Template duplication creates drift risk (3 copies of `portada-template.typ`)
- [ ] No linting for Typst source files
