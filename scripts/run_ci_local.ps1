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

        # 2. Package examples-windows-x86_64.zip (complete playable Godot game)
        Write-Host "[Release] Packaging examples-windows-x86_64.zip (playable Godot game)..." -ForegroundColor Cyan
        $examplesDist = Join-Path $RootDir "dist/examples_dist"
        if (Test-Path $examplesDist) { Remove-Item $examplesDist -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $examplesDist | Out-Null

        if (Test-Path "examples") {
            foreach ($ex in Get-ChildItem -Path "examples" -Directory) {
                Write-Host "  -> Packaging playable example for $($ex.Name)..."
                & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $RootDir "scripts/package_game.ps1") -ProjectPath $ex.FullName -Name $ex.Name -TargetDir $examplesDist -Release 1
            }
        }

        # Clean up any runtime shadow copies before archiving
        Get-ChildItem -Path $examplesDist -Filter "*_loaded_*" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

        $examplesZip = Join-Path $RootDir "examples-windows-x86_64.zip"
        if (Test-Path $examplesZip) { Remove-Item $examplesZip -Force }
        Compress-Archive -Path "$examplesDist/*" -DestinationPath $examplesZip -Force
        Write-Host "  [OK] Created examples-windows-x86_64.zip ($( [math]::Round((Get-Item $examplesZip).Length / 1MB, 2) ) MB)" -ForegroundColor Green

        # Verify archive contains game folder with game.exe and game.dll
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zipObj = [System.IO.Compression.ZipFile]::OpenRead($examplesZip)
        $hasExe = ($zipObj.Entries | Where-Object { $_.FullName -like "*basic_demo/game.exe" -or $_.FullName -like "*basic_demo\game.exe" }).Count -gt 0
        $hasGameDll = ($zipObj.Entries | Where-Object { $_.FullName -like "*basic_demo/game.dll" -or $_.FullName -like "*basic_demo\game.dll" }).Count -gt 0
        $entryCount = $zipObj.Entries.Count
        $zipObj.Dispose()

        if (-not $hasExe -or -not $hasGameDll) {
            throw "examples-windows-x86_64.zip is missing basic_demo/game.exe or basic_demo/game.dll!"
        }
        Write-Host "  [OK] Verified examples-windows-x86_64.zip contains $entryCount entries including basic_demo/game.exe and basic_demo/game.dll." -ForegroundColor Green

        # 1b. Package Export Templates (godot-crystal-export-templates-4.8-dev4.zip)
        Write-Host "[Release] Packaging export templates (godot-crystal-export-templates-4.8-dev4.zip)..." -ForegroundColor Cyan
        $templatesZip = Join-Path $RootDir "godot-crystal-export-templates-4.8-dev4.zip"
        & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $RootDir "scripts/ensure_export_templates.ps1") -PackageZip -ZipOutput $templatesZip
        if (-not (Test-Path $templatesZip)) {
            throw "Failed to package godot-crystal-export-templates-4.8-dev4.zip!"
        }
        Write-Host "  [OK] Created export templates archive: $templatesZip ($( [math]::Round((Get-Item $templatesZip).Length / 1MB, 2) ) MB)" -ForegroundColor Green

        # 2. Package Addon/Plugin (godot-crystal-addon.zip)
        Write-Host "[Release] Packaging godot-crystal-addon.zip (addon + bridge DLL)..." -ForegroundColor Cyan
        $addonDist = Join-Path $RootDir "dist/addon_dist"
        if (Test-Path $addonDist) { Remove-Item $addonDist -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $addonDist | Out-Null

        $addonDest = Join-Path $addonDist "addons/crystal_integration"
        New-Item -ItemType Directory -Force -Path (Split-Path $addonDest) | Out-Null
        Copy-Item -Path "addons/crystal_integration" -Destination (Split-Path $addonDest) -Recurse -Force

        $addonBin = Join-Path $addonDist "bin"
        New-Item -ItemType Directory -Force -Path $addonBin | Out-Null
        if (Test-Path "bin/crystal_bridge.dll") {
            Copy-Item "bin/crystal_bridge.dll" "$addonBin/crystal_bridge.dll" -Force
        }
        foreach ($dll in @('gc.dll', 'iconv-2.dll', 'pcre2-8.dll')) {
            if (Test-Path "bin/$dll") { Copy-Item "bin/$dll" "$addonBin/$dll" -Force }
        }

        $addonZip = Join-Path $RootDir "godot-crystal-addon.zip"
        if (Test-Path $addonZip) { Remove-Item $addonZip -Force }
        Compress-Archive -Path "$addonDist/*" -DestinationPath $addonZip -Force
        Write-Host "  [OK] Created addon archive: $addonZip ($( [math]::Round((Get-Item $addonZip).Length / 1MB, 2) ) MB)" -ForegroundColor Green

        # 3. Package Template Project (template-project.zip) with addon preinstalled
        Write-Host "[Release] Packaging template-project.zip (addon preinstalled)..." -ForegroundColor Cyan
        $templateDist = Join-Path $RootDir "dist/template_dist"
        if (Test-Path $templateDist) { Remove-Item $templateDist -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $templateDist | Out-Null

        Get-ChildItem -Path "template" -Exclude ".godot" | ForEach-Object {
            Copy-Item -Path $_.FullName -Destination $templateDist -Recurse -Force
        }

        $templateAddon = Join-Path $templateDist "addons/crystal_integration"
        if (-not (Test-Path $templateAddon)) {
            New-Item -ItemType Directory -Force -Path (Split-Path $templateAddon) | Out-Null
            Copy-Item -Path "addons/crystal_integration" -Destination (Split-Path $templateAddon) -Recurse -Force
        }

        $templateBin = Join-Path $templateDist "bin"
        New-Item -ItemType Directory -Force -Path $templateBin | Out-Null
        if (Test-Path "bin/crystal_bridge.dll") {
            Copy-Item "bin/crystal_bridge.dll" "$templateBin/crystal_bridge.dll" -Force
        }
        if (Test-Path "template/bin/game.dll") {
            Copy-Item "template/bin/game.dll" "$templateBin/game.dll" -Force
        }
        foreach ($dll in @('gc.dll', 'iconv-2.dll', 'pcre2-8.dll')) {
            if (Test-Path "bin/$dll") { Copy-Item "bin/$dll" "$templateBin/$dll" -Force }
        }
        Get-ChildItem -Path $templateDist -Include "*.pdb", "*.exp", "*.lib" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

        $bundledLib = Join-Path $templateDist "lib/libgodot"
        New-Item -ItemType Directory -Force -Path $bundledLib | Out-Null
        Copy-Item -Path "src" -Destination (Join-Path $bundledLib "src") -Recurse -Force
        Copy-Item "shard.yml" "$bundledLib/shard.yml" -Force
        if (Test-Path "README.md") { Copy-Item "README.md" "$bundledLib/README.md" -Force }

        $templateZip = Join-Path $RootDir "template-project.zip"
        if (Test-Path $templateZip) { Remove-Item $templateZip -Force }
        Compress-Archive -Path "$templateDist/*" -DestinationPath $templateZip -Force
        Write-Host "  [OK] Created template archive: $templateZip ($( [math]::Round((Get-Item $templateZip).Length / 1MB, 2) ) MB)" -ForegroundColor Green

        # 4. Package Core LibGodot Distribution
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

        # 5. Generate Checksums
        Write-Host "[Release] Generating SHA256 checksums..." -ForegroundColor Cyan
        $checksumFile = Join-Path $RootDir "checksums.txt"
        $hashTargets = @($examplesZip, $addonZip, $templateZip, $coreZip)
        if (Test-Path $templatesZip) { $hashTargets += $templatesZip }
        Get-FileHash -Algorithm SHA256 $hashTargets | Format-Table -AutoSize | Out-String | Set-Content $checksumFile
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
