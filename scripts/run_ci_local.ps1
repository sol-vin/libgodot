<#
.SYNOPSIS
    Local GitHub Actions Runner Harness for LibGodot Crystal.

.DESCRIPTION
    Replicates the exact execution environment and sequence of the GitHub Actions
    CI test suite (test.yml) and gated release pipeline (release.yml) on the local Windows system.

.PARAMETER TestRelease
    Also runs and validates the gated release build and packaging steps (examples.zip, core zip, checksums).

.PARAMETER SkipSpecs
    Skips Phase 1 Crystal verification specs.

.PARAMETER SkipToolTests
    Skips Phase 2 In-Editor tool tests.

.PARAMETER SkipRuntimeTests
    Skips Phase 3 Runtime test suites.

.PARAMETER SkipSmokeTests
    Skips Phase 4 Project smoke tests.

.EXAMPLE
    .\scripts\run_ci_local.ps1
    .\scripts\run_ci_local.ps1 -TestRelease
#>
param(
    [switch]$TestRelease,
    [switch]$SkipSpecs,
    [switch]$SkipToolTests,
    [switch]$SkipRuntimeTests,
    [switch]$SkipSmokeTests
)

$ErrorActionPreference = "Stop"
$RootDir = Split-Path -Parent $PSScriptRoot
$StartTime = Get-Date

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "         LibGodot Local GitHub Actions Runner Harness            " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Workspace Root: $RootDir"
Write-Host "Start Time:     $($StartTime.ToString('u'))"
Write-Host ""

# 1. Set GitHub Actions Runner Environment Variables
$env:CI = "true"
$env:GITHUB_ACTIONS = "true"
$env:GITHUB_WORKSPACE = $RootDir
if (-not $env:GITHUB_REF_NAME) { $env:GITHUB_REF_NAME = "local-runner-test" }

$StepResults = [System.Collections.Generic.List[PSCustomObject]]::new()

function Record-Step {
    param(
        [string]$Name,
        [bool]$Success,
        [double]$DurationSeconds,
        [string]$Details = ""
    )
    $StepResults.Add([PSCustomObject]@{
        Step = $Name
        Status = if ($Success) { "PASSED" } else { "FAILED" }
        Duration = "$DurationSeconds s"
        Details = $Details
    })
}

# -----------------------------------------------------------------------------
# Step 1: Environment & Toolchain Verification
# -----------------------------------------------------------------------------
Write-Host "::group::Step 1: Toolchain & Environment Verification" -ForegroundColor Yellow
$t0 = Get-Date

$crystalCmd = Get-Command crystal -ErrorAction SilentlyContinue
$gxxCmd = Get-Command g++ -ErrorAction SilentlyContinue
$makeCmd = Get-Command make -ErrorAction SilentlyContinue
$godotPath = Join-Path $RootDir "godot.exe"
if (-not (Test-Path $godotPath) -and $env:GODOT4 -and (Test-Path $env:GODOT4)) {
    $godotPath = $env:GODOT4
}

$toolsOk = $true
if ($crystalCmd) {
    $cVer = & crystal -v | Select-Object -First 1
    Write-Host "  [OK] Crystal: $cVer" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] Crystal compiler not found in PATH!" -ForegroundColor Red
    $toolsOk = $false
}

if ($gxxCmd) {
    $gVer = & g++ --version | Select-Object -First 1
    Write-Host "  [OK] C++ (g++): $gVer" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] g++ compiler not found in PATH!" -ForegroundColor Red
    $toolsOk = $false
}

if ($makeCmd) {
    Write-Host "  [OK] Make: $($makeCmd.Source)" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] make not found in PATH!" -ForegroundColor Red
    $toolsOk = $false
}

if (Test-Path $godotPath) {
    Write-Host "  [OK] Godot: $godotPath" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] Godot executable not found at $godotPath!" -ForegroundColor Red
    $toolsOk = $false
}

$t1 = [math]::Round(((Get-Date) - $t0).TotalSeconds, 2)
Write-Host "::endgroup::"
Record-Step -Name "Toolchain & Environment Verification" -Success $toolsOk -DurationSeconds $t1

if (-not $toolsOk) {
    Write-Host "::error::Prerequisite toolchains missing. Aborting runner execution." -ForegroundColor Red
    exit 1
}

# -----------------------------------------------------------------------------
# Step 2: CI Test Suite Workflow Execution (make all)
# -----------------------------------------------------------------------------
Write-Host "`n::group::Step 2: CI Test Suite Execution (make all)" -ForegroundColor Yellow
$t0 = Get-Date

$testExitCode = 0
try {
    Push-Location $RootDir
    # Run tests using the automated runner script
    $testParams = @{}
    if ($SkipSpecs) { $testParams["SkipSpecs"] = $true }
    if ($SkipToolTests) { $testParams["SkipToolTests"] = $true }
    if ($SkipRuntimeTests) { $testParams["SkipRuntimeTests"] = $true }
    if ($SkipSmokeTests) { $testParams["SkipSmokeTests"] = $true }

    # Execute make all per AGENTS.md
    & make all
    $testExitCode = $LASTEXITCODE
} catch {
    $testExitCode = 1
    Write-Host "::error::Execution exception in make all: $_" -ForegroundColor Red
} finally {
    Pop-Location
}

$t1 = [math]::Round(((Get-Date) - $t0).TotalSeconds, 2)
Write-Host "::endgroup::"
$testsPassed = ($testExitCode -eq 0)
Record-Step -Name "CI Test Suite (make all)" -Success $testsPassed -DurationSeconds $t1

if (-not $testsPassed) {
    Write-Host "::error::CI Test Suite failed (Exit code: $testExitCode)." -ForegroundColor Red
    if ($TestRelease) {
        Write-Host "::error::GATING TRIGGERED: Release pipeline will NOT run because tests failed!" -ForegroundColor Red
        Record-Step -Name "Release Pipeline (GATED)" -Success $false -DurationSeconds 0 -Details "Gated by failed test suite"
    }
    exit 1
}

# -----------------------------------------------------------------------------
# Step 3: Gated Release Pipeline Simulation (if requested)
# -----------------------------------------------------------------------------
if ($TestRelease) {
    Write-Host "`n::group::Step 3: Gated Release Pipeline Execution" -ForegroundColor Yellow
    Write-Host "Gate Check: Test suite passed successfully. Release pipeline unlocked!" -ForegroundColor Green
    $t0 = Get-Date
    $releaseOk = $true

    Push-Location $RootDir
    try {
        # 1. Compile in Release Mode
        Write-Host "[Release] Compiling release binaries (make all RELEASE=1)..." -ForegroundColor Cyan
        & make all RELEASE=1
        if ($LASTEXITCODE -ne 0) { throw "make all RELEASE=1 failed with code $LASTEXITCODE" }

        Write-Host "[Release] Compiling examples standalone executables (make examples_exe RELEASE=1)..." -ForegroundColor Cyan
        & make examples_exe RELEASE=1
        if ($LASTEXITCODE -ne 0) { throw "make examples_exe RELEASE=1 failed with code $LASTEXITCODE" }

        # 2. Package examples.zip (strictly only .exe files)
        Write-Host "[Release] Packaging examples.zip (compiled executables only)..." -ForegroundColor Cyan
        $examplesDist = Join-Path $RootDir "dist/examples_dist"
        if (Test-Path $examplesDist) { Remove-Item $examplesDist -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $examplesDist | Out-Null

        if (Test-Path "examples") {
            foreach ($ex in Get-ChildItem -Path "examples" -Directory) {
                $exeCandidates = @(
                    (Join-Path $ex.FullName "bin/game.exe"),
                    (Join-Path $ex.FullName "bin/$($ex.Name).exe")
                )
                foreach ($cand in $exeCandidates) {
                    if (Test-Path $cand) {
                        $dest = Join-Path $examplesDist "$($ex.Name).exe"
                        Copy-Item $cand $dest -Force
                        Write-Host "  -> Packaged executable: $($ex.Name).exe"
                        break
                    }
                }
            }
        }

        # Enforce that only .exe files exist in examples package
        Get-ChildItem -Path $examplesDist -File | Where-Object { $_.Extension -ne ".exe" } | Remove-Item -Force
        $examplesZip = Join-Path $RootDir "examples.zip"
        if (Test-Path $examplesZip) { Remove-Item $examplesZip -Force }
        Compress-Archive -Path "$examplesDist/*" -DestinationPath $examplesZip -Force
        Write-Host "  [OK] Created examples.zip ($( [math]::Round((Get-Item $examplesZip).Length / 1MB, 2) ) MB)" -ForegroundColor Green

        # Verify archive contains only .exe files
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zipObj = [System.IO.Compression.ZipFile]::OpenRead($examplesZip)
        $nonExes = $zipObj.Entries | Where-Object { -not $_.Name.EndsWith(".exe") }
        $entryCount = $zipObj.Entries.Count
        $zipObj.Dispose()

        if ($nonExes.Count -gt 0) {
            throw "examples.zip contains non-exe files!"
        }
        Write-Host "  [OK] Verified examples.zip contains exactly $entryCount compiled executable(s) and NO extra files." -ForegroundColor Green

        # 3. Package Core LibGodot Distribution
        Write-Host "[Release] Packaging core LibGodot distribution zip..." -ForegroundColor Cyan
        $libDist = Join-Path $RootDir "dist/libgodot_dist"
        if (Test-Path $libDist) { Remove-Item $libDist -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $libDist | Out-Null

        Copy-Item -Path "src" -Destination (Join-Path $libDist "src") -Recurse -Force
        Copy-Item -Path "addons" -Destination (Join-Path $libDist "addons") -Recurse -Force
        Copy-Item -Path "template" -Destination (Join-Path $libDist "template") -Recurse -Force

        $binTarget = Join-Path $libDist "bin"
        New-Item -ItemType Directory -Force -Path $binTarget | Out-Null
        if (Test-Path "bin/crystal_bridge.dll") {
            Copy-Item "bin/crystal_bridge.dll" "$binTarget/crystal_bridge.dll" -Force
        }
        foreach ($dll in @('gc.dll', 'iconv-2.dll', 'pcre2-8.dll', 'libgodot.dll')) {
            if (Test-Path "bin/$dll") { Copy-Item "bin/$dll" "$binTarget/$dll" -Force }
        }

        Copy-Item "shard.yml" "$libDist/shard.yml" -Force
        Copy-Item "README.md" "$libDist/README.md" -Force
        if (Test-Path "LICENSE") { Copy-Item "LICENSE" "$libDist/LICENSE" -Force }

        $tag = $env:GITHUB_REF_NAME
        $coreZip = Join-Path $RootDir "libgodot-crystal-windows-x86_64-$tag.zip"
        if (Test-Path $coreZip) { Remove-Item $coreZip -Force }
        Compress-Archive -Path "$libDist/*" -DestinationPath $coreZip -Force
        Write-Host "  [OK] Created core archive: $coreZip ($( [math]::Round((Get-Item $coreZip).Length / 1MB, 2) ) MB)" -ForegroundColor Green

        # 4. Generate Checksums
        Write-Host "[Release] Generating SHA256 checksums..." -ForegroundColor Cyan
        $checksumFile = Join-Path $RootDir "checksums.txt"
        Get-FileHash -Algorithm SHA256 $examplesZip, $coreZip | Format-Table -AutoSize | Out-String | Set-Content $checksumFile
        Get-Content $checksumFile | Write-Host

    } catch {
        $releaseOk = $false
        Write-Host "::error::Release simulation error: $_" -ForegroundColor Red
    } finally {
        Pop-Location
    }

    $t1 = [math]::Round(((Get-Date) - $t0).TotalSeconds, 2)
    Write-Host "::endgroup::"
    Record-Step -Name "Gated Release Pipeline" -Success $releaseOk -DurationSeconds $t1
}

# -----------------------------------------------------------------------------
# Runner Execution Summary
# -----------------------------------------------------------------------------
$TotalDuration = [math]::Round(((Get-Date) - $StartTime).TotalSeconds, 2)
Write-Host "`n=================================================================" -ForegroundColor Cyan
Write-Host "                 Local Runner Execution Summary                  " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
$StepResults | Format-Table -AutoSize | Out-String | Write-Host

$allPassed = $true
foreach ($s in $StepResults) {
    if ($s.Status -ne "PASSED") { $allPassed = $false }
}

if ($allPassed) {
    Write-Host "  SUCCESS: All local GitHub Actions runner jobs PASSED! ($TotalDuration seconds)" -ForegroundColor Green
    Write-Host "=================================================================" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host "  FAILURE: One or more local GitHub Actions runner jobs FAILED! ($TotalDuration seconds)" -ForegroundColor Red
    Write-Host "=================================================================" -ForegroundColor Cyan
    exit 1
}
