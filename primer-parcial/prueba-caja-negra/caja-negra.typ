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

//#show heading: set text(font: "Fraunces 72pt", weight: "black")
//#show title: set text(font: "Fraunces 72pt", weight: "black")

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

#title("Prueba de caja negra: Técnica de análisis a la frontera para el proyecto en equipo")

= Requerimientos para las operaciones CRUD del sistema

- La cantidad de materia prima (telas) registrada en el sistema debe estar entre 100 y 2000 metros por registro.
- La cantidad de playeras a producir por pedido debe estar entre 50 y 500 unidades.
- La cantidad de playeras por venta debe estar entre 1 y 10 unidades por transacción.
- El precio de una playera debe ser mayor a 0 y menor o igual a 10,000 pesos.
- La cantidad de playeras vendidas no puede ser mayor al stock del almacén (da).

== Análisis de los requerimientos

#table(
  columns: (auto, auto),
  align: center,
  [*Variable*], [*Dominio*],
  [Inventario], [\`[100, 2000]\`],
  [Playeras por pedido], [\`[50, 500]\`],
  [Playeras por venta], [\`[1, 10]\`],
  [Precio de una playera], [\`[0, 10000]\`],
  [Stock de playeras], [\`[0, da]\`],
)

- $"da" -> "Disponibilidad de Almacén"$
- $"ca" -> "Capacidad de Almacén"$
- $"stk" -> "Stock Actual"$
- $"da" -> "ca - stk"$

#pagebreak()

= Casos de prueba

== Inventarios [100,2000]

#table(
  columns: (auto, auto),
  align: center,
  [*Entrada*], [*Resultado esperado*],
  [99], [“El valor mínimo es de 100 metros de tela”],
  [100], [“Registro exitoso”],
  [101], [“Registro exitoso”],
  [1999], [“Registro exitoso”],
  [2000], [“Registro exitoso”],
  [2001], [“El valor máximo es de 2000 metros de tela”],
)

Entrada $->$ TextLabel de cantidad de inventario

== Pedido [50, 500]

#table(
  columns: (auto, auto),
  align: center,
  [*Entrada*], [*Resultado esperado*],
  [49], [“El valor mínimo es de 50 playeras”],
  [50], [“Registro exitoso”],
  [51], [“Registro exitoso”],
  [499], [“Registro exitoso”],
  [500], [“Registro exitoso”],
  [501], [“El valor máximo es de 500 playeras”],
)

Entrada $->$ TextLabel de cantidad de pedido de playeras

== Venta [1, 10]

#table(
  columns: (auto, auto),
  align: center,
  [*Entrada*], [*Resultado esperado*],
  [0], [“El valor mínimo es de 1 playera”],
  [1], [“Registro exitoso”],
  [2], [“Registro exitoso”],
  [9], [“Registro exitoso”],
  [10], [“Registro exitoso”],
  [11], [“El valor máximo es de 10 playeras”],
)

Entrada $->$ TextLabel de Cantidad de playeras para cada venta

== Precio [250, 1500]

#table(
  columns: (auto, auto),
  align: center,
  [*Entrada*], [*Resultado esperado*],
  [0], [“El valor mínimo es de 250 pesos”],
  [249], [“El valor mínimo es de 250 pesos”],
  [250], [“Registro exitoso”],
  [251], [“Registro exitoso”],
  [9999], [“Registro exitoso”],
  [10000], [“Registro exitoso”],
  [10001], [“El valor máximo es de 10000 pesos”],
)

Entrada $->$ TextLabel de Precio de playeras

== Stock [0, da]

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [*ca*], [*stk*], [*venta*], [*Resultado esperado*],
  [10000], [9000], [500], [“Registro exitoso”],
  [10000], [9000], [1000], [“Registro exitoso”],
  [10000], [9000], [1001], [“No hay espacio disponible”],
  [5000], [5000], [1], [“No hay espacio disponible”],
  [5000], [4999], [1], [“Registro exitoso”],
)

= Conclusión
La finalización de este proyecto de pruebas para el sistema `Telas Inventario` permitió al equipo aplicar una estrategia de verificación integral que combinó con éxito las metodologías de _Caja Blanca_ y _Caja Negra_. \
\
Inicialmente, mediante las pruebas de _Caja Blanca_, logramos garantizar la integridad estructural del código. Al identificar los caminos básicos y calcular la complejidad ciclomática, aseguramos que cada flujo lógico del algoritmo de descuentos y validación de stock fuera ejecutado correctamente. Esto nos dio la certeza de que el *"motor"* del programa funciona exactamente como fue programado.\
\
Posteriormente, fortalecimos el sistema mediante pruebas de _Caja Negra_, utilizando la técnica de Análisis de Valores Frontera. Este enfoque fue fundamental, ya que nos permitió evaluar el software desde la perspectiva del usuario final, sin considerar el código interno, sino concentrándonos en las entradas y salidas. Al probar los límites críticos en las funciones CRUD como los rangos mínimos y máximos de inventario y pedidos pudimos verificar que el sistema es capaz de rechazar datos inválidos y procesar correctamente los valores límite.\
\
En conclusión, la unión de ambas metodologías garantiza un software de alta calidad. Esta combinación de técnicas es lo que permite entregar un sistema confiable, escalable y listo para su uso en un entorno de producción real, cumpliendo con los estándares de ingeniería de software exigidos.
