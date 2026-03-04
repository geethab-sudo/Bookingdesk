# SDD Submission Checklist (Wekan L&D)

Use this before submitting for Spec-Driven Development audit.

---

## Artifacts (scanner looks for these)

- [ ] **spec.md** or **specs.md** at repo root (or documented path)
  - EARS-style requirements (Event–Action–Result–State) with clear IDs
- [ ] **plan.md** at repo root
  - Tech stack, architecture, traceability to spec
- [ ] **tasks.md** at repo root
  - Numbered tasks (T001, T002, …), dependencies, [P] where parallel
- [ ] **constitution.md** at repo root
  - Principles, constraints, governance, version + dates

---

## Implementation

- [ ] At least one implementation file in a common language (e.g. **.js**, **.ts**, **.py**)
- [ ] Code traceable to spec/plan/tasks (e.g. mentioned in plan §4 or tasks)

---

## Git

- [ ] Submit the **project repo** (e.g. speckit), not a parent repo with no commits
- [ ] All artifacts and code **committed** (nothing only in working tree)
- [ ] Task-based commits preferred (workflow discipline)

---

## Optional

- [ ] README or AUDIT_REMEDIATION.md notes if you use non-standard paths/filenames
- [ ] Re-run any validators (e.g. `node scripts/validate-spec.js spec.md`)

---

**Rubric:** EARS precision (25) · Traceability (25) · Constitutional integrity (25) · Workflow discipline (25) = 100 pts
