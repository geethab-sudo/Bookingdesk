# Implementation Plan: Spec Kit

**Feature spec:** [spec.md](./spec.md)  
**Constitution:** [constitution.md](./constitution.md)

---

## 1. Tech Stack & Libraries

| Area | Choice | Rationale |
|------|--------|-----------|
| Runtime | Bash (sh), PowerShell (ps) | Scripts referenced by commands; cross-platform support |
| Agent UX | Cursor commands (.cursor/commands/*.md) | Invocable workflows with description and scripts |
| Artifacts | Markdown | spec.md, plan.md, tasks.md, constitution.md for human and tool consumption |
| Version control | Git | Branch-per-feature; task-based commits for traceability |

No application framework (e.g. React/Redux) or direct third-party API calls; this is a workflow/tooling project.

---

## 2. Architecture

- **Commands:** `.cursor/commands/` — one file per phase (specify, plan, tasks, implement, constitution). Each declares scripts (sh/ps) and step-by-step instructions.
- **Scripts:** `scripts/bash/`, `scripts/powershell/` — create branches, resolve paths, return JSON for FEATURE_SPEC, IMPL_PLAN, SPEC_FILE, etc.
- **Templates:** `templates/` — spec-template.md, plan-template.md, tasks-template.md; optional `/memory/constitution.md` template.
- **Feature artifacts:** Per-feature directory or branch — spec, plan artifacts (research.md, data-model.md, contracts/, quickstart.md), tasks.md. Root-level copies (spec.md, plan.md, tasks.md, constitution.md) satisfy audit discoverability.

---

## 3. File Structure (Current / Target)

```
speckit/
├── spec.md              # Root-level spec (audit discoverability)
├── plan.md              # This file
├── tasks.md             # Root-level task list
├── constitution.md      # Project constitution
├── .cursor/commands/
│   ├── specify.md
│   ├── plan.md
│   ├── tasks.md
│   ├── implement.md
│   └── constitution.md
├── scripts/
│   ├── bash/            # create-new-feature.sh, setup-plan.sh, etc.
│   └── powershell/
├── templates/           # spec-template.md, plan-template.md, tasks-template.md
└── (optional) docs/
```

---

## 4. Traceability

| Spec requirement | Plan section | Tasks | Implementation |
|------------------|--------------|-------|----------------|
| EARS-01, EARS-02 | §2 Commands, §3 File structure | T001 (specify command) | .cursor/commands/specify.md |
| EARS-03, EARS-04 | §2 Scripts, Templates | T002 (plan command), T003 (scripts) | .cursor/commands/plan.md, scripts/ |
| EARS-05, EARS-06 | §2 Commands | T004 (tasks command) | .cursor/commands/tasks.md |
| EARS-07, EARS-08 | §2 Commands | T005 (implement command) | .cursor/commands/implement.md |
| EARS-09 | §2 Constitution | T006 (constitution) | .cursor/commands/constitution.md, constitution.md |

---

## 5. Progress Tracking

| Phase | Artifact | Status |
|-------|----------|--------|
| 0 | research / context | Done (this plan) |
| 1 | data-model, contracts, quickstart | N/A (tooling only; no app data model) |
| 2 | tasks.md | Done (root tasks.md) |
| 3 | Implementation | In progress (commands + scripts) |
