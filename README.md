# Spec Kit — SDD Workflow Toolkit

Spec-Driven Development (SDD) workflow toolkit: specification → plan → tasks → implementation.

---

## SDD Audit Artifacts (Wekan L&D)

**Submit this repository only** (not a parent folder). Required artifacts are at **repository root**:

| Artifact | File | Purpose |
|----------|------|---------|
| Specification | [spec.md](./spec.md), [specs.md](./specs.md) | EARS requirements (Event–Action–Result–State), user stories, requirement IDs |
| Implementation plan | [plan.md](./plan.md) | Tech stack, architecture, traceability table (spec → plan → tasks → code) |
| Task list | [tasks.md](./tasks.md) | Numbered tasks (T001–T007), dependencies, parallel [P] markers |
| Constitution | [constitution.md](./constitution.md) | Principles, constraints, governance, version and dates |

**Implementation (traceability):**

- [scripts/validate-spec.js](./scripts/validate-spec.js) — validates spec structure; traceable to spec (EARS-01, EARS-02) and tasks (T007).

**Workflow discipline:**

- Git history: task-based commits on `main` (see `git log`).
- Commands: [.cursor/commands/](.cursor/commands/) — specify, plan, tasks, implement, constitution.

---

## Submission checklist (SDD audit)

| Criterion | Evidence |
|-----------|----------|
| **EARS precision** | [spec.md](./spec.md) — EARS tables (EARS-01–EARS-09), WHEN/action/result/state; [specs.md](./specs.md) alias |
| **Traceability** | [plan.md](./plan.md) §4 — spec → plan → tasks → implementation; requirement IDs in spec and plan |
| **Constitutional integrity** | [constitution.md](./constitution.md) — principles, governance, version 1.0.0, dated |
| **Workflow discipline** | [tasks.md](./tasks.md) — T001–T007, dependencies, [P] markers; `git log` for task-based commits |
| **Implementation** | [scripts/validate-spec.js](./scripts/validate-spec.js) — traceable to EARS-01, EARS-02, T007 |
