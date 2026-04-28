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
  "Pruebas de Usabilidad",
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

= Pruebas de Usabilidad

== ¿Qué son y cómo funcionan?

Las *pruebas de usabilidad* son una técnica de ingeniería de software enfocada en evaluar un producto mediante pruebas con usuarios representativos. Su objetivo principal es observar cómo interactúan las personas reales con el sistema para identificar áreas de confusión, medir el nivel de satisfacción y validar que la interfaz permita cumplir con los objetivos operativos de forma eficiente y sin fricciones.

En términos de funcionamiento, estas pruebas se alejan de la validación interna del código (como las pruebas unitarias) y se centran exclusivamente en la experiencia del usuario (UX) y en la Interfaz de Usuario (UI). El proceso generalmente abarca:
- *Planificación y objetivos:* Se define qué flujos críticos serán evaluados.
- *Diseño de escenarios:* Se elaboran tareas realistas y controladas (ej., "Generar una venta y emitir el ticket").
- *Reclutamiento de participantes:* Se seleccionan perfiles adecuados al dominio del negocio.
- *Ejecución de la prueba:* Observación (con o sin moderador) de los usuarios intentando completar las tareas.
- *Análisis y métricas:* Recopilación de métricas como el tiempo de finalización, tasa de error y comentarios cualitativos, para proponer mejoras en la interfaz.

#pagebreak()

= Auditoría Final de Pruebas de Software: Sistema de Gestión de Telas

Documento técnico que presenta una auditoría completa de pruebas funcionales, de seguridad y de calidad aplicadas al sistema desarrollado en C\#.

#v(1em)

== Pruebas de Penetración

#table(
  columns: 4,
  [*Caso*], [*Entrada*], [*Resultado esperado*], [*Riesgo*],
  [SQL Injection], [' OR 1=1 --], [Acceso denegado], [Crítico],
  [Fuerza bruta], [20 intentos login], [Bloqueo de usuario], [Alto],
  [Manipulación precios], [Modificar precio], [Rechazo], [Alto],
  [Acceso BD], [Intento externo], [Acceso restringido], [Crítico],
)

Se evaluaron vulnerabilidades relacionadas con autenticación, validación de datos y control de acceso.

#v(1em)

== Pruebas del Proceso de Ticket

=== Flujo del proceso

#table(
  columns: 3,
  [*Paso*], [*Acción*], [*Resultado esperado*],
  [1], [Seleccionar producto], [Carga correcta],
  [2], [Ingresar cantidad], [Validación correcta],
  [3], [Confirmar venta], [Registro en BD],
  [4], [Generar ticket], [Ticket completo],
)

=== Métricas

#table(
  columns: 2,
  [*Métrica*], [*Valor esperado*],
  [Tiempo], [< 30 segundos],
  [Errores], [< 5%],
  [Claridad], [Alta],
)

#v(1em)

== Pruebas Alfa

#table(
  columns: 3,
  [*Caso*], [*Entrada*], [*Resultado esperado*],
  [Registro sin precio], [NULL], [Error controlado],
  [Falla BD], [Desconexión], [Mensaje sin crash],
  [Cantidad negativa], [-5], [Rechazo],
)

#v(1em)

== Pruebas Beta

#table(
  columns: 2,
  [*Actividad*], [*Resultado esperado*],
  [Registro productos], [Correcto],
  [Ventas], [Sin errores],
  [Tickets], [Comprensibles],
)

#v(1em)

== Pruebas de Aceptación

#table(
  columns: 3,
  [*Entrada*], [*Proceso*], [*Resultado*],
  [Tela algodón, 3 unidades], [Venta + ticket], [Correcto],
)

#v(1em)

== Evaluación de Vulnerabilidades (Tipo CVSS)

#table(
  columns: 4,
  [*Vulnerabilidad*], [*Impacto*], [*Probabilidad*], [*Nivel*],
  [SQL Injection], [Alto], [Alta], [Crítico],
  [Fuerza bruta], [Medio], [Alta], [Alto],
  [Manipulación de datos], [Alto], [Media], [Alto],
)

#v(1em)

== KPIs de Calidad

#table(
  columns: 2,
  [*Indicador*], [*Valor objetivo*],
  [Tasa de éxito], [95%],
  [Tiempo de respuesta], [< 2s],
  [Errores], [< 5%],
)

#v(1em)

== Conclusión

El sistema cumple con los requisitos funcionales y presenta un nivel adecuado de calidad. Sin embargo, se identifican vulnerabilidades críticas que deben ser mitigadas para garantizar la seguridad del sistema.

== Organizador Gráfico: Proceso de Evaluación de Usabilidad

A continuación, se presenta un organizador gráfico estructurado sobre el ciclo de vida de las pruebas de usabilidad y sus métricas, aplicado directamente al Sistema de Gestión de Telas:

#figure(
  align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *

      let root = (0, 0)

      let map-node(pos, text-content, fill-color, stroke-color) = {
        content(pos, box(fill: fill-color, stroke: stroke-color, radius: 5pt, inset: 6pt, text-content))
      }

      // Main branches
      line(root, (-2.8, 1.8), stroke: (paint: gray, thickness: 1.2pt))
      line(root, (-2.8, -1.8), stroke: (paint: gray, thickness: 1.2pt))
      line(root, (2.8, 1.8), stroke: (paint: gray, thickness: 1.2pt))
      line(root, (2.8, -1.8), stroke: (paint: gray, thickness: 1.2pt))

      // Sub branches - Top Left
      line((-2.8, 1.8), (-5.2, 2.8), stroke: gray)
      line((-2.8, 1.8), (-5.2, 1.8), stroke: gray)
      line((-2.8, 1.8), (-5.2, 0.8), stroke: gray)

      // Sub branches - Bottom Left
      line((-2.8, -1.8), (-5.2, -0.6), stroke: gray)
      line((-2.8, -1.8), (-5.2, -1.4), stroke: gray)
      line((-2.8, -1.8), (-5.2, -2.2), stroke: gray)
      line((-2.8, -1.8), (-5.2, -3.0), stroke: gray)

      // Sub branches - Top Right
      line((2.8, 1.8), (5.2, 2.8), stroke: gray)
      line((2.8, 1.8), (5.2, 1.8), stroke: gray)
      line((2.8, 1.8), (5.2, 0.8), stroke: gray)

      // Sub branches - Bottom Right
      line((2.8, -1.8), (5.2, -0.8), stroke: gray)
      line((2.8, -1.8), (5.2, -1.8), stroke: gray)
      line((2.8, -1.8), (5.2, -2.8), stroke: gray)

      // Nodes
      map-node(root, text(weight: "bold", size: 10pt, [Pruebas de\ Usabilidad]), rgb("#e0f2fe"), rgb("#0284c7"))

      map-node((-2.8, 1.8), text(weight: "bold", size: 9pt, [Fases]), rgb("#dcfce7"), rgb("#16a34a"))
      map-node((-2.8, -1.8), text(weight: "bold", size: 9pt, [Métricas]), rgb("#fef08a"), rgb("#ca8a04"))
      map-node((2.8, 1.8), text(weight: "bold", size: 9pt, [Módulos C\#]), rgb("#fae8ff"), rgb("#c026d3"))
      map-node((2.8, -1.8), text(weight: "bold", size: 9pt, [Prevención]), rgb("#fee2e2"), rgb("#dc2626"))

      // Leaves Left
      content((-5.2, 2.8), anchor: "east", text(size: 8.5pt)[1. Preparación])
      content((-5.2, 1.8), anchor: "east", text(size: 8.5pt)[2. Ejecución])
      content((-5.2, 0.8), anchor: "east", text(size: 8.5pt)[3. Análisis])

      content((-5.2, -0.6), anchor: "east", text(size: 8.5pt)[Eficiencia])
      content((-5.2, -1.4), anchor: "east", text(size: 8.5pt)[Eficacia])
      content((-5.2, -2.2), anchor: "east", text(size: 8.5pt)[Satisfacción])
      content((-5.2, -3.0), anchor: "east", text(size: 8.5pt)[Aprendizaje])

      // Leaves Right
      content((5.2, 2.8), anchor: "west", text(size: 8.5pt)[Ventas y Ticket])
      content((5.2, 1.8), anchor: "west", text(size: 8.5pt)[Registro de Telas])
      content((5.2, 0.8), anchor: "west", text(size: 8.5pt)[Inventario])

      content((5.2, -0.8), anchor: "west", text(size: 8.5pt)[Cierres Inesperados])
      content((5.2, -1.8), anchor: "west", text(size: 8.5pt)[Textos en Precios])
      content((5.2, -2.8), anchor: "west", text(size: 8.5pt)[Fallas de Conexión])
    })
  ],
  caption: [Mapa Mental: Pruebas de Usabilidad en el Sistema de Gestión de Telas.],
)
