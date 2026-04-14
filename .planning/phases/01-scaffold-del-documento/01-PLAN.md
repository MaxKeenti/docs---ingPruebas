---
phase: 1
name: Scaffold del Documento
wave: 1
total_waves: 1
parallelization: sequential
requirements: [ESTR-01, ESTR-02, ESTR-03, ESTR-04]
files_modified:
  - segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ
  - segundo-parcial/pruebas-penetracion/portada-template.typ
  - segundo-parcial/pruebas-penetracion/media/logos/IPN_Logo.svg
  - segundo-parcial/pruebas-penetracion/media/logos/UPIICSA_Logo.svg
autonomous: true
---

# Plan: Phase 1 — Scaffold del Documento

**Goal:** Crear la estructura Typst base compilable del documento de segundo parcial con portada institucional completa de los 7 integrantes del equipo, siguiendo exactamente los patrones establecidos en `primer-parcial/`.

**Requirements:** ESTR-01, ESTR-02, ESTR-03, ESTR-04

---

## must_haves

- El archivo `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` existe con imports correctos y la macro `#portada(...)` rellena con los 7 integrantes
- Los logos SVG existen en `segundo-parcial/pruebas-penetracion/media/logos/`
- `portada-template.typ` copiado en el directorio del documento
- El scaffolding tiene placeholders para las 3 secciones futuras (pen testing general, resumen artículo, mind map)

---

## Wave 1 — Setup y Scaffold (Sequential)

### Task 1.1: Crear estructura de directorios y copiar assets

<read_first>
- `primer-parcial/prueba-caja-negra/equipo/portada-template.typ` — template a copiar
- `primer-parcial/prueba-caja-negra/equipo/media/logos/IPN_Logo.svg` — logo a copiar
- `primer-parcial/prueba-caja-negra/equipo/media/logos/UPIICSA_Logo.svg` — logo a copiar
</read_first>

<action>
Crear el árbol de directorios y copiar los assets compartidos desde el primer parcial:

```bash
mkdir -p segundo-parcial/pruebas-penetracion/media/logos

# Copiar logos desde equipo del primer parcial (fuente canónica)
cp primer-parcial/prueba-caja-negra/equipo/media/logos/IPN_Logo.svg \
   segundo-parcial/pruebas-penetracion/media/logos/IPN_Logo.svg

cp primer-parcial/prueba-caja-negra/equipo/media/logos/UPIICSA_Logo.svg \
   segundo-parcial/pruebas-penetracion/media/logos/UPIICSA_Logo.svg

# Copiar portada-template.typ (patrón establecido: copia local por directorio)
cp primer-parcial/prueba-caja-negra/equipo/portada-template.typ \
   segundo-parcial/pruebas-penetracion/portada-template.typ
```
</action>

<acceptance_criteria>
- `segundo-parcial/pruebas-penetracion/media/logos/IPN_Logo.svg` existe y tiene el mismo contenido que `primer-parcial/prueba-caja-negra/equipo/media/logos/IPN_Logo.svg`
- `segundo-parcial/pruebas-penetracion/media/logos/UPIICSA_Logo.svg` existe y tiene el mismo contenido que `primer-parcial/prueba-caja-negra/equipo/media/logos/UPIICSA_Logo.svg`
- `segundo-parcial/pruebas-penetracion/portada-template.typ` existe y contiene `#let portada(`
</acceptance_criteria>

---

### Task 1.2: Escribir el scaffolding principal `pruebas-penetracion.typ`

<read_first>
- `primer-parcial/prueba-caja-negra/equipo/caja-negra.typ` — patrón de imports, configuración global, y uso de portada
- `segundo-parcial/pruebas-penetracion/portada-template.typ` — para confirmar la firma de `portada()`
</read_first>

<action>
Crear `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` con el siguiente contenido exacto:

```typst
#import "@preview/cetz:0.4.2"
#import "portada-template.typ": portada

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

#let integrantes = (
  "Albarrán Soto Alexis Kevin",
  "León Merino Ángel Mauricio",
  "Sosa Montoya Melanie Rubí",
  "Ramírez Lescas Eliu",
  "Camacho Colin Camila Danae",
  "Gonzalez Calzada Maximiliano",
  "Ferrusca Pineda Mildred Arely",
)

#portada(
  "UNIDAD DE APRENDIZAJE",
  "PRÁCTICA",
  "SECUENCIA Y PERIODO",
  "BOLETA",
  "ALUMNOS",
  "PROFESORA",
  "FECHA",
  "Ingeniería de Pruebas",
  "Pruebas de Penetración",
  "6NM61 2026-2",
  "2021601769",
  integrantes,
  "González Arroyo Lilia",
  "Abril de 2026",
)

#pagebreak()
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)

// ─────────────────────────────────────────
// SECCIÓN 1: ¿Qué son las Pruebas de Penetración?
// ─────────────────────────────────────────

= ¿Qué son las Pruebas de Penetración?

// TODO (Phase 2): Definición general de pen testing

== Tipos de Pruebas de Penetración

// TODO (Phase 2): Cuadro sinóptico (Caja Blanca / Caja Negra / Caja Gris)

// ─────────────────────────────────────────
// SECCIÓN 2: Resumen — iOS Pen Testing (SG #42)
// ─────────────────────────────────────────

#pagebreak()

= Resumen: Introducción a las Pruebas de Penetración en Dispositivos iOS

// TODO (Phase 2): Resumen fiel del artículo de Carlos Joaquín Brito Abundis

// ─────────────────────────────────────────
// SECCIÓN 3: Organizador Gráfico — Mind Map
// ─────────────────────────────────────────

#pagebreak()

= Organizador Gráfico

// TODO (Phase 3): Mind map con CeTZ del artículo SG #42
```

Todos los `integrantes`, materia, profesora y secuencia deben coincidir exactamente con los valores de arriba.
</action>

<acceptance_criteria>
- `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` existe
- El archivo contiene `#import "@preview/cetz:0.4.2"`
- El archivo contiene `#import "@preview/codly:1.3.0": *`
- El archivo contiene `#import "portada-template.typ": portada`
- El archivo contiene `"Albarrán Soto Alexis Kevin"` (primer integrante)
- El archivo contiene `"Ferrusca Pineda Mildred Arely"` (séptimo integrante)
- El archivo contiene `"Pruebas de Penetración"` como valor de materia/práctica
- El archivo contiene `"González Arroyo Lilia"` como profesora
- El archivo contiene `"6NM61 2026-2"` como secuencia
- El archivo contiene al menos 3 secciones con `=` headings (sección 1, 2 y 3)
- El archivo contiene comentarios `// TODO (Phase 2)` y `// TODO (Phase 3)` como placeholders
</acceptance_criteria>

---

## Verification

```bash
# Verificar todos los archivos existen
test -f segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && echo "✓ .typ exists" || echo "✗ .typ MISSING"
test -f segundo-parcial/pruebas-penetracion/portada-template.typ && echo "✓ portada-template exists" || echo "✗ portada-template MISSING"
test -f segundo-parcial/pruebas-penetracion/media/logos/IPN_Logo.svg && echo "✓ IPN logo exists" || echo "✗ IPN logo MISSING"
test -f segundo-parcial/pruebas-penetracion/media/logos/UPIICSA_Logo.svg && echo "✓ UPIICSA logo exists" || echo "✗ UPIICSA logo MISSING"

# Verificar contenido clave del .typ
grep -q '"Albarrán Soto Alexis Kevin"' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && echo "✓ integrantes present" || echo "✗ integrantes MISSING"
grep -q '"Pruebas de Penetración"' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && echo "✓ title correct" || echo "✗ title MISSING"
grep -q '"González Arroyo Lilia"' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && echo "✓ profesora correct" || echo "✗ profesora MISSING"
grep -q '"6NM61 2026-2"' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && echo "✓ secuencia correct" || echo "✗ secuencia MISSING"
grep -c '^=' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ | xargs -I{} test {} -ge 3 && echo "✓ ≥3 sections" || echo "✗ section count low"
```

All checks must output `✓`. No `✗` permitted.

---

*Plan created: 2026-04-14*
*Phase: 01-scaffold-del-documento*
