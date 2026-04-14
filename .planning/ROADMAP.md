# ROADMAP: Ingeniería de Pruebas — docs (6NM61, 2026-2)

**Milestone:** Segundo Parcial
**Generated:** 2026-04-14
**Granularity:** Coarse (3 phases)
**Requirements coverage:** 16/16 ✓

---

## Milestone Overview

| # | Phase | Goal | Requirements | Status |
|---|-------|------|--------------|--------|
| 1 | Scaffold del Documento | Estructura base compilable con portada del equipo | ESTR-01, ESTR-02, ESTR-03, ESTR-04 | ⬜ Pending |
| 2 | Contenido: Pen Testing | Secciones de definición general y resumen del artículo SG #42 | PENT-01..04, ARTI-01..04 | ⬜ Pending |
| 3 | Organizador Gráfico | Mind map del artículo con CeTZ + revisión final | MMAP-01..04 | ⬜ Pending |

---

## Phase 1: Scaffold del Documento

**Goal:** Crear la estructura Typst base del documento de segundo parcial que compile sin errores, con portada institucional completa (7 integrantes del equipo) y los mismos estilos del primer parcial.

**Requirements:** ESTR-01, ESTR-02, ESTR-03, ESTR-04

**Deliverables:**
- `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` — fuente principal
- `segundo-parcial/pruebas-penetracion/portada-template.typ` — copia del template
- `segundo-parcial/pruebas-penetracion/media/logos/IPN_Logo.svg` — logo
- `segundo-parcial/pruebas-penetracion/media/logos/UPIICSA_Logo.svg` — logo
- `segundo-parcial/pruebas-penetracion/pruebas-penetracion.pdf` — compilado (opcional en fase 1, definitivo en fase 3)

**Plans:**
1. Crear estructura de directorios y copiar assets
2. Escribir el scaffolding `.typ` con imports, configuración global y `#portada(...)` del equipo
3. Verificar compilación limpia

**Success Criteria:**
1. `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` existe y tiene la estructura de imports + portada
2. Los logos SVG existen en `media/logos/`
3. El documento compila sin errores de Typst (o al menos sin errores de estructura — la compilación requiere fuentes locales)
4. La portada incluye los 7 integrantes del equipo, la boleta, materia y profesora correctos

**Depends on:** Codebase map (completed)

---

## Phase 2: Contenido — Pen Testing

**Goal:** Escribir las dos secciones de contenido: (1) definición académica de pruebas de penetración con cuadro sinóptico, (2) resumen fiel del artículo SG #42 de iOS pen testing con referencia bibliográfica.

**Requirements:** PENT-01, PENT-02, PENT-03, PENT-04, ARTI-01, ARTI-02, ARTI-03, ARTI-04

**Plans:**
1. Escribir sección "¿Qué son las Pruebas de Penetración?" con definición y clasificación
2. Escribir cuadro sinóptico Typst (tabla estructurada) para Caja Blanca / Caja Negra / Caja Gris
3. Escribir sección de resumen del artículo SG #42 (condensación fiel de los temas: contexto iOS, tipos de apps, clasificación, vectores, metodología, OWASP)
4. Agregar referencia bibliográfica del artículo

**Success Criteria:**
1. Sección "Pruebas de Penetración" define el concepto con precisión académica
2. Cuadro sinóptico cubre los 3 tipos de prueba con sus características clave (acceso al código, qué simula, técnicas/vulnerabilidades)
3. Resumen del artículo abarca todos los temas principales sin agregar info externa
4. Referencia bibliográfica del artículo SG #42 incluida correctamente

**Depends on:** Phase 1

---

## Phase 3: Mind Map + Revisión Final

**Goal:** Construir el mind map del artículo SG #42 con CeTZ, compilar el PDF final y revisar el documento completo.

**UI hint:** no
**Requirements:** MMAP-01, MMAP-02, MMAP-03, MMAP-04

**Plans:**
1. Diseñar y construir el mind map del artículo con CeTZ (nodo central + ramas temáticas: Contexto iOS / Tipos de App / Tipos de Prueba / Vectores de Ataque / Metodología / Herramientas / OWASP)
2. Ajustar layout del mind map para que sea legible en PDF
3. Revisar el documento completo (ortografía, coherencia, portada, numeración)
4. Compilar PDF final y commitearlo

**Success Criteria:**
1. Mind map tiene nodo central "Pen Testing en iOS" con ≥5 ramas temáticas
2. Cada rama tiene al menos un sub-nodo con detalle
3. El mind map compila sin errores de CeTZ
4. El PDF compilado final está commiteado en el repositorio
5. El documento pasa revisión visual completa (portada, índice lógico de secciones, ortografía)

**Depends on:** Phase 2

---

## Backlog (999.x)

*(Vacío — todos los requerimientos v1 están en el roadmap activo)*

---

## Completed Phases

*(Ninguna aún en este milestone — primer parcial está archivado)*

---

*Roadmap generado: 2026-04-14*
*Milestone activo: Segundo Parcial*
