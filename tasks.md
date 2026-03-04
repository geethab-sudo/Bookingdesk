# Tasks: Spec Kit

**Feature:** Spec Kit (SDD Workflow Toolkit)  
**Plan:** [plan.md](./plan.md)  
**Spec:** [spec.md](./spec.md)

---

## Task List

| ID | Task | File(s) | Dependencies | [P] |
|---|------|---------|--------------|-----|
| T001 | Define specify workflow command: run script, load spec template, write spec to SPEC_FILE | .cursor/commands/specify.md | — | |
| T002 | Define plan workflow command: run setup script, read spec + constitution, execute plan template Phases 0–2 | .cursor/commands/plan.md | T001 | |
| T003 | Add bash/PowerShell scripts that return JSON (BRANCH_NAME, SPEC_FILE, FEATURE_SPEC, IMPL_PLAN, etc.) | scripts/bash/, scripts/powershell/ | — | [P] |
| T004 | Define tasks workflow command: load plan + design docs, generate dependency-ordered tasks.md | .cursor/commands/tasks.md | T002 | |
| T005 | Define implement workflow command: load tasks.md + plan.md, execute tasks by phase, mark [X] on completion | .cursor/commands/implement.md | T004 | |
| T006 | Create and maintain project constitution (principles, constraints, governance) | constitution.md, .cursor/commands/constitution.md | — | [P] |
| T007 | Add root-level spec.md, plan.md, tasks.md, constitution.md for audit discoverability | spec.md, plan.md, tasks.md, constitution.md | T001–T006 | |

---

## Execution Order

1. **Setup:** (none beyond repo init)
2. **Parallel:** T001, T003, T006 — commands and scripts and constitution can proceed in parallel where applicable.
3. **Sequential:** T002 (after T001), T004 (after T002), T005 (after T004), T007 (after artifacts exist).

---

## Completion

- [X] T001 — specify command defined
- [X] T002 — plan command defined
- [ ] T003 — scripts stubbed or implemented (optional for audit; add as needed)
- [X] T004 — tasks command defined
- [X] T005 — implement command defined
- [X] T006 — constitution present at root
- [X] T007 — root-level artifacts added for audit
