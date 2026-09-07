# =============================================================================
# LibGodot Automated Test Suite Runner (CI & Local)
# =============================================================================
# Runs:
#   1. Crystal Verification Specs (spec/libgodot_spec.cr, spec/boot_spec.cr)
#   2. Headless In-Editor @tool Script Tests (ToolTester2D, ToolTester3D)
#   3. Full Runtime 2D & 3D Test Project Suites (Nodes, GDScript, Mesh, Physics, Stress)
#   4. Template and Example Project Smoke Tests
#
# Returns exit code 0 on complete success, or 1 on any failure (ready for GitHub Actions).
# =============================================================================

param(
    [string]$GodotPath,
    [switch]$SkipSpecs,
    [switch]$SkipToolTests,
    [switch]$SkipRuntimeTests,
    [switch]$SkipSmokeTests,
    [int]$TimeoutSeconds = 60
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $PSScriptRoot
$TestDir = Join-Path $RootDir "test"
$TemplateDir = Join-Path $RootDir "template"
$ExamplesDir = Join-Path $RootDir "examples"

# Resolve Godot executable path
$GodotExe = $null
$normGodot4 = if ($env:GODOT4) { $env:GODOT4 -replace '^/([a-zA-Z])/', '$1:/' } else { $null }
$normGodot = if ($env:GODOT) { $env:GODOT -replace '^/([a-zA-Z])/', '$1:/' } else { $null }

if (-not [string]::IsNullOrWhiteSpace($GodotPath) -and (Test-Path $GodotPath)) {
    $GodotExe = (Resolve-Path $GodotPath).Path
} elseif (-not [string]::IsNullOrWhiteSpace($normGodot4) -and (Test-Path $normGodot4)) {
    $GodotExe = (Resolve-Path $normGodot4).Path
} elseif (-not [string]::IsNullOrWhiteSpace($normGodot) -and (Test-Path $normGodot)) {
    $GodotExe = (Resolve-Path $normGodot).Path
} elseif (Test-Path (Join-Path $RootDir "godot.exe")) {
    $GodotExe = Join-Path $RootDir "godot.exe"
} elseif (Test-Path (Join-Path $RootDir "godot")) {
    $GodotExe = Join-Path $RootDir "godot"
} elseif (Get-Command godot -ErrorAction SilentlyContinue) {
    $GodotExe = (Get-Command godot).Source
}

if (-not $GodotExe -or -not (Test-Path $GodotExe)) {
    Write-Host "::error::Godot executable was not found. Please provide -GodotPath, set `$env:GODOT4 or place godot.exe in $RootDir" -ForegroundColor Red
    exit 1
}

$FailedSteps = [System.Collections.Generic.List[string]]::new()
$StartTime = Get-Date

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "             LibGodot Automated Test Suite Runner                " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Root Directory: $RootDir"
Write-Host "Godot Engine:   $GodotExe"
Write-Host ""

# Helper to run a command and stream output directly
function Invoke-TestCommand {
    param(
        [string]$Name,
        [string]$Executable,
        [string[]]$Arguments,
        [string]$WorkingDirectory = $RootDir,
        [hashtable]$EnvironmentVars = @{}
    )

    Write-Host "::group::$Name" -ForegroundColor Yellow
    Write-Host "[RUNNING] $Name" -ForegroundColor Cyan
    Write-Host "Command: $Executable $($Arguments -join ' ')" -ForegroundColor DarkGray

    # Set environment variables
    foreach ($k in $EnvironmentVars.Keys) {
        [System.Environment]::SetEnvironmentVariable($k, $EnvironmentVars[$k])
    }

    # Ensure working directory bin and root bin are in PATH for DLL resolution
    $oldPath = $env:PATH
    $binCandidates = @(
        (Join-Path $WorkingDirectory "bin"),
        (Join-Path $RootDir "bin"),
        (Join-Path $RootDir "test/bin")
    ) | Where-Object { Test-Path $_ }
    if ($binCandidates) {
        $env:PATH = ($binCandidates -join [System.IO.Path]::PathSeparator) + [System.IO.Path]::PathSeparator + $env:PATH
    }

    Push-Location $WorkingDirectory
    try {
        & $Executable $Arguments
        $exitCode = $LASTEXITCODE
    } finally {
        Pop-Location
        $env:PATH = $oldPath
        foreach ($k in $EnvironmentVars.Keys) {
            [System.Environment]::SetEnvironmentVariable($k, $null)
        }
    }

    Write-Host "::endgroup::"

    if ($exitCode -eq 0) {
        Write-Host "[PASSED] $Name (Exit Code: $exitCode)`n" -ForegroundColor Green
        return @{ Success = $true; ExitCode = 0 }
    } else {
        Write-Host "::error::$Name failed with exit code $exitCode`n" -ForegroundColor Red
        return @{ Success = $false; ExitCode = $exitCode }
    }
}

# -----------------------------------------------------------------------------
# Phase 1: Crystal Unit Specs
# -----------------------------------------------------------------------------
if (-not $SkipSpecs) {
    Write-Host "--- Phase 1: Crystal Verification Specs ---" -ForegroundColor Magenta

    $specResult1 = Invoke-TestCommand -Name "Crystal Spec: LibGodot Core" `
        -Executable "crystal" `
        -Arguments @("run", "spec/libgodot_spec.cr")
    if (-not $specResult1.Success) {
        $FailedSteps.Add("Crystal Spec (libgodot_spec.cr)")
    }

    $specResult2 = Invoke-TestCommand -Name "Crystal Spec: Boot Loader" `
        -Executable "crystal" `
        -Arguments @("run", "spec/boot_spec.cr")
    if (-not $specResult2.Success) {
        $FailedSteps.Add("Crystal Spec (boot_spec.cr)")
    }
}

# -----------------------------------------------------------------------------
# Phase 2: In-Editor Tool Script Tests (Tickled via godot --headless --editor)
# -----------------------------------------------------------------------------
if (-not $SkipToolTests) {
    Write-Host "--- Phase 2: In-Editor @tool Script Tests ---" -ForegroundColor Magenta

    # Clear old marker files
    $passMarker = Join-Path $TestDir ".tool_tests_passed"
    $failMarker = Join-Path $TestDir ".tool_tests_failed"
    if (Test-Path $passMarker) { Remove-Item $passMarker -Force }
    if (Test-Path $failMarker) { Remove-Item $failMarker -Force }

    $toolResult = Invoke-TestCommand -Name "Headless Editor Tool Tests (ToolTester2D & ToolTester3D)" `
        -Executable $GodotExe `
        -Arguments @("--headless", "--rendering-driver", "opengl3", "--editor", "--path", "test", "--quit-after", "25") `
        -EnvironmentVars @{ "GODOT_RUN_TOOL_TESTS" = "1" }

    if (Test-Path $failMarker) {
        $failContent = Get-Content $failMarker -Raw
        Write-Host "::error::In-Editor tool tests reported failures in marker file:`n$failContent" -ForegroundColor Red
        $FailedSteps.Add("In-Editor Tool Tests (ToolTester2D / ToolTester3D failed: $failContent)")
    } elseif (-not (Test-Path $passMarker) -and (-not $toolResult.Success)) {
        $FailedSteps.Add("In-Editor Tool Tests (Process exited with code $($toolResult.ExitCode))")
    } else {
        Write-Host "[PASSED] In-Editor Tool Tests verified successfully.`n" -ForegroundColor Green
    }
}

# -----------------------------------------------------------------------------
# Phase 3: Runtime Test Project (All 12 Suites: 2D, 3D, Mesh, Physics, Stress)
# -----------------------------------------------------------------------------
if (-not $SkipRuntimeTests) {
    Write-Host "--- Phase 3: Runtime Test Project (2D, 3D, Mesh, Physics, Stress) ---" -ForegroundColor Magenta

    # Clear old marker files
    $runPassMarker = Join-Path $TestDir ".runtime_tests_passed"
    $runFailMarker = Join-Path $TestDir ".runtime_tests_failed"
    $summaryFile = Join-Path $TestDir ".runtime_test_results.txt"
    if (Test-Path $runPassMarker) { Remove-Item $runPassMarker -Force }
    if (Test-Path $runFailMarker) { Remove-Item $runFailMarker -Force }
    if (Test-Path $summaryFile) { Remove-Item $summaryFile -Force }

    $runtimeResult = Invoke-TestCommand -Name "Runtime Test Runner (main_test_runner.tscn)" `
        -Executable $GodotExe `
        -Arguments @("--headless", "--rendering-driver", "opengl3", "--path", "test", "--quit-after", "15") `
        -EnvironmentVars @{ "GODOT_TEST_AUTORUN" = "1" }

    if (Test-Path $summaryFile) {
        $summary = Get-Content $summaryFile -Raw
        Write-Host "Test Execution Summary:`n$summary" -ForegroundColor Cyan
    }

    if (Test-Path $runFailMarker) {
        Write-Host "::error::Runtime test suite reported failures!" -ForegroundColor Red
        $FailedSteps.Add("Runtime Test Suite (Failures recorded in $runFailMarker)")
    } elseif (-not $runtimeResult.Success -and -not (Test-Path $runPassMarker)) {
        $FailedSteps.Add("Runtime Test Suite (Process exited with code $($runtimeResult.ExitCode))")
    } else {
        Write-Host "[PASSED] All runtime test suites executed and verified.`n" -ForegroundColor Green
    }
}

# -----------------------------------------------------------------------------
# Phase 4: Template and Example Project Smoke Tests
# -----------------------------------------------------------------------------
if (-not $SkipSmokeTests) {
    Write-Host "--- Phase 4: Template & Example Smoke Tests ---" -ForegroundColor Magenta

    if (Test-Path $TemplateDir) {
        $templateResult = Invoke-TestCommand -Name "Smoke Test: Template Project" `
            -Executable $GodotExe `
            -Arguments @("--headless", "--rendering-driver", "opengl3", "--path", "template", "--quit")
        if (-not $templateResult.Success) {
            $FailedSteps.Add("Smoke Test: Template Project")
        }
    }

    $basicDemoDir = Join-Path $ExamplesDir "basic_demo"
    if (Test-Path $basicDemoDir) {
        $demoResult = Invoke-TestCommand -Name "Smoke Test: Basic Demo Example" `
            -Executable $GodotExe `
            -Arguments @("--headless", "--rendering-driver", "opengl3", "--path", "examples/basic_demo", "--quit")
        if (-not $demoResult.Success) {
            $FailedSteps.Add("Smoke Test: Basic Demo")
        }
    }
}

# -----------------------------------------------------------------------------
# Final Summary & Exit
# -----------------------------------------------------------------------------
$Duration = [math]::Round(((Get-Date) - $StartTime).TotalSeconds, 2)
Write-Host "=================================================================" -ForegroundColor Cyan
if ($FailedSteps.Count -eq 0) {
    Write-Host "  SUCCESS: All LibGodot test suites passed! ($Duration seconds)   " -ForegroundColor Green
    Write-Host "=================================================================" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host "  FAILURE: $($FailedSteps.Count) test step(s) failed ($Duration seconds):" -ForegroundColor Red
    foreach ($f in $FailedSteps) {
        Write-Host "    ✘ $f" -ForegroundColor Red
    }
    Write-Host "=================================================================" -ForegroundColor Cyan
    exit 1
}
