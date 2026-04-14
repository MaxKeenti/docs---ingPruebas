# Ingeniería de Pruebas — docs (6NM61, 2026-2)

## What This Is

Repositorio de documentación académica para la materia *Ingeniería de Pruebas* (6NM61, UPIICSA-IPN, semestre 2026-2), impartida por la Profesora González Arroyo Lilia. Cada entregable es un documento Typst compilado a PDF con la portada institucional IPN/UPIICSA, cubriendo técnicas de pruebas de software a lo largo del semestre por parciales.

## Core Value

**Cada entregable es un PDF bien estructurado, con portada institucional correcta, contenido académicamente riguroso, y compilable sin errores — entregado a tiempo.**

## Requirements

### Validated

<!-- Deliverables del primer parcial — ya completados y compilados. -->

- ✓ Examen de Caja Blanca (individual) — grafos de flujo, complejidad ciclomática, caminos básicos y casos de prueba para 2 bloques de código — `primer-parcial/primer-examen/`
- ✓ Prueba de Caja Negra en equipo — Análisis de Valores Frontera para sistema "Telas Inventario" (5 variables) — `primer-parcial/prueba-caja-negra/equipo/`
- ✓ Prueba de Caja Negra individual — Partición de Equivalencia para 3 ejercicios (app financiera, función F(x), validación de fechas) — `primer-parcial/prueba-caja-negra/individual/`
- ✓ Template de portada institucional reutilizable (`portada-template.typ`)

### Active

<!-- Segundo parcial — trabajo en progreso. -->

- [ ] Documento de resumen de Pruebas de Penetración (equipo): definición general de pen testing + resumen del artículo SG #42 de iOS pen testing + organizadores gráficos (mind map y cuadro sinóptico), en un solo archivo `.typ`

### Out of Scope

- Investigación adicional más allá del artículo SG #42 para el resumen de iOS — el documento se ciñe a lo que el artículo cubre fielmente
- Deliverables individuales para el segundo parcial — solo equipo por ahora
- Aplicaciones o código fuente de software — este repo es exclusivamente documentación académica

## Context

- **Equipo:** Albarrán Soto Alexis Kevin, León Merino Ángel Mauricio, Sosa Montoya Melanie Rubí, Ramírez Lescas Eliu, Camacho Colin Camila Danae, Gonzalez Calzada Maximiliano, Ferrusca Pineda Mildred Arely (7 integrantes — mismo del primer parcial)
- **Boleta principal (maintainer):** 2021601769 (Gonzalez Calzada Maximiliano)
- **Toolchain:** Typst con `@preview/cetz:0.4.2` (grafos y diagramas) y `@preview/codly:1.3.0` (bloques de código numerados)
- **Organizadores gráficos elegidos:** Mind map con CeTZ (resumen del artículo SG #42) + cuadro sinóptico con tabla Typst (definición general de pen testing)
- **Contenido del artículo fuente:** Carlos Joaquín Brito Abundis, SG #42 — Introducción a las pruebas de penetración en dispositivos iOS. Cubre: tipos de apps iOS (nativas/híbridas), clasificación de pen testing (caja blanca/negra/gris), vectores de ataque, metodología (information gathering → intercepción de tráfico → análisis en ejecución), OWASP iOS checklist, herramientas (Burp Suite, Wireshark, tcpdump)
- **Estructura del directorio:** `segundo-parcial/` existe pero está vacío — es el destino de los nuevos entregables

## Constraints

- **Compilación:** Los documentos deben compilar con Typst sin errores (fuentes instaladas localmente: ITC Avant Garde Gothic, JetBrainsMono NFM)
- **Assets:** Logos IPN/UPIICSA SVG deben estar en `media/logos/` dentro del directorio del documento
- **Template:** `portada-template.typ` debe estar copiado localmente en cada directorio de documento (patrón establecido)
- **Idioma:** Todo el contenido académico en español

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Mind map con CeTZ para resumen del artículo | Radiación natural de conceptos desde "Pen Testing en iOS"; CeTZ ya está en uso en el repo | — Pendiente |
| Cuadro sinóptico (tabla Typst) para definición general | Clasificación jerárquica clara de tipos de prueba; patrón simple y legible | — Pendiente |
| Un solo documento para ambos temas | Requerimiento del entregable: una sola entrega para el equipo | — Pendiente |
| Resumen fiel al artículo (sin investigación adicional) | Alcance del ejercicio académico especificado por el usuario | — Pendiente |

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `/gsd-transition`):
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone** (via `/gsd-complete-milestone`):
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-04-14 after initialization*
