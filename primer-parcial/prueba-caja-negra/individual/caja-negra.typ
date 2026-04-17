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

#align(center, text(font: "Fraunces 72pt", 24pt, weight: "bold")[Caja Negra Individual])

#v(1cm)

= Ejercicio 1: Aplicación Financiera

Se definen las particiones de equivalencia para las variables Principal, Tasa de Interés y Estimación de Inflación.

== Criterio de obtención de resultados

Los resultados esperados se derivan con *partición equivalente*:
- Definir dominio válido por variable.
- Separar clases válidas e inválidas.
- Elegir un valor representativo por clase.
- Asignar el resultado esperado según la regla de validación.

Además, se incluyen casos de *valores límite (BVA)* para validar fronteras:
`min-1`, `min`, `min+1`, `max-1`, `max`, `max+1`.

== Origen de los resultados esperados

- `100 <= principal <= 100_000_000 -> Válido`
- `principal < 100 -> Error: Valor mínimo 100`
- `principal > 100_000_000 -> Error: Valor máximo 100M`
- `1 <= inflacion <= 20 -> Válido`
- `inflacion < 1 -> Error: Valor mínimo 1%`
- `inflacion > 20 -> Error: Valor máximo 20%`
- `0 <= interes <= 25 -> Válido`
- `interes < 0 -> Error: Valor mínimo 0%`
- `interes > 25 -> Error: Valor máximo 25%`

#pagebreak()

== Código hipotético que produce esos resultados

```ts
type Resultado = "Válido" | string

function validarAplicacionFinanciera(
  principal: number,
  inflacion: number,
  interes: number,
): Resultado {
  if (principal < 100) return "Error: Valor mínimo 100"
  if (principal > 100_000_000) return "Error: Valor máximo 100M"

  if (inflacion < 1) return "Error: Valor mínimo 1%"
  if (inflacion > 20) return "Error: Valor máximo 20%"

  if (interes < 0) return "Error: Valor mínimo 0%"
  if (interes > 25) return "Error: Valor máximo 25%"

  return "Válido"
}
```

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

== Valores límite (BVA)

Valores nominales para aislar variable: `principal=1,000,000`, `inflacion=5`, `interes=10`.

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [*Variable*], [*Valor límite*], [*Resultado Esperado*],
  [Principal], [99], [Error: Valor mínimo 100],
  [Principal], [100], [Válido],
  [Principal], [101], [Válido],
  [Principal], [99,999,999], [Válido],
  [Principal], [100,000,000], [Válido],
  [Principal], [100,000,001], [Error: Valor máximo 100M],
  [Inflación], [0.99], [Error: Valor mínimo 1%],
  [Inflación], [1], [Válido],
  [Inflación], [1.01], [Válido],
  [Inflación], [19.99], [Válido],
  [Inflación], [20], [Válido],
  [Inflación], [20.01], [Error: Valor máximo 20%],
  [Interés], [-0.01], [Error: Valor mínimo 0%],
  [Interés], [0], [Válido],
  [Interés], [0.01], [Válido],
  [Interés], [24.99], [Válido],
  [Interés], [25], [Válido],
  [Interés], [25.01], [Error: Valor máximo 25%],
)

== Origen de los resultados esperados

- `x < -2 -> Procesar en Intervalo 1`
- `-2 <= x <= 4 -> Procesar en Intervalo 2`
- `x > 4 -> Procesar en Intervalo 3`

== Código hipotético que produce esos resultados

```ts
function clasificarIntervaloFx(x: number): string {
  if (x < -2) return "Procesar en Intervalo 1"
  if (x <= 4) return "Procesar en Intervalo 2"
  return "Procesar en Intervalo 3"
}
```

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

== Valores límite (BVA)

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [*Frontera*], [*Valor (x)*], [*Resultado Esperado*],
  [-2], [-2.01], [Procesar en Intervalo 1],
  [-2], [-2], [Procesar en Intervalo 2],
  [-2], [-1.99], [Procesar en Intervalo 2],
  [4], [3.99], [Procesar en Intervalo 2],
  [4], [4], [Procesar en Intervalo 2],
  [4], [4.01], [Procesar en Intervalo 3],
)

== Origen de los resultados esperados

Reglas aplicadas:
- `1900 <= anio <= 2199`
- `1 <= mes <= 12`
- `dia >= 1`
- `dia <= maxDia(mes, anio)`
- En febrero: `maxDia = 29` si el año es bisiesto, en otro caso `28`.

== Código hipotético que produce esos resultados

```ts
function esBisiesto(anio: number): boolean {
  return anio % 400 === 0 || (anio % 4 === 0 && anio % 100 !== 0)
}

function validarFecha(dia: number, mes: number, anio: number): string {
  if (anio < 1900) return "Error: Año fuera de rango (min 1900)"
  if (anio > 2199) return "Error: Año fuera de rango (max 2199)"
  if (mes < 1 || mes > 12) return "Error: Mes fuera de rango"
  if (dia < 1) return "Error: Día fuera de rango"

  const diasPorMes = [31, esBisiesto(anio) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  const maxDia = diasPorMes[mes - 1]

  if (dia > maxDia) {
    if (mes === 2 && dia === 29) return `Error: ${anio} no es bisiesto`
    if (mes === 6 && dia === 31) return "Error: Junio máximo 30 días"
    return "Error: Día fuera de rango"
  }

  if (mes === 2) return "Fecha Válida (Febrero)"
  if (maxDia === 31) return "Fecha Válida (31 días)"
  return "Fecha Válida (30 días)"
}
```

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

== Valores límite (BVA)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  [*Campo*], [*Entrada (día, mes, año)*], [*Resultado Esperado*], [*Límite*],
  [Mes], [(1, 0, 2000)], [Error: Mes fuera de rango], [min-1],
  [Mes], [(1, 1, 2000)], [Fecha Válida (31 días)], [min],
  [Mes], [(1, 12, 2000)], [Fecha Válida (31 días)], [max],
  [Mes], [(1, 13, 2000)], [Error: Mes fuera de rango], [max+1],
  [Día (mes 31)], [(0, 1, 2000)], [Error: Día fuera de rango], [min-1],
  [Día (mes 31)], [(1, 1, 2000)], [Fecha Válida (31 días)], [min],
  [Día (junio)], [(30, 6, 2000)], [Fecha Válida (30 días)], [max],
  [Día (junio)], [(31, 6, 2000)], [Error: Junio máximo 30 días], [max+1],
  [Día (febrero bisiesto)], [(29, 2, 2000)], [Fecha Válida (Febrero)], [max],
  [Día (febrero no bisiesto)], [(29, 2, 2001)], [Error: 2001 no es bisiesto], [max+1 lógico],
  [Año], [(1, 1, 1899)], [Error: Año fuera de rango (min 1900)], [min-1],
  [Año], [(1, 1, 1900)], [Fecha Válida (31 días)], [min],
  [Año], [(1, 1, 2199)], [Fecha Válida (31 días)], [max],
  [Año], [(1, 1, 2200)], [Error: Año fuera de rango (max 2199)], [max+1],
)

= Matriz de trazabilidad (Regla `->` Caso `->` Resultado)

#table(
  columns: (auto, 1.5fr, 1fr, 1fr),
  align: center,
  [*Ejercicio*], [*Regla*], [*Caso representativo*], [*Resultado Esperado*],
  [E1], [Principal < 100], [principal=50], [Error: Valor mínimo 100],
  [E1], [Principal > 100M], [principal=150,000,000], [Error: Valor máximo 100M],
  [E1], [Inflación < 1], [inflación=0.5], [Error: Valor mínimo 1%],
  [E1], [Inflación > 20], [inflación=25], [Error: Valor máximo 20%],
  [E1], [Interés < 0], [interés=-5], [Error: Valor mínimo 0%],
  [E1], [Interés > 25], [interés=30], [Error: Valor máximo 25%],
  [E2], [x < -2], [x=-10], [Procesar en Intervalo 1],
  [E2], [-2 <= x <= 4], [x=0], [Procesar en Intervalo 2],
  [E2], [x > 4], [x=10], [Procesar en Intervalo 3],
  [E3], [Mes fuera de rango], [(1, 13, 2000)], [Error: Mes fuera de rango],
  [E3], [Día excede máximo mensual], [(31, 6, 2000)], [Error: Junio máximo 30 días],
  [E3], [29/feb en no bisiesto], [(29, 2, 2001)], [Error: 2001 no es bisiesto],
  [E3], [Año fuera de rango], [(1, 1, 2300)], [Error: Año fuera de rango (max 2199)],
)
