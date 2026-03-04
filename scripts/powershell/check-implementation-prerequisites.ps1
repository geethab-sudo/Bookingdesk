# Spec Kit — check implementation prerequisites (PowerShell).
# Outputs JSON with FEATURE_DIR and AVAILABLE_DOCS for the implement command.
# Usage: .\check-implementation-prerequisites.ps1 -Json

param([switch]$Json)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Resolve-Path (Join-Path $scriptDir "..\..")
$featureDir = $repoRoot

# Prefer git root if available
if (Get-Command git -ErrorAction SilentlyContinue) {
  try {
    $gitRoot = (git -C $repoRoot rev-parse --show-toplevel 2>$null)
    if ($gitRoot) { $featureDir = $gitRoot }
  } catch {}
}

$docNames = @("plan.md", "tasks.md", "spec.md", "specs.md", "data-model.md", "research.md", "quickstart.md", "constitution.md")
$availableDocs = @()
foreach ($name in $docNames) {
  $p = Join-Path $featureDir $name
  if (Test-Path -LiteralPath $p -PathType Leaf) { $availableDocs += $p }
}
if (Test-Path (Join-Path $featureDir "contracts") -PathType Container) {
  $availableDocs += (Join-Path $featureDir "contracts")
}

if ($Json) {
  $docJson = ($availableDocs | ForEach-Object { "`"$_`"" }) -join ","
  Write-Output "{`"FEATURE_DIR`":`"$featureDir`",`"AVAILABLE_DOCS`":[$docJson]}"
} else {
  Write-Output "FEATURE_DIR=$featureDir"
  Write-Output "AVAILABLE_DOCS: $($availableDocs -join ' ')"
}
