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

// ─────────────────────────────────────────────────────────────
// SECCIÓN 1: ¿Qué son las Pruebas de Penetración?
// ─────────────────────────────────────────────────────────────

= ¿Qué son las Pruebas de Penetración?

Las *pruebas de penetración* (o _pen testing_, del inglés _penetration testing_) son un conjunto de técnicas de evaluación de seguridad en las que un profesional autorizado simula ataques reales contra un sistema, aplicación o infraestructura de TI, con el objetivo de identificar vulnerabilidades antes de que puedan ser explotadas por actores maliciosos. A diferencia de los análisis de vulnerabilidades automatizados, las pruebas de penetración implican un proceso activo y creativo de explotación controlada.

El profesional encargado de llevar a cabo estas pruebas debe contar con conocimiento de la arquitectura del sistema objetivo, las tecnologías involucradas y los vectores de ataque más comunes. El resultado del proceso es un reporte que documenta las vulnerabilidades descubiertas, su severidad y las recomendaciones para mitigarlas.

== Tipos de Pruebas de Penetración

Dependiendo del nivel de información con que cuenta el evaluador, las pruebas de penetración se clasifican en tres categorías principales:

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: (center, left, left, left),
    fill: (col, row) => if row == 0 { rgb("2563EB").lighten(10%) } else if calc.odd(row) { rgb("F0F4FF") } else { white },
    table.header(
      text(fill: white)[*Tipo*],
      text(fill: white)[*Acceso al código / documentación*],
      text(fill: white)[*Ataque simulado*],
      text(fill: white)[*Aspectos evaluados*],
    ),
    // Caja Blanca
    [*Caja Blanca*],
    [Acceso completo al código fuente y documentación del sistema],
    [Empleado interno con privilegios (insider threat)],
    [Fallas lógicas, caminos mal estructurados, flujo de entradas, ciclos y condiciones, hoyos de seguridad interna, funciones individuales],
    // Caja Negra
    [*Caja Negra*],
    [Sin acceso al código ni documentación; solo versión pública de la aplicación],
    [Ataque externo (hacker) — intercepción de tráfico e inyección de contenido malicioso],
    [XSS, inyección SQL, inyección de comandos, inyección de links, intercepción de tráfico],
    // Caja Gris
    [*Caja Gris*],
    [Acceso parcial al código y documentación, usados como guía],
    [Combinación de ambos escenarios anteriores],
    [Análisis con ventaja informacional limitada; combina técnicas de caja blanca y negra],
  ),
  caption: [Clasificación de las pruebas de penetración según el nivel de acceso al sistema],
)

// ─────────────────────────────────────────────────────────────
// SECCIÓN 2: Resumen del artículo SG #42
// ─────────────────────────────────────────────────────────────

#pagebreak()

= Resumen: Introducción a las Pruebas de Penetración en Dispositivos iOS

_Carlos Joaquín Brito Abundis — SG Buzz, Revista #42, sección Prácticas_

== Contexto y relevancia

Apple se ha consolidado como una de las marcas más valiosas del mundo, con alrededor de 700 millones de dispositivos corriendo iOS, más de un millón de aplicaciones disponibles y más de 60 mil millones de descargas acumuladas. Estos dispositivos se utilizan tanto en el ámbito personal como empresarial, almacenando información sensible que los convierte en objetivos de alto valor.

Un factor determinante en la superficie de ataque es la posibilidad de realizar _jailbreak_ al dispositivo, lo que permite ejecutar aplicaciones no verificadas por Apple y otorga privilegios de usuario _root_. Aunado a esto, se ha contabilizado más de un millón de variantes de _malware_ para dispositivos móviles, lo que justifica el estudio sistemático de la seguridad de las aplicaciones iOS.

== Tipos de aplicaciones en iOS

Las aplicaciones iOS se clasifican en dos categorías principales según su arquitectura:

- *Aplicaciones nativas:* Desarrolladas en Objective-C con el framework Cocoa Touch. Son vulnerables principalmente a ataques de tipo _buffer overflow_.
- *Aplicaciones híbridas:* Implementan parte o la totalidad de su lógica en HTML, CSS y JavaScript. Están expuestas a ataques de _Cross Site Scripting_ (XSS), _Cross Site Request Forgery_ (XSRF) y también _buffer overflow_.

== Clasificación de las pruebas en el contexto móvil

El artículo retoma la clasificación estándar de las pruebas de penetración aplicada al entorno iOS:

- *Caja Blanca:* El evaluador cuenta con código fuente y documentación. Permite detectar fallas lógicas, caminos incorrectos en el código, ciclos, condiciones y hoyos de seguridad interna.
- *Caja Negra:* Sin acceso al código, solo a la versión pública de la aplicación. Simula un ataque externo mediante intercepción de tráfico e inyección de contenido malicioso (XSS, inyección SQL, inyección de comandos).
- *Caja Gris:* Combinación de ambas, donde el código y la documentación actúan como guía de análisis.

El artículo destaca que un atacante solo necesita encontrar *un* vector de ataque exitoso, mientras que el evaluador profesional debe detectar la *mayor cantidad posible* de vulnerabilidades.

== Vectores de ataque

La arquitectura de una aplicación móvil define tres vectores de ataque principales:

+ *Software en el dispositivo:* La aplicación en sí misma, sus datos locales y permisos.
+ *Canal de comunicación:* El tráfico de red entre la app y los servicios de backend.
+ *Infraestructura del servidor:* Los servicios y APIs que soportan la aplicación.

== Metodología general

El proceso de prueba inicia con la fase de *information gathering* (recolección de información), cuyo objetivo es comprender el comportamiento esperado de la aplicación y las tecnologías que utiliza.

Los pasos metodológicos descritos son:

+ Familiarizarse con la aplicación como usuario común, navegando y entendiendo el flujo normal.
+ Configurar el dispositivo para utilizar un _proxy_ (p. ej. *Burp Suite*) e interceptar el tráfico HTTP/HTTPS.
+ Analizar, modificar y reenviar paquetes para observar el comportamiento de la aplicación ante entradas manipuladas.
+ Complementar con herramientas de _sniffing_ como *tcpdump* y *Wireshark* para ampliar el análisis de tráfico.
+ Prestar atención a: mensajes de error, inyección SQL, manejo de sesiones, criptografía débil, notificaciones Push, autenticación, autorización, almacenamiento local y validación de datos.

A partir del análisis del tráfico se pueden generar _fuzzing cases_ o modelos de amenazas (como *STRIDE*) para identificar áreas de riesgo. El artículo también menciona el análisis en tiempo de ejecución, el estudio del almacenamiento local (logs, respaldos, SQLite, caché del teclado) y las implicaciones del contexto BYOD (_Bring Your Own Device_).

== OWASP y checklist de evaluación

El _Open Web Application Security Project_ (OWASP) proporciona una guía específica para la evaluación de aplicaciones iOS, que contempla dos checklists:

- *Checklist de plataforma:* Aspectos del sistema operativo iOS relevantes para la seguridad.
- *Checklist de red:* Aspectos relacionados con ataques de red y comunicaciones.

Estas listas sirven como marco de referencia para asegurar una cobertura completa durante la evaluación.

== Amenazas emergentes

El artículo concluye señalando el incremento sostenido de aplicaciones maliciosas y amenazas móviles, incluyendo _malware_, gusanos, _ransomware_, _spam_ SMS, _smishing_ y botnets móviles. Recomienda que los usuarios estén conscientes de los privilegios que otorgan a las aplicaciones, el tipo de información que almacenan y si utilizan cifrado tanto para almacenamiento como para comunicación en red.

=== Referencia bibliográfica

Brito Abundis, C. J. (s.f.). Introducción a las pruebas de penetración en dispositivos iOS. _SG Buzz, Revista #42_, sección Prácticas. Instituto Politécnico Nacional / Software Guru. Recuperado de #link("https://sg.com.mx/revista/42/introduccion-las-pruebas-penetracion-dispositivos-ios")

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
    // RAMA 2 — Tipos de Aplicación  (arriba-derecha, ~30°)
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
