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
// SUBSECCIÓN: Ethical Hacking
// ─────────────────────────────────────────────────────────────

== Ethical Hacking

El _ethical hacking_ (o *hacking ético*) es la práctica de explotar sistemas informáticos de forma deliberada y autorizada para identificar vulnerabilidades de seguridad, antes de que un actor malicioso pueda aprovecharlas. A diferencia del hacking malicioso, el hacking ético se realiza siempre con el conocimiento y el consentimiento explícito del propietario del sistema objetivo.

=== Principios fundamentales

- *Autorización explícita:* El evaluador trabaja bajo un contrato o acuerdo que delimita claramente el alcance de las pruebas. Actuar fuera de ese alcance constituye un delito.
- *Alcance delimitado:* Solo se evalúan los sistemas, redes o aplicaciones específicamente listados en el acuerdo. Cualquier sistema fuera del alcance es intocable.
- *Reporte responsable:* Los hallazgos se documentan en un reporte detallado que se entrega confidencialmente al cliente, con severidad, evidencia y recomendaciones.
- *No daño intencional:* El objetivo es identificar vulnerabilidades, no explotar daños permanentes ni comprometer datos reales.

=== Relación con las pruebas de penetración

El hacking ético abarca las pruebas de penetración como su técnica central, pero también incluye auditorías de configuración, análisis de riesgo, ingeniería social controlada (phishing simulado) y revisión de arquitecturas de seguridad. Toda prueba de penetración es hacking ético, pero no todo hacking ético es necesariamente una prueba de penetración.

=== Fases del proceso

+ *Reconocimiento (Information Gathering):* Recopilación pasiva y activa de información sobre el objetivo: dominios, IPs, tecnologías, empleados, servicios expuestos.
+ *Escaneo y enumeración:* Identificación de puertos abiertos, servicios activos, versiones de software y posibles puntos de entrada mediante herramientas como Nmap o Nessus.
+ *Explotación controlada:* Intento de aprovechar las vulnerabilidades descubiertas para ganar acceso no autorizado, siempre dentro del alcance acordado.
+ *Post-explotación y escalada de privilegios:* Evaluación del daño potencial en caso de que un atacante hubiera comprometido el sistema: movimiento lateral, acceso a datos, persistencia.
+ *Limpieza:* Eliminación de cualquier herramienta, backdoor o artefacto dejado durante las pruebas para restablecer el estado original del sistema.
+ *Reporte:* Documentación formal de vulnerabilidades, evidencia, severidad (CVSS), impacto potencial y recomendaciones de remediación.

// ─────────────────────────────────────────────────────────────
// SUBSECCIÓN: QA y Pruebas de Seguridad
// ─────────────────────────────────────────────────────────────

== QA y Pruebas de Seguridad

El aseguramiento de la calidad (_Quality Assurance_, QA) en el contexto de la seguridad del software tiene como objetivo garantizar que una aplicación no solo funcione correctamente, sino que también sea resistente a ataques y proteja adecuadamente la información de sus usuarios. A diferencia de las pruebas funcionales —que verifican que el sistema hace lo que se espera— las pruebas de seguridad verifican que el sistema no hace lo que *no* se espera cuando recibe entradas maliciosas o inesperadas.

=== Tipos de pruebas de seguridad en QA

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (center, left, left),
    fill: (col, row) => if row == 0 { rgb("1E40AF").lighten(10%) } else if calc.odd(row) { rgb("F0F4FF") } else { white },
    table.header(
      text(fill: white)[*Tipo*],
      text(fill: white)[*Qué analiza*],
      text(fill: white)[*Cuándo se aplica*],
    ),
    [*SAST*\ _(Static Application\ Security Testing)_],
    [Código fuente, bytecode o binarios sin ejecutar la aplicación. Detecta inyecciones SQL, XSS, secretos embebidos, configuraciones inseguras.],
    [Durante el desarrollo; integrado en el pipeline de CI/CD. Detecta problemas temprano (shift-left).],
    [*DAST*\ _(Dynamic Application\ Security Testing)_],
    [La aplicación en ejecución mediante simulación de ataques (fuzzing, escaneo de endpoints, manipulación de parámetros).],
    [En entornos de staging o preproducción. Complementa al SAST detectando vulnerabilidades de runtime.],
    [*IAST*\ _(Interactive Application\ Security Testing)_],
    [Combina agentes instrumentados dentro de la app con pruebas dinámicas; mapea el flujo de datos durante la ejecución.],
    [Durante pruebas funcionales o de integración. Mayor precisión, menor tasa de falsos positivos.],
    [*Fuzzing*],
    [Envío masivo de entradas aleatorias, malformadas o semi-válidas para detectar crashes, desbordamientos de buffer o comportamientos inesperados.],
    [En etapas avanzadas de QA; especialmente útil para protocolos, parsers y APIs.],
    [*Pentesting\ (DAST manual)*],
    [Prueba de penetración completa conducida por un profesional humano, con mayor creatividad y contexto que las herramientas automáticas.],
    [En releases mayores, auditorías periódicas o antes de producción.],
  ),
  caption: [Tipos de pruebas de seguridad integradas en el proceso de QA],
)

=== Integración con el ciclo de desarrollo (SDL / Shift-Left Security)

La práctica de _shift-left_ promueve incorporar las pruebas de seguridad desde las fases más tempranas del ciclo de vida del software, en lugar de tratarlas como una etapa final. El marco de referencia del _Software Development Lifecycle_ (SDL) de Microsoft y el _Secure Software Development Framework_ (SSDF) del NIST formalizan este enfoque, exigiendo que cada fase del desarrollo —desde los requerimientos hasta el despliegue— contemple controles de seguridad específicos.

// ─────────────────────────────────────────────────────────────
// SUBSECCIÓN: Vulnerabilidades por Arquitectura
// ─────────────────────────────────────────────────────────────

== Vulnerabilidades Comunes por Arquitectura de Software

La arquitectura de un sistema define de forma determinante su superficie de ataque: cuántos puntos de entrada existen, qué tan aislados están los componentes entre sí, y cuál es el radio de daño (_blast radius_) en caso de una brecha exitosa. La siguiente tabla clasifica las arquitecturas más comunes de mayor a menor exposición general, considerando la combinación de superficie de ataque, facilidad de explotación y daño potencial.

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    align: (center, left, left, center),
    fill: (col, row) => if row == 0 { rgb("1E3A8A").lighten(10%) } else if calc.odd(row) { rgb("F0F9FF") } else { white },
    table.header(
      text(fill: white)[*Rango*],
      text(fill: white)[*Arquitectura*],
      text(fill: white)[*Vulnerabilidades principales*],
      text(fill: white)[*Blast Radius*],
    ),
    [🔴 1],
    [*Monolítica*],
    [SQL injection con acceso a toda la base de datos; RCE con control total del servidor; SSRF; auth bypass que expone toda la funcionalidad. Una sola brecha compromete el sistema completo.],
    [Crítico],
    [🔴 2],
    [*MVC*\ _(Model-View-\ Controller)_],
    [XSS en la capa View; SQL injection en la capa Model; CSRF en la capa Controller; IDOR (_Insecure Direct Object Reference_); validación de entrada inconsistente entre capas.],
    [Alto],
    [🟠 3],
    [*N-capas*\ _(Layered / N-tier)_],
    [Session hijacking entre capa de presentación y lógica de negocio; inyección de datos entre capas; escalada de privilegios si el aislamiento entre capas no es estricto; deserialización insegura.],
    [Alto],
    [🟠 4],
    [*SOA / API-First*\ _(REST, GraphQL)_],
    [Broken Object Level Authorization (BOLA/IDOR); JWT manipulation; ausencia de rate limiting; mass assignment; exposición excesiva de datos en respuestas; enumeración de endpoints.],
    [Medio-Alto],
    [🟡 5],
    [*Microservicios*],
    [Mayor superficie de ataque total (muchos endpoints); comunicación inter-servicio insegura (mTLS mal configurado); vulnerabilidades en el API gateway; imágenes de contenedor desactualizadas; secretos expuestos en variables de entorno.],
    [Medio\ _(aislado por servicio)_],
    [🟡 6],
    [*Event-Driven*\ _(Pub-Sub, Message Queue)_],
    [Inyección de mensajes maliciosos en colas; replay attacks; deserialización insegura del payload; falta de autenticación entre productor y consumidor. Difícil rastrear el origen del ataque.],
    [Medio],
    [🟢 7],
    [*Serverless / FaaS*],
    [Inyección por eventos de entrada (S3, API Gateway, etc.); dependencias con vulnerabilidades conocidas (supply chain); funciones con permisos excesivos (over-privileged IAM roles); cold start information leakage.],
    [Bajo\ _(por función)_],
  ),
  caption: [Arquitecturas de software ordenadas de mayor a menor exposición a vulnerabilidades de seguridad],
)

Es importante notar que ninguna arquitectura es inherentemente "segura": cada una introduce sus propios vectores de ataque. La arquitectura serverless, aunque tiene el menor radio de daño por unidad funcional, puede tener una cadena de dependencias compleja que amplíe significativamente la superficie de ataque total. Los microservicios, por su parte, reducen el blast radius per servicio, pero multiplican la superficie de ataque global y la complejidad del monitoreo.

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
