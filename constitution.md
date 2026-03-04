# Spec Kit Project Constitution

**Project name:** Spec Kit  
**Version:** 1.0.0  
**Ratification date:** 2025-03-04  
**Last amended:** 2025-03-04

---

## 1. Purpose

This constitution defines the non-negotiable architectural principles and constraints for the Spec Kit SDD workflow toolkit. All specifications, plans, tasks, and implementation MUST align with these principles.

---

## 2. Principles

### 2.1 Spec-First (EARS)

- Specifications MUST be written in a structured format; EARS (Event–Action–Result–State) patterns are used where applicable.
- Requirements MUST be identifiable (e.g. by ID) and traceable from spec → plan → tasks → code.
- The system SHALL support creating and updating a spec from a feature description via a defined workflow (e.g. specify command).

**Rationale:** Ensures requirements are precise and auditable; supports rubric criteria for EARS precision and traceability.

### 2.2 Plan and Tasks as First-Class Artifacts

- An implementation plan MUST exist (plan.md) and MUST reference the feature spec and constitution.
- Tasks MUST be enumerated in tasks.md with dependencies and, where applicable, parallel markers.
- Tasks MUST be executable by an agent or developer without requiring out-of-band context; file paths and scope MUST be explicit.

**Rationale:** Enables workflow discipline and task-based development; supports audit criteria for workflow discipline and traceability.

### 2.3 Constitutional Integrity

- Architectural principles and constraints MUST be documented in a single constitution (constitution.md).
- The constitution MUST be versioned and dated; amendments MUST follow a stated procedure (e.g. version bump, propagation to templates).
- Workflows (plan, tasks, implement) MUST reference the constitution where architectural decisions are required.

**Rationale:** Ensures consistency and compliance with platform best practices; supports rubric criterion for constitutional integrity.

### 2.4 No Forbidden Dependencies (Project-Specific)

- This project does not use Redux or direct third-party API calls; N/A for this toolkit.
- Scripts and commands MUST use only agreed runtimes (Bash, PowerShell) and standard tooling; no ungoverned external services.

**Rationale:** Keeps the toolkit portable and auditable; avoids hidden coupling.

### 2.5 Async and Scripting

- Scripts invoked by commands MUST return machine-readable output (e.g. JSON) for paths and branch names.
- Workflow steps MUST be ordered and MUST respect dependencies; parallel execution is allowed only where explicitly marked.

**Rationale:** Enables automation and repeatability; prevents race conditions in artifact generation.

---

## 3. Governance

- **Amendments:** Change constitution via the constitution command or direct edit; update version (semantic versioning) and LAST_AMENDED_DATE; propagate to templates if needed.
- **Compliance:** Plan and tasks generation MUST consider the constitution; implement workflow MUST not violate stated principles.
- **Review:** Before release or submission, verify that spec.md, plan.md, tasks.md, and constitution.md are present at discoverable locations and that implementation is traceable to the spec.

---

## 4. Traceability

- Every requirement in spec.md SHOULD map to at least one task and to implementation (file or command).
- plan.md MUST reference spec.md and constitution.md.
- tasks.md MUST reference plan.md and, where applicable, spec.md.
