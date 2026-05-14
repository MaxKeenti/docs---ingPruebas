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
  "Gonzalez Calzada Maximiliano",
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

