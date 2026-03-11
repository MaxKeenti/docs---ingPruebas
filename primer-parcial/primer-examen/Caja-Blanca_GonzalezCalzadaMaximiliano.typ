#import "portada-template.typ": portada

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
  "Caja Blanca",
  "6NM61 2026-2",
  "2021601769",
  integrantes,
  "González Arroyo Lilia",
  "10 de Marzo de 2026",
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

#pagebreak()
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)

// Auto page size
#set page(
  width: auto,
  height: auto,
  margin: 1cm,
)

= Instrucciones

#let instructions = read("media/Examen-practico_IP.pdf", encoding: none)
#image(instructions, width: auto, height: auto)

// Recover original page settings for the rest of the document
#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)

= Primer código

== Código a analizar (sintaxis traducida a TypeScript)

```ts
if(edad >= 18){
  if(tieneMembresia == true){
    console.log("Acceso total");
  } else if (codigoPromo == "VIP"){
      console.log("Acceso invitado VIP");
    } else {
      console.log("Acceso denegado: requiere membresía");
    }
} else {
    console.log("Acceso denegado: menor de edad");
}
```

== Grafo de flujo

= Segundo código

== Código a analizar (sintaxis traducida a TypeScript)

```ts
if(edad >= 18 && tieneMembresia == true){
  console.log("Acceso total");
} else if (edad >= 18 && codigoPromo == "VIP"){
    console.log("Acceso invitado VIP");
} else if (edad >= 18){
    console.log("Acceso denegado: requiere membresía");
} else {
    console.log("Acceso denegado: menor de edad");
}
```

== Grafo de flujo

= Conclusión

= Código usado para construir este documento
```typ
#import "portada-template.typ": portada

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
  "Caja Blanca",
  "6NM61 2026-2",
  "2021601769",
  integrantes,
  "González Arroyo Lilia",
  "10 de Marzo de 2026",
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

#pagebreak()
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)

// Auto page size
#set page(
  width: auto,
  height: auto,
  margin: 1cm,
)

= Instrucciones

#let instructions = read("media/Examen-practico_IP.pdf", encoding: none)
#image(instructions, width: auto, height: auto)

// Recover original page settings for the rest of the document
#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)

= Primer código

== Código a analizar (sintaxis traducida a TypeScript)
```
```ts
if(edad >= 18){
  if(tieneMembresia == true){
    console.log("Acceso total");
  } else if (codigoPromo == "VIP"){
      console.log("Acceso invitado VIP");
    } else {
      console.log("Acceso denegado: requiere membresía");
    }
} else {
    console.log("Acceso denegado: menor de edad");
}
```
```typ

== Grafo de flujo

= Segundo código

== Código a analizar (sintaxis traducida a TypeScript)
```
```ts
if(edad >= 18 && tieneMembresia == true){
  console.log("Acceso total");
} else if (edad >= 18 && codigoPromo == "VIP"){
    console.log("Acceso invitado VIP");
} else if (edad >= 18){
    console.log("Acceso denegado: requiere membresía");
} else {
    console.log("Acceso denegado: menor de edad");
}
```
```typ
== Grafo de flujo

= Conclusión
```
