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

= Interpretación de resultados y lógica hipotética

== Ejercicio 1: Aplicación Financiera

Las tablas muestran que cada variable tiene una partición válida y dos inválidas. Cuando *Principal* está en $[100, 100000000]$, *Inflación* en $[1, 20]$ y *Interés* en $[0, 25]$, el sistema acepta la entrada porque cumple reglas de negocio mínimas para el cálculo financiero. Cuando un valor cae fuera de su límite inferior o superior, se espera un error específico por campo, lo cual permite rastrear con claridad qué validación falló.

== Ejercicio 2: Función Matemática F(x)

En este caso, la salida esperada no depende de validaciones de formato, sino del intervalo al que pertenece $x$. Cada clase de equivalencia representa una ruta de decisión distinta: valores menores a $-2$ se dirigen al Intervalo 1, valores entre $-2$ y $4$ (incluyendo extremos) al Intervalo 2, y valores mayores a $4$ al Intervalo 3. Por eso, con un valor representativo por clase se justifica el comportamiento esperado para todo el subdominio.

== Ejercicio 3: Validación de Fechas

Los resultados confirman una validación por capas: primero el rango de *año* y *mes*, y después el rango de *día* según el mes y si el año es bisiesto. Así se explican casos como junio 31 (inválido por límite mensual) o 29/02/2001 (inválido por no ser bisiesto). Las filas válidas representan ejemplos de meses de 31 días, 30 días y febrero, cubriendo las particiones principales del calendario.
