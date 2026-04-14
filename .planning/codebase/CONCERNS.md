# CONCERNS.md — Technical Debt & Concerns

## 1. Template Duplication (⚠️ Medium)

**Issue:** `portada-template.typ` is copy-pasted into all 3 document directories instead of being shared via a single source.

**Locations:**
- `primer-parcial/primer-examen/portada-template.typ`
- `primer-parcial/prueba-caja-negra/equipo/portada-template.typ`
- `primer-parcial/prueba-caja-negra/individual/portada-template.typ`

**Risk:** Any fix or enhancement to the cover page template must be applied in 3 places. Typst does support relative imports, but cross-directory imports require careful path management. A shared `shared/portada-template.typ` with relative `../../../shared/` imports would centralize this.

---

## 2. Package Version Inconsistency (⚠️ Low-Medium)

**Issue:** The white-box exam uses two different versions of `@preview/codly`:
- Actual document body (lines 1-325): `@preview/codly:1.3.0`
- "Easter egg" code section at the bottom (lines 328+): `@preview/codly:1.2.0`

**Risk:** Minor API differences may exist between 1.2.0 and 1.3.0. The displayed code in the easter egg section may not accurately reflect how to reproduce the document's actual behavior.

---

## 3. `.DS_Store` Files Committed (⚠️ Low)

**Issue:** `.DS_Store` is present in the root and inside `primer-parcial/`. While `.gitignore` correctly lists `.DS_Store`, it may have been committed before the ignore was set up, or the gitignore pattern applies only to future files.

**Locations:**
- `./.DS_Store`
- `./primer-parcial/.DS_Store`

**Fix:** `git rm --cached .DS_Store primer-parcial/.DS_Store`

---

## 4. No Automated Compilation (⚠️ Low-Medium)

**Issue:** There is no build script, Makefile, or CI workflow that compiles `.typ` → `.pdf`. PDFs are manually compiled and committed.

**Risk:**
- Committed PDFs may become stale/out-of-sync with `.typ` sources after edits
- No way to verify PDF freshness without manual inspection

**Suggestion:** Add a `Makefile` or GitHub Actions workflow with `typst compile` to auto-build PDFs on push.

---

## 5. Empty `segundo-parcial/` Directory (ℹ️ Info)

**Issue:** `segundo-parcial/` exists but contains nothing. It was presumably created in anticipation of second-partial content.

**Risk:** None currently — but may cause confusion if treated as having content. Git does not track empty directories, so this directory was likely created (and is only visible because it's tracked via some mechanism or only exists locally).

---

## 6. Font Dependency (⚠️ Low)

**Issue:** Documents require specific non-standard fonts installed locally:
- `ITC Avant Garde Gothic` (commercial font)
- `JetBrainsMono NFM` (free, but must be installed)
- `Fraunces 72pt` (free, but must be installed)

**Risk:** Compilation will fail on a machine without these fonts. No font embedding instructions or fallback alternatives are documented.

---

## 7. Hardcoded Student Information (ℹ️ Info)

All documents contain hardcoded personal data (student names, boleta numbers, professor name). This is expected for academic submissions but means:
- Documents are not reusable templates without editing
- New document creation requires finding and replacing all hardcoded fields

---

## 8. PDF Embedding via `read(..., encoding: none)` (ℹ️ Info)

**Pattern used:**
```typ
#let instructions = read("media/Examen-practico_IP.pdf", encoding: none)
#image(instructions, width: auto, height: auto)
```

This is a creative workaround to embed a PDF page as an image in Typst. It works but is an undocumented/unofficial technique. Typst may render only the first page and the output quality depends on the PDF content type. No concern currently, but worth noting as a fragile pattern.

---

## 9. No Spell Check or Grammar Check Tooling (ℹ️ Info)

Documents are in Spanish. There is no configured spell checker, linter, or grammar checker for the Typst source files. Errors must be caught by manual proofreading.

---

## 10. Missing Second Partial Content (📋 Planned Work)

`segundo-parcial/` is empty — second partial deliverables have not been created yet. This is the primary area of upcoming work for this repository.
