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
  "Caso de Prueba",
  "6NM61 2026-2",
  "2021601769",
  integrantes,
  "González Arroyo Lilia",
  "Mayo de 2026",
)

#pagebreak()
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)

= Caso de Estudio 1: Comercio Electrónico

== Planeación de Pruebas
- *Objetivo:* Asegurar que la función de cálculo de impuestos sea correcta, eficiente y segura, considerando país y tipo de producto.
- *Tipo de Prueba:* Pruebas de Caja Blanca (Estructurales).
- *Estrategia:* Cobertura de Sentencias, Cobertura de Ramas y Cobertura de Flujo de Datos.
- *Justificación:* Al tener acceso al código fuente, la prueba estructural garantiza que todas las sentencias y flujos lógicos (verdadero/falso) se evalúen. Además, validar el ciclo de vida de las variables asegura la prevención de vulnerabilidades internas mencionadas.

== Diseño de Pruebas
- *Caso de Prueba 1.1:* Producto gravable en UE.
  - *Entrada:* País = "España" (UE), Producto = "Electrónico" (gravable).
  - *Salida Esperada:* Impuesto aplicado correctamente según la tasa de la UE.
- *Caso de Prueba 1.2:* Producto exento.
  - *Entrada:* País = "USA", Producto = "Libro" (exento).
  - *Salida Esperada:* Impuesto = 0.
- *Caso de Prueba 1.3:* Flujo alterno o validación de variables.
  - *Entrada:* País = "México", Producto = "Software" (gravable, diferente zona).
  - *Salida Esperada:* Inicialización de la variable de porcentaje, modificación e impuesto aplicado.

== Implementación de Pruebas
- Configuración del entorno de pruebas unitarias (e.g., JUnit, PyTest) con acceso al código fuente.
- Creación de _scripts_ de prueba para los distintos países, productos y combinaciones lógicas.
- Ejecución con herramientas de análisis de cobertura de código.

== Evaluación de Criterios de Salida
- Se alcanza un 100% de cobertura de sentencias y decisiones en la función de cálculo.
- Los impuestos calculados coinciden exactamente con las reglas de negocio estipuladas para cada región.
- La ejecución de herramientas de análisis no arroja variables sin inicializar ni flujos lógicos corruptos.

== Cierre del Proceso
- Documentación de los errores encontrados, incluyendo líneas de código y el caso de prueba detonante.
- Entrega de un reporte de cobertura y liberación de la versión probada de la función.


= Caso de Estudio 2: Control de Inventarios

== Planeación de Pruebas
- *Objetivo:* Asegurar que el registro de movimientos a base de datos sea correcto procesando los archivos proporcionados.
- *Tipo de Prueba:* Pruebas de Caja Negra (basadas en especificaciones) complementadas con Caja Blanca (para vulnerabilidades).
- *Estrategia:* Tabla de Decisiones y Partición de Equivalencia.
- *Justificación:* Las reglas de negocio definen múltiples condiciones explícitas (e.g., existencia en el catálogo, valores de conversión vacíos, tipo de posición). Evaluar las combinaciones lógicas mediante una tabla de decisiones y partición de datos garantiza la validación de todas las restricciones del negocio.

== Diseño de Pruebas
Basado en los datos de entrada analizados (CSV):
- *Caso de Prueba 2.1:* Registro exitoso de Tarima (Tipo 1).
  - *Entradas:* Llave `AA-PISO-0000001-LF2501230t1` (Fila 3 de Detalle de Localizaciones).
  - *Condición:* Existe en "Detalle de unidades" (Fila 16). Conversión de Almacén AA es `01`, Conversión de Recurso es `1234`.
  - *Salida Esperada:* Tipo de posición = 1. Cantidad = 0, UM = "". Registro exitoso.
- *Caso de Prueba 2.2:* Registro de Caja Suelta (Tipo 4).
  - *Entradas:* Llave `AA-PISO-0000004-LF2501233t3` (Fila 12 de Detalle de Localizaciones).
  - *Condición:* No existe correspondencia en "Detalle de unidades".
  - *Salida Esperada:* Tipo de posición = 4. Cantidad = 10, UM = "CJ". Registro exitoso.
- *Caso de Prueba 2.3:* Error por falta de conversión de catálogo.
  - *Entradas:* Llave `AN-A14-0000005-LF2501234t2` (Fila 11).
  - *Condición:* El almacén "AN" no existe en la "Lista de almacenes" (no tiene `Campo1`). O probar con el Recurso `0000007` que no tiene conversión en el "Catálogo de Recursos".
  - *Salida Esperada:* El registro no se procesa (resultado = error) debido a que la conversión es igual a espacios/inexistente.

== Implementación de Pruebas
- Preparación y validación del archivo CSV de prueba asegurando la ingesta de "Detalle de Localizaciones", "Detalle de Unidades", "Lista de almacenes" y "Catálogo de Recursos".
- Implementación de _scripts_ de prueba automatizados que emulen la inserción y verifiquen el tipo de posición asignada.
- Ejecución de pruebas enfocadas en el cruce de llaves (ALM-LOCALIZACION-RECURSO-LOTE).

== Evaluación de Criterios de Salida
- El 100% de los registros del CSV de prueba se procesan o rechazan estrictamente según las reglas.
- Las variables `CANTIDAD` y `UM` se evalúan correctamente dependiendo si es tarima o caja suelta.
- No se detectan registros aceptados de almacenes o recursos sin factor de conversión.

== Cierre del Proceso
- Reporte detallado de la trazabilidad entre las reglas de negocio y los casos de prueba (exitosos y fallidos).
- Documentación de posibles anomalías o corrupción en la ruta de guardado a la base de datos (verificación de vulnerabilidades).
