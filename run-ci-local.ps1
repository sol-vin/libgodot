# =============================================================================
# Runs the LibGodot Local GitHub Actions Runner Harness
# =============================================================================
param(
    [switch]$TestRelease,
    [switch]$SkipSpecs,
    [switch]$SkipToolTests,
    [switch]$SkipRuntimeTests,
    [switch]$SkipSmokeTests
)

$ErrorActionPreference = "Stop"
$Script = Join-Path $PSScriptRoot "scripts/run_ci_local.ps1"
$forwardArgs = [System.Collections.Generic.List[string]]::new()
foreach ($k in $PSBoundParameters.Keys) {
    if ($PSBoundParameters[$k] -is [bool] -or $PSBoundParameters[$k] -is [System.Management.Automation.SwitchParameter]) {
        if ($PSBoundParameters[$k]) { $forwardArgs.Add("-$k") }
    } else {
        $forwardArgs.Add("-$k")
        $forwardArgs.Add($PSBoundParameters[$k].ToString())
    }
}
& powershell -ExecutionPolicy Bypass -File $Script $forwardArgs
exit $LASTEXITCODE
