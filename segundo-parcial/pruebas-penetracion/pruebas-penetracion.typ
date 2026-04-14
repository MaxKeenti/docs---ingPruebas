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

// TODO (Phase 3): Mind map con CeTZ del artículo SG #42
// Se construirá en la siguiente fase de ejecución.
