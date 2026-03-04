# SDD Submission — Artifact Index for Auditors

This repository is the **submitted project** for the Spec-Driven Development (SDD) audit. All required artifacts are present. Use this file to locate them.

---

## Required artifacts (exact paths)

| Rubric criterion | Artifact | Path(s) |
|------------------|----------|---------|
| **EARS precision** | Specification (EARS, WHEN/action/result/state) | `spec.md`, `specs.md`, `.specify/specs.md` |
| **Traceability** | Implementation plan (spec → plan → tasks → code) | `plan.md` |
| **Traceability** | Task list (numbered, dependencies, [P] markers) | `tasks.md` |
| **Constitutional integrity** | Architectural rules and constraints | `constitution.md` |
| **Workflow discipline** | Task-based commits | `git log` on branch `main` |
| **Implementation** | Code traceable to spec | `scripts/` (e.g. `scripts/validate-spec.js`, `scripts/bash/`, `scripts/powershell/`) |

---

## File locations (repository root)

- **spec.md** — Canonical EARS specification (Event–Action–Result–State tables, EARS-01–EARS-09).
- **specs.md** — Alias for discoverability; same content as spec.md.
- **.specify/specs.md** — EARS-compliant Memory Bank (same content) for tools that expect this path.
- **plan.md** — Tech stack, architecture, traceability table (§4), file structure.
- **tasks.md** — Tasks T001–T007 with dependencies and completion markers [X].
- **constitution.md** — Principles, governance, version 1.0.0, dated.

---

## Implementation (traceability)

- **scripts/validate-spec.js** — Validates spec structure; traceable to EARS-01, EARS-02 and tasks (T007).
- **scripts/bash/check-implementation-prerequisites.sh** — Used by implement workflow; outputs FEATURE_DIR and AVAILABLE_DOCS.
- **scripts/powershell/check-implementation-prerequisites.ps1** — Same for Windows.

---

## Git and workflow discipline

- **Branch:** `main`
- **Commits:** Task-based; see `git log` (e.g. initial SDD flow, root-level artifacts, prerequisite scripts).
- **Tasks defined:** 7 (T001–T007) in `tasks.md`.

---

## Quick verification

```bash
# From repository root
test -f spec.md && test -f plan.md && test -f tasks.md && test -f constitution.md && echo "Root artifacts OK"
test -f .specify/specs.md && echo ".specify/specs.md OK"
git log --oneline
```
