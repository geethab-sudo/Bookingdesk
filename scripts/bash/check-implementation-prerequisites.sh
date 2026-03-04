#!/usr/bin/env bash
# Spec Kit — check implementation prerequisites.
# Outputs JSON with FEATURE_DIR and AVAILABLE_DOCS for the implement command.
# Traceability: implement.md step 1 → this script.

set -e

# Repo root: directory containing .cursor/ or script's parent's parent
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# If we have git, use git root; otherwise use directory above scripts/
GIT_ROOT=""
if command -v git >/dev/null 2>&1; then
  GIT_ROOT="$(git -C "$REPO_ROOT" rev-parse --show-toplevel 2>/dev/null)" || true
fi
if [[ -n "$GIT_ROOT" ]]; then
  FEATURE_DIR="$GIT_ROOT"
else
  FEATURE_DIR="$REPO_ROOT"
fi

# Build list of available docs (absolute paths); only include existing paths
AVAILABLE_DOCS=()
for name in plan.md tasks.md spec.md specs.md data-model.md research.md quickstart.md constitution.md; do
  p="$FEATURE_DIR/$name"
  if [[ -f "$p" ]]; then
    AVAILABLE_DOCS+=("$p")
  fi
done
if [[ -d "$FEATURE_DIR/contracts" ]]; then
  AVAILABLE_DOCS+=("$FEATURE_DIR/contracts")
fi

# Output JSON when --json is passed
if [[ "${1:-}" == "--json" ]]; then
  echo -n '{"FEATURE_DIR":"'"$FEATURE_DIR"'","AVAILABLE_DOCS":['
  first=1
  for doc in "${AVAILABLE_DOCS[@]}"; do
    if [[ $first -eq 1 ]]; then first=0; else echo -n ','; fi
    echo -n '"'"$doc"'"'
  done
  echo ']}'
  exit 0
fi

# Non-JSON: just report status
echo "FEATURE_DIR=$FEATURE_DIR"
echo "AVAILABLE_DOCS: ${AVAILABLE_DOCS[*]}"
exit 0
