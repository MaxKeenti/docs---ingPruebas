#import "@preview/cetz:0.4.2"
#import "portada-template.typ": portada

#show raw: set text(
  font: "JetBrainsMono NFM",
  weight: "medium",
  size: 1em,
)

// Importamos la librería codly para numeración automática de líneas
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

#show heading: set text(font: "Fraunces 72pt", weight: "black")

#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)

#let integrantes = (
  "Gonzalez Calzada Maximiliano"
)

#portada(
  "UNIDAD DE APRENDIZAJE",
  "EXAMEN",
  "SECUENCIA Y PERIODO",
  "BOLETA",
  "ALUMNO",
  "PROFESORA",
  "FECHA",
  "Ingeniería de Pruebas",
  "Caja Negra",
  "6NM61 2026-2",
  "2021601769",
  integrantes,
  "González Arroyo Lilia",
  "31 de Marzo de 2026",
)

#pagebreak()
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)

// Recover original page settings for the rest of the document
#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)

#align(center, text(24pt, weight: "bold")[Caja Negra Individual])

#v(1cm)

= Ejercicio 1: Aplicación Financiera

Se definen las particiones de equivalencia para las variables Principal, Tasa de Interés y Estimación de Inflación.

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  [*Variable*], [*Partición*], [*Valor de Prueba*], [*Resultado Esperado*],
  [Principal], [Válida: [100, 100M]], [1,000,000], [Válido],
  [Principal], [Inválida: < 100], [50], [Error: Valor mínimo 100],
  [Principal], [Inválida: > 100M], [150,000,000], [Error: Valor máximo 100M],
  [Inflación], [Válida: [1, 20]], [5], [Válido],
  [Inflación], [Inválida: < 1], [0.5], [Error: Valor mínimo 1%],
  [Inflación], [Inválida: > 20], [25], [Error: Valor máximo 20%],
  [Interés], [Válida: [0, 25]], [10], [Válido],
  [Interés], [Inválida: < 0], [-5], [Error: Valor mínimo 0%],
  [Interés], [Inválida: > 25], [30], [Error: Valor máximo 25%],
)

= Ejercicio 2: Función Matemática F(x)

Se definen las particiones basadas en los subdominios de la función real.

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [*Clase de Equivalencia*], [*Valor de Prueba (x)*], [*Resultado Esperado*],
  [Clase 1: $(-infinity, -2)$], [-10], [Procesar en Intervalo 1],
  [Clase 2: $[-2, 4]$], [0], [Procesar en Intervalo 2],
  [Clase 3: $(4, +infinity)$], [10], [Procesar en Intervalo 3],
)

= Ejercicio 3: Validación de Fechas

Se analizan las particiones para los campos de Día, Mes y Año, considerando años bisiestos y meses de diferente duración.

#table(
  columns: (auto, auto, auto, 1fr),
  align: center,
  [*Mes*], [*Día*], [*Año*], [*Resultado Esperado*],
  [1], [15], [2000], [Fecha Válida (31 días)],
  [4], [15], [2000], [Fecha Válida (30 días)],
  [2], [15], [2000], [Fecha Válida (Febrero)],
  [0], [1], [2000], [Error: Mes fuera de rango],
  [13], [1], [2000], [Error: Mes fuera de rango],
  [6], [0], [2000], [Error: Día fuera de rango],
  [6], [31], [2000], [Error: Junio máximo 30 días],
  [2], [29], [2001], [Error: 2001 no es bisiesto],
  [1], [1], [1800], [Error: Año fuera de rango (min 1900)],
  [1], [1], [2300], [Error: Año fuera de rango (max 2199)],
)

