---
quick_task: 260415-tdv-append-explanation-and-hypothetical-code
plan: 01
type: execute
autonomous: true
files_modified:
  - primer-parcial/prueba-caja-negra/individual/caja-negra.typ
---

<objective>
Append a clear explanation section and hypothetical code examples that justify the black-box test results already shown in the document.

Purpose: Make the result tables academically interpretable and traceable to expected validation logic.
Output: Updated `caja-negra.typ` with explanatory prose + hypothetical code snippets.
</objective>

<context>
@.planning/STATE.md
@primer-parcial/prueba-caja-negra/individual/caja-negra.typ
</context>

<tasks>

<task type="auto">
  <name>Task 1: Add explanatory narrative for black-box results</name>
  <files>primer-parcial/prueba-caja-negra/individual/caja-negra.typ</files>
  <action>
Append a new section at the end of the document (after Ejercicio 3) titled “Interpretación de resultados y lógica hipotética”.
For each exercise (1, 2, 3), add concise explanation paragraphs that connect valid/invalid partitions to expected outcomes shown in the tables.
  </action>
  <verify>
    <automated>grep -n "Interpretación de resultados y lógica hipotética" primer-parcial/prueba-caja-negra/individual/caja-negra.typ</automated>
  </verify>
  <done>Document includes a dedicated interpretation section with one explanation block per exercise.</done>
</task>

<task type="auto">
  <name>Task 2: Add hypothetical code snippets aligned with each exercise</name>
  <files>primer-parcial/prueba-caja-negra/individual/caja-negra.typ</files>
  <action>
Inside the new section, add hypothetical TypeScript snippets (using existing codly setup) for:
1) Financial input validation (principal, inflation, interest ranges),
2) Piecewise routing for F(x) intervals,
3) Date validation (month/day/year + leap-year case).
Code must be explanatory (not production-ready) and directly map to expected results from each table.
  </action>
  <verify>
    <automated>grep -n "```ts\\|#raw\\|#code" primer-parcial/prueba-caja-negra/individual/caja-negra.typ || true</automated>
  </verify>
  <done>Each exercise has a matching hypothetical code block that explains why the expected result is valid/error.</done>
</task>

<task type="auto">
  <name>Task 3: Compile check for Typst integrity</name>
  <files>primer-parcial/prueba-caja-negra/individual/caja-negra.typ</files>
  <action>
Run a Typst compile to ensure the appended narrative and code blocks do not break document syntax or rendering.
  </action>
  <verify>
    <automated>typst compile primer-parcial/prueba-caja-negra/individual/caja-negra.typ</automated>
  </verify>
  <done>The document compiles without errors after the new explanation and hypothetical code are appended.</done>
</task>

</tasks>

<success_criteria>
- New explanatory section exists and is coherent with all three exercises.
- Hypothetical code is present for all exercises and maps to table outcomes.
- Typst compilation succeeds.
</success_criteria>
