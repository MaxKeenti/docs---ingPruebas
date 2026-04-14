---
phase: 3
name: Mind Map + Revisión Final
wave: 1
total_waves: 1
parallelization: sequential
requirements: [MMAP-01, MMAP-02, MMAP-03, MMAP-04]
files_modified:
  - segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ
autonomous: true
---

# Plan: Phase 3 — Mind Map + Revisión Final

**Goal:** Reemplazar el TODO placeholder de la Sección 3 con un mind map completo construido con CeTZ que organice visualmente los temas del artículo SG #42 ("Introducción a las pruebas de penetración en dispositivos iOS").

**Requirements:** MMAP-01, MMAP-02, MMAP-03, MMAP-04

---

## must_haves

- El mind map reemplaza el `// TODO (Phase 3)` de la línea 189 del documento
- Nodo central: "Pen Testing en iOS"
- ≥5 ramas temáticas principales conectadas al centro
- Cada rama tiene ≥2 sub-nodos con detalle del artículo
- El bloque CeTZ no produce errores de compilación (estructura válida)
- El documento mantiene su `#pagebreak()` antes de la Sección 3

---

## Wave 1 — Mind Map (Single Task)

### Task 3.1: Implementar el mind map CeTZ en la Sección 3

<read_first>
- `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` — líneas 181-191 (placeholder a reemplazar)
- `primer-parcial/primer-examen/Caja-Blanca_GonzalezCalzadaMaximiliano.typ` — líneas 100-160 (patrón de uso de CeTZ: `cetz.canvas`, `circle`, `line`, `content`, `node-style`)
</read_first>

<action>
Reemplazar las líneas 181–191 del archivo `segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ` (el bloque `// SECCIÓN 3` con el TODO) con el siguiente bloque completo. **Reemplazar el bloque entero; no agregar encima del TODO.**

El bloque a reemplazar es exactamente:
```
// ─────────────────────────────────────────────────────────────
// SECCIÓN 3: Organizador Gráfico — Mind Map
// ─────────────────────────────────────────────────────────────

#pagebreak()

= Organizador Gráfico

// TODO (Phase 3): Mind map con CeTZ del artículo SG #42
// Se construirá en la siguiente fase de ejecución.
```

Reemplazar con:
```typst
// ─────────────────────────────────────────────────────────────
// SECCIÓN 3: Organizador Gráfico — Mind Map
// ─────────────────────────────────────────────────────────────

#pagebreak()

= Organizador Gráfico

El siguiente mapa mental sintetiza los temas principales del artículo _"Introducción a las pruebas de penetración en dispositivos iOS"_ de Carlos Joaquín Brito Abundis (SG #42).

#set page(width: auto, height: auto, margin: 1.5cm)

#figure(
  cetz.canvas(length: 1cm, {
    import cetz.draw: *

    // ── Estilos ──────────────────────────────────────────────
    let c-style   = (radius: 1.35, stroke: 1.5pt + rgb("1E3A8A"), fill: rgb("1D4ED8"))
    let b-style   = (radius: 0.85, stroke: 1pt + rgb("1E40AF"), fill: rgb("3B82F6").lighten(30%))
    let l-style   = (radius: 0.65, stroke: 0.6pt + rgb("93C5FD"), fill: rgb("DBEAFE"))
    let edge      = (stroke: 0.8pt + rgb("60A5FA"))
    let edge-leaf = (stroke: 0.5pt + rgb("93C5FD"))

    // ── Nodo Central ─────────────────────────────────────────
    circle((0, 0), name: "c", ..c-style)
    content("c", text(fill: white, weight: "bold", size: 0.72em)[Pen Testing\ en iOS])

    // ══════════════════════════════════════════════════════════
    // RAMA 1 — Contexto iOS  (arriba, 90°)
    // ══════════════════════════════════════════════════════════
    circle((0, 4), name: "ctx", ..b-style)
    content("ctx", text(weight: "bold", size: 0.65em)[Contexto iOS])
    line("c", "ctx", ..edge)

    circle((-1.9, 5.6), name: "ctx1", ..l-style)
    content("ctx1", text(size: 0.55em)[700 M\ dispositivos])
    line("ctx", "ctx1", ..edge-leaf)

    circle((0, 6.1), name: "ctx2", ..l-style)
    content("ctx2", text(size: 0.55em)[Jailbreak\ + root])
    line("ctx", "ctx2", ..edge-leaf)

    circle((1.9, 5.6), name: "ctx3", ..l-style)
    content("ctx3", text(size: 0.55em)[> 1 M\ malware])
    line("ctx", "ctx3", ..edge-leaf)

    // ══════════════════════════════════════════════════════════
    // RAMA 2 — Tipos de App  (arriba-derecha, ~30°)
    // ══════════════════════════════════════════════════════════
    circle((3.5, 2.5), name: "app", ..b-style)
    content("app", text(weight: "bold", size: 0.62em)[Tipos de\ Aplicación])
    line("c", "app", ..edge)

    circle((5.3, 3.6), name: "app1", ..l-style)
    content("app1", text(size: 0.55em)[Nativa (Obj-C)\ buffer overflow])
    line("app", "app1", ..edge-leaf)

    circle((5.4, 1.5), name: "app2", ..l-style)
    content("app2", text(size: 0.55em)[Híbrida (JS)\ XSS · XSRF])
    line("app", "app2", ..edge-leaf)

    // ══════════════════════════════════════════════════════════
    // RAMA 3 — Vectores de Ataque  (derecha, ~−10°)
    // ══════════════════════════════════════════════════════════
    circle((4.5, -0.5), name: "vec", ..b-style)
    content("vec", text(weight: "bold", size: 0.62em)[Vectores de\ Ataque])
    line("c", "vec", ..edge)

    circle((6.4, 0.7), name: "vec1", ..l-style)
    content("vec1", text(size: 0.55em)[Dispositivo\ (app + datos)])
    line("vec", "vec1", ..edge-leaf)

    circle((6.5, -0.6), name: "vec2", ..l-style)
    content("vec2", text(size: 0.55em)[Canal de\ comunicación])
    line("vec", "vec2", ..edge-leaf)

    circle((6.4, -1.9), name: "vec3", ..l-style)
    content("vec3", text(size: 0.55em)[Infraestructura\ del servidor])
    line("vec", "vec3", ..edge-leaf)

    // ══════════════════════════════════════════════════════════
    // RAMA 4 — Metodología  (abajo-derecha, ~−120°)
    // ══════════════════════════════════════════════════════════
    circle((2, -4), name: "met", ..b-style)
    content("met", text(weight: "bold", size: 0.65em)[Metodología])
    line("c", "met", ..edge)

    circle((4.1, -5.1), name: "met1", ..l-style)
    content("met1", text(size: 0.55em)[Info Gathering\ (reconocimiento)])
    line("met", "met1", ..edge-leaf)

    circle((2, -6.1), name: "met2", ..l-style)
    content("met2", text(size: 0.55em)[Proxy: Burp Suite\ intercepción HTTP])
    line("met", "met2", ..edge-leaf)

    circle((0, -5.6), name: "met3", ..l-style)
    content("met3", text(size: 0.55em)[Sniffing: Wireshark\ tcpdump])
    line("met", "met3", ..edge-leaf)

    // ══════════════════════════════════════════════════════════
    // RAMA 5 — OWASP  (abajo-izquierda, ~−150°)
    // ══════════════════════════════════════════════════════════
    circle((-2.5, -3.5), name: "owasp", ..b-style)
    content("owasp", text(weight: "bold", size: 0.65em)[OWASP iOS])
    line("c", "owasp", ..edge)

    circle((-4.6, -4.6), name: "owasp1", ..l-style)
    content("owasp1", text(size: 0.55em)[Checklist\ plataforma])
    line("owasp", "owasp1", ..edge-leaf)

    circle((-4.6, -2.8), name: "owasp2", ..l-style)
    content("owasp2", text(size: 0.55em)[Checklist\ ataques de red])
    line("owasp", "owasp2", ..edge-leaf)

    // ══════════════════════════════════════════════════════════
    // RAMA 6 — Tipos de Prueba  (izquierda, ~180°)
    // ══════════════════════════════════════════════════════════
    circle((-4, 0.3), name: "tipos", ..b-style)
    content("tipos", text(weight: "bold", size: 0.62em)[Tipos de\ Prueba])
    line("c", "tipos", ..edge)

    circle((-6.1, 1.8), name: "tipos1", ..l-style)
    content("tipos1", text(size: 0.55em)[Caja Blanca\ (código fuente)])
    line("tipos", "tipos1", ..edge-leaf)

    circle((-6.3, 0.3), name: "tipos2", ..l-style)
    content("tipos2", text(size: 0.55em)[Caja Negra\ (versión pública)])
    line("tipos", "tipos2", ..edge-leaf)

    circle((-6.1, -1.2), name: "tipos3", ..l-style)
    content("tipos3", text(size: 0.55em)[Caja Gris\ (acceso parcial)])
    line("tipos", "tipos3", ..edge-leaf)

    // ══════════════════════════════════════════════════════════
    // RAMA 7 — Amenazas  (arriba-izquierda, ~150°)
    // ══════════════════════════════════════════════════════════
    circle((-3, 2.5), name: "amen", ..b-style)
    content("amen", text(weight: "bold", size: 0.65em)[Amenazas])
    line("c", "amen", ..edge)

    circle((-5, 3.9), name: "amen1", ..l-style)
    content("amen1", text(size: 0.55em)[Malware\ ransomware])
    line("amen", "amen1", ..edge-leaf)

    circle((-5.2, 2), name: "amen2", ..l-style)
    content("amen2", text(size: 0.55em)[Smishing\ botnet móvil])
    line("amen", "amen2", ..edge-leaf)

  }),
  caption: [Mapa mental: Introducción a las pruebas de penetración en dispositivos iOS (Brito Abundis, SG #42)],
)<mindmap-ios-pentest>

#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)
```

**Instrucción de edición:** Localizar el bloque que comienza en `// ─────────────────────────────────────────────────────────────` seguido de `// SECCIÓN 3:` y termina en la línea vacía después de `// Se construirá en la siguiente fase de ejecución.` (actualmente las últimas 11 líneas del archivo) y reemplazarlo completo con el bloque de arriba.
</action>

<acceptance_criteria>
- `pruebas-penetracion.typ` ya NO contiene la cadena `// TODO (Phase 3)`
- El archivo contiene `cetz.canvas(length: 1cm`
- El archivo contiene el text `"Pen Testing\\ en iOS"` dentro del canvas
- El archivo contiene `circle((0, 4), name: "ctx"` (rama Contexto iOS)
- El archivo contiene `circle((3.5, 2.5), name: "app"` (rama Tipos de App)
- El archivo contiene `circle((4.5, -0.5), name: "vec"` (rama Vectores)
- El archivo contiene `circle((2, -4), name: "met"` (rama Metodología)
- El archivo contiene `circle((-2.5, -3.5), name: "owasp"` (rama OWASP)
- El archivo contiene `circle((-4, 0.3), name: "tipos"` (rama Tipos de Prueba)
- El archivo contiene `circle((-3, 2.5), name: "amen"` (rama Amenazas)
- El archivo contiene `<mindmap-ios-pentest>` (figura con label)
- El archivo contiene `#set page(` dos veces después del mind map (restore de página)
</acceptance_criteria>

---

## Verification

```bash
echo "=== Phase 3 Verification ===" && \
grep -qv "TODO (Phase 3)" segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && \
  echo "✓ TODO placeholder removed" || echo "✗ TODO still present" && \
grep -q 'cetz.canvas(length: 1cm' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && \
  echo "✓ CeTZ canvas present" || echo "✗ CeTZ canvas MISSING" && \
grep -q 'Pen Testing' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && \
  echo "✓ center node present" || echo "✗ center node MISSING" && \
BRANCHES=$(grep -c 'name: "ctx"\|name: "app"\|name: "vec"\|name: "met"\|name: "owasp"\|name: "tipos"\|name: "amen"' \
  segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ) && \
test "$BRANCHES" -ge 7 && echo "✓ 7 main branches (${BRANCHES})" || echo "✗ branches incomplete (${BRANCHES}/7)" && \
grep -q '<mindmap-ios-pentest>' segundo-parcial/pruebas-penetracion/pruebas-penetracion.typ && \
  echo "✓ figure label present" || echo "✗ figure label MISSING" && \
echo "=== Done ==="
```

---

*Plan created: 2026-04-14*
*Phase: 03-mind-map-revision-final*
