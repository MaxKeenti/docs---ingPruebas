# Requirements: Ingeniería de Pruebas — docs (6NM61, 2026-2)

**Defined:** 2026-04-14
**Core Value:** Cada entregable es un PDF bien estructurado, con portada institucional correcta, contenido académicamente riguroso, y compilable sin errores — entregado a tiempo.

## v1 Requirements

Entregable del segundo parcial (equipo): Documento de Pruebas de Penetración.

### Estructura del Documento

- [ ] **ESTR-01**: El documento tiene portada institucional IPN/UPIICSA con los 7 integrantes del equipo, boleta, materia, profesora y fecha
- [ ] **ESTR-02**: El documento compila a PDF sin errores desde el fuente `.typ`
- [ ] **ESTR-03**: El documento utiliza la misma hoja de estilos y configuración tipográfica del primer parcial (ITC Avant Garde Gothic, márgenes carta, numeración de página)
- [ ] **ESTR-04**: Los assets de logos (IPN, UPIICSA) están disponibles en `media/logos/` dentro del directorio del documento

### Contenido: Definición de Pruebas de Penetración

- [ ] **PENT-01**: La sección define qué son las pruebas de penetración (pen testing) de forma precisa y académica
- [ ] **PENT-02**: La sección clasifica los tipos de pen testing: Caja Blanca, Caja Negra y Caja Gris, con descripción de cada uno
- [ ] **PENT-03**: La sección incluye un cuadro sinóptico (tabla Typst estructurada) que organiza jerárquicamente los tipos de prueba con sus características clave
- [ ] **PENT-04**: El cuadro sinóptico es visualmente claro y legible en el PDF compilado

### Contenido: Resumen del Artículo SG #42

- [ ] **ARTI-01**: La sección presenta un resumen fiel del artículo "Introducción a las pruebas de penetración en dispositivos iOS" de Carlos Joaquín Brito Abundis (SG #42)
- [ ] **ARTI-02**: El resumen cubre los temas principales del artículo: contexto iOS, tipos de apps, clasificación de pruebas, vectores de ataque, metodología, OWASP checklist
- [ ] **ARTI-03**: El resumen NO agrega información externa al artículo — es una condensación fiel
- [ ] **ARTI-04**: La sección incluye la referencia bibliográfica correcta del artículo

### Organizador Gráfico: Mind Map del Artículo

- [ ] **MMAP-01**: Se incluye un mind map del artículo SG #42 construido con la librería CeTZ de Typst
- [ ] **MMAP-02**: El mind map tiene un nodo central ("Pen Testing en iOS") con ramas principales correspondientes a los temas del artículo
- [ ] **MMAP-03**: El mind map compila correctamente y no genera errores de CeTZ
- [ ] **MMAP-04**: El mind map tiene suficiente detalle para ser útil como organizador visual del artículo

## v2 Requirements

### Posibles Entregables Futuros del Segundo Parcial

- **FUT-01**: Eventual entregable individual del segundo parcial (alcance aún no definido por la profesora)
- **FUT-02**: Documentación de técnicas adicionales de pen testing más allá del artículo SG #42

## Out of Scope

| Feature | Reason |
|---------|--------|
| Investigación adicional sobre iOS pen testing | El ejercicio pide resumen fiel del artículo SG #42 únicamente |
| Documentos separados por integrante | Solo se requiere un documento de equipo |
| Automatización de compilación (CI/CD) | Alcance académico; compilación es manual |
| Corrección del template `portada-template.typ` (duplicado en 3 dirs) | Deuda técnica conocida, mayor a su beneficio para el semestre |
| Animaciones o elementos interactivos en el PDF | Typst genera PDF estático |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| ESTR-01 | Phase 1 | Pending |
| ESTR-02 | Phase 1 | Pending |
| ESTR-03 | Phase 1 | Pending |
| ESTR-04 | Phase 1 | Pending |
| PENT-01 | Phase 2 | Pending |
| PENT-02 | Phase 2 | Pending |
| PENT-03 | Phase 2 | Pending |
| PENT-04 | Phase 2 | Pending |
| ARTI-01 | Phase 2 | Pending |
| ARTI-02 | Phase 2 | Pending |
| ARTI-03 | Phase 2 | Pending |
| ARTI-04 | Phase 2 | Pending |
| MMAP-01 | Phase 3 | Pending |
| MMAP-02 | Phase 3 | Pending |
| MMAP-03 | Phase 3 | Pending |
| MMAP-04 | Phase 3 | Pending |

**Coverage:**
- v1 requirements: 16 total
- Mapped to phases: 16
- Unmapped: 0 ✓

---
*Requirements defined: 2026-04-14*
*Last updated: 2026-04-14 after initial definition*
