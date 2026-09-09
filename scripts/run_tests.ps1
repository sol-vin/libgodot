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
    [switch]$SkipStandaloneTests,
    [switch]$SkipSmokeTests,
    [int]$TimeoutSeconds = 60
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $PSScriptRoot
$TestDir = Join-Path $RootDir "test"
$TestBinDir = Join-Path $TestDir "bin"
$TemplateDir = Join-Path $RootDir "template"
$ExamplesDir = Join-Path $RootDir "examples"

if (-not (Test-Path $TestBinDir)) {
    New-Item -ItemType Directory -Force -Path $TestBinDir | Out-Null
}

# Clean up any legacy root executables, reports, or markers from previous runs
@(
    (Join-Path $TestDir "tests.exe"),
    (Join-Path $TestDir "tests"),
    (Join-Path $TestDir "game.exe"),
    (Join-Path $TestDir "game"),
    (Join-Path $TestDir "test_report.md"),
    (Join-Path $TestDir "test_report.json"),
    (Join-Path $TestDir ".tool_tests_passed"),
    (Join-Path $TestDir ".tool_tests_failed"),
    (Join-Path $TestDir ".runtime_tests_passed"),
    (Join-Path $TestDir ".runtime_tests_failed"),
    (Join-Path $TestDir ".runtime_test_results.txt")
) | Where-Object { Test-Path $_ } | ForEach-Object {
    Remove-Item $_ -Force -ErrorAction SilentlyContinue
}

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
} elseif (Test-Path (Join-Path $RootDir "Godot.app/Contents/MacOS/Godot")) {
    $GodotExe = Join-Path $RootDir "Godot.app/Contents/MacOS/Godot"
} elseif (Test-Path "/Applications/Godot.app/Contents/MacOS/Godot") {
    $GodotExe = "/Applications/Godot.app/Contents/MacOS/Godot"
} elseif (Get-Command godot -ErrorAction SilentlyContinue) {
    $GodotExe = (Get-Command godot).Source
}

if (-not $GodotExe -or -not (Test-Path $GodotExe)) {
    Write-Host "::error::Godot executable was not found. Please provide -GodotPath, set `$env:GODOT4 or place godot.exe in $RootDir" -ForegroundColor Red
    exit 1
}

$FailedSteps = [System.Collections.Generic.List[string]]::new()
$RecordedResults = [System.Collections.Generic.List[hashtable]]::new()
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
        [string]$Category,
        [string]$Executable,
        [string[]]$Arguments,
        [string]$WorkingDirectory = $RootDir,
        [hashtable]$EnvironmentVars = @{},
        [switch]$CustomVerification
    )

    Write-Host "::group::$Name" -ForegroundColor Yellow
    Write-Host "[RUNNING] $Name" -ForegroundColor Cyan
    Write-Host "Command: $Executable $($Arguments -join ' ')" -ForegroundColor DarkGray

    # Set environment variables
    foreach ($k in $EnvironmentVars.Keys) {
        [System.Environment]::SetEnvironmentVariable($k, $EnvironmentVars[$k])
    }

    $cmdStart = Get-Date
    # Ensure working directory bin and root bin are in PATH for DLL resolution
    $oldPath = $env:PATH
    $oldDyldFallback = $env:DYLD_FALLBACK_LIBRARY_PATH
    $binCandidates = @(
        (Join-Path $WorkingDirectory "addons/crystal_addon/bin"),
        (Join-Path $WorkingDirectory "bin"),
        (Join-Path $RootDir "bin"),
        (Join-Path $RootDir "test/bin")
    ) | Where-Object { Test-Path $_ }
    if ($binCandidates) {
        $binJoined = $binCandidates -join [System.IO.Path]::PathSeparator
        $env:PATH = $binJoined + [System.IO.Path]::PathSeparator + $env:PATH
        if ($env:DYLD_FALLBACK_LIBRARY_PATH) {
            $env:DYLD_FALLBACK_LIBRARY_PATH = $binJoined + ":" + $env:DYLD_FALLBACK_LIBRARY_PATH
        } else {
            $env:DYLD_FALLBACK_LIBRARY_PATH = $binJoined
        }
    }

    Push-Location $WorkingDirectory
    try {
        if (($env:OS -like "*Windows*" -or $IsWindows) -and $Executable.EndsWith(".exe", [System.StringComparison]::OrdinalIgnoreCase)) {
            $argStr = ($Arguments | ForEach-Object { if ($_ -match '\s') { "`"$_`"" } else { $_ } }) -join ' '
            cmd /c "`"$Executable`" $argStr" | Out-Host
            $exitCode = $LASTEXITCODE
        } else {
            & $Executable $Arguments | Out-Host
            $exitCode = $LASTEXITCODE
        }
    } finally {
        Pop-Location
        $env:PATH = $oldPath
        $env:DYLD_FALLBACK_LIBRARY_PATH = $oldDyldFallback
        foreach ($k in $EnvironmentVars.Keys) {
            [System.Environment]::SetEnvironmentVariable($k, $null)
        }
    }

    $cmdDuration = [math]::Round(((Get-Date) - $cmdStart).TotalSeconds, 2)
    Write-Host "::endgroup::"

    $item = @{
        Name = $Name
        Category = $Category
        Success = ($exitCode -eq 0)
        ExitCode = $exitCode
        Duration = $cmdDuration
    }
    $RecordedResults.Add($item)

    if ($CustomVerification) {
        return $item
    }

    if ($exitCode -eq 0) {
        Write-Host "[PASSED] $Name (Exit Code: $exitCode, ${cmdDuration}s)`n" -ForegroundColor Green
        return $item
    } else {
        Write-Host "[FAILED] $Name (Exit Code: $exitCode, ${cmdDuration}s)`n" -ForegroundColor Yellow
        return $item
    }
}

# -----------------------------------------------------------------------------
# Phase 1: Crystal Unit Specs
# -----------------------------------------------------------------------------
if (-not $SkipSpecs) {
    Write-Host "--- Phase 1: Crystal Verification Specs ---" -ForegroundColor Magenta

    $editorSpecResult = Invoke-TestCommand -Name "Crystal Spec: Test Editor Suite (test/spec)" `
        -Executable "crystal" `
        -Arguments @("spec", "--no-color") `
        -WorkingDirectory $TestDir
    if (-not $editorSpecResult["Success"]) {
        $FailedSteps.Add("Crystal Spec: Test Editor Suite (test/spec)")
    }

    $specResult1 = Invoke-TestCommand -Name "Crystal Spec: LibGodot Core" `
        -Executable "crystal" `
        -Arguments @("run", "spec/libgodot_spec.cr")
    if (-not $specResult1["Success"]) {
        $FailedSteps.Add("Crystal Spec (libgodot_spec.cr)")
    }

    $specResult2 = Invoke-TestCommand -Name "Crystal Spec: Boot Loader" `
        -Executable "crystal" `
        -Arguments @("run", "spec/boot_spec.cr")
    if (-not $specResult2["Success"]) {
        $FailedSteps.Add("Crystal Spec (boot_spec.cr)")
    }

    $apiJsonPath = Join-Path $RootDir "extension_api.json"
    if ((-not (Test-Path $apiJsonPath)) -and $GodotExe -and (Test-Path $GodotExe)) {
        Write-Host "Dumping extension_api.json for api_coverage_spec..." -ForegroundColor Cyan
        & $GodotExe --headless --dump-extension-api | Out-Null
    }

    $specResult3 = Invoke-TestCommand -Name "Crystal Spec: API Definition & Class Coverage" `
        -Executable "crystal" `
        -Arguments @("run", "spec/api_coverage_spec.cr")
    if (-not $specResult3["Success"]) {
        $FailedSteps.Add("Crystal Spec (api_coverage_spec.cr)")
    }
}

# -----------------------------------------------------------------------------
# Phase 2: In-Editor Tool Script Tests (Tickled via godot --headless --editor)
# -----------------------------------------------------------------------------
if (-not $SkipToolTests) {
    Write-Host "--- Phase 2: In-Editor @tool Script Tests ---" -ForegroundColor Magenta

    # Clear old marker files
    $passMarker = Join-Path $TestBinDir ".tool_tests_passed"
    $failMarker = Join-Path $TestBinDir ".tool_tests_failed"
    if (Test-Path $passMarker) { Remove-Item $passMarker -Force }
    if (Test-Path $failMarker) { Remove-Item $failMarker -Force }

    $toolResult = Invoke-TestCommand -Name "Headless Editor Tool Tests (ToolTester2D & ToolTester3D)" `
        -Executable $GodotExe `
        -Arguments @("--headless", "--rendering-driver", "opengl3", "--editor", "--path", "test", "--quit-after", "25") `
        -EnvironmentVars @{ "GODOT_RUN_TOOL_TESTS" = "1" } `
        -CustomVerification

    if (Test-Path $failMarker) {
        $failContent = Get-Content $failMarker -Raw
        Write-Host "::error::In-Editor tool tests reported failures in marker file:`n$failContent" -ForegroundColor Red
        $FailedSteps.Add("In-Editor Tool Tests (ToolTester2D / ToolTester3D failed: $failContent)")
        $toolResult["Success"] = $false
        Write-Host "[FAILED] Headless Editor Tool Tests (ToolTester2D & ToolTester3D)`n" -ForegroundColor Red
    } elseif (-not (Test-Path $passMarker) -and (-not $toolResult["Success"])) {
        $FailedSteps.Add("In-Editor Tool Tests (Process exited with code $($toolResult['ExitCode']))")
        $toolResult["Success"] = $false
        Write-Host "[FAILED] Headless Editor Tool Tests (ToolTester2D & ToolTester3D) (Exit Code: $($toolResult['ExitCode']))`n" -ForegroundColor Red
    } else {
        $toolResult["Success"] = $true
        Write-Host "[PASSED] In-Editor Tool Tests verified successfully.`n" -ForegroundColor Green
    }

    # -------------------------------------------------------------------------
    # Editor Addon Verification: Load compiled Crystal EditorPlugin and verify unique string
    # -------------------------------------------------------------------------
    Write-Host "[Editor Addon Test] Verifying compiled Crystal Addon loads in Godot Editor..." -ForegroundColor Cyan
    $scratchDir = Join-Path $RootDir "scratch"
    if (-not (Test-Path $scratchDir)) { New-Item -ItemType Directory -Force -Path $scratchDir | Out-Null }
    $addonLogFile = Join-Path $scratchDir "addon_editor_test.log"
    if (Test-Path $addonLogFile) { Remove-Item $addonLogFile -Force }

    $uniqueString = "[CRYSTAL_ADDON_VERIFIED_SUCCESS_8A3F1E]"

    # Pre-populate extension_list.cfg so Godot loads GDExtension upfront without in-flight scan races
    $addonGodotDir = Join-Path $RootDir "template-addon/.godot"
    if (-not (Test-Path $addonGodotDir)) { New-Item -ItemType Directory -Force -Path $addonGodotDir | Out-Null }
    Set-Content -Path (Join-Path $addonGodotDir "extension_list.cfg") -Value @('res://addons/crystal_addon/crystal_addon.gdextension', 'res://addons/crystal_integration/crystal.gdextension') -Force

    $onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
    $shell = if ($onWindows) { "cmd" } else { "sh" }
    $shellFlag = if ($onWindows) { "/c" } else { "-c" }
    $addonDir = Join-Path $RootDir "template-addon"
    $shellCmd = "`"$GodotExe`" --headless --rendering-driver opengl3 --editor --path `"$addonDir`" --quit > `"$addonLogFile`" 2>&1"

    $addonEditorResult = Invoke-TestCommand -Name "Headless Editor Addon Test (template-addon)" `
        -Executable $shell `
        -Arguments @($shellFlag, $shellCmd) `
        -WorkingDirectory $addonDir `
        -CustomVerification

    $addonLogContent = if (Test-Path $addonLogFile) { Get-Content $addonLogFile -Raw } else { "" }
    if ($addonLogContent -match [regex]::Escape($uniqueString) -and $addonEditorResult["ExitCode"] -eq 0) {
        $addonEditorResult["Success"] = $true
        Write-Host "[PASSED] Compiled Crystal Addon verified in Godot Editor! Found unique string: $uniqueString`n" -ForegroundColor Green
    } elseif ($addonLogContent -match [regex]::Escape($uniqueString)) {
        $addonEditorResult["Success"] = $false
        Write-Host "::error::Compiled Crystal Addon loaded, but process crashed or exited with code $($addonEditorResult['ExitCode'])!`nLog output:`n$addonLogContent" -ForegroundColor Red
        $FailedSteps.Add("Editor Addon Test (Process exited with code $($addonEditorResult['ExitCode']))")
        Write-Host "[FAILED] Headless Editor Addon Test (template-addon) (Exit Code: $($addonEditorResult['ExitCode']))`n" -ForegroundColor Red
    } else {
        $addonEditorResult["Success"] = $false
        Write-Host "::error::Compiled Crystal Addon failed to load or did not print unique string '$uniqueString'!`nLog output:`n$addonLogContent" -ForegroundColor Red
        $FailedSteps.Add("Editor Addon Test (Unique string '$uniqueString' not found in editor log)")
        Write-Host "[FAILED] Headless Editor Addon Test (template-addon)`n" -ForegroundColor Red
    }
}

# -----------------------------------------------------------------------------
# Phase 3: Standalone Compiled Test Runner (./tests --autorun)
# -----------------------------------------------------------------------------
# Ensure dummy addons are compiled and synced for multi-addon isolation tests
$dummyScript = Join-Path $RootDir "scripts/build_dummy_addons.ps1"
if (Test-Path $dummyScript) {
    & $dummyScript
}
$syncScript = Join-Path $RootDir "scripts/sync_bins.ps1"
if (Test-Path $syncScript) {
    & $syncScript
}

if (-not $SkipStandaloneTests) {
    Write-Host "--- Phase 3: Standalone Compiled Test Runner (./tests --autorun) ---" -ForegroundColor Magenta

    $onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
    $exeExt = if ($onWindows) { ".exe" } else { "" }
    $pkgScript = Join-Path $RootDir "scripts/package_game.ps1"
    $standaloneExe = Join-Path $TestBinDir "tests$exeExt"

    # 1. Package test suite into standalone executable (Debug)
    Write-Host "[Standalone Test] Packaging test project into standalone executable (Debug)..." -ForegroundColor Cyan
    & $pkgScript -ProjectPath $TestDir -Name "tests" -ForceCompile

    if (-not (Test-Path $standaloneExe)) {
        $candidateExe = Join-Path $TestBinDir "game$exeExt"
        if (Test-Path $candidateExe) { $standaloneExe = $candidateExe }
    }

    $runExe = $standaloneExe
    if ($onWindows) {
        $consoleExe = Join-Path $TestBinDir "tests.console.exe"
        if (Test-Path $consoleExe) {
            $runExe = $consoleExe
        }
    }

    if (Test-Path $runExe) {
        $runPassMarkers = @(
            (Join-Path $TestBinDir ".runtime_tests_passed"),
            (Join-Path $TestDir ".runtime_tests_passed")
        )
        $runFailMarkers = @(
            (Join-Path $TestBinDir ".runtime_tests_failed"),
            (Join-Path $TestDir ".runtime_tests_failed")
        )
        $summaryFiles = @(
            (Join-Path $TestBinDir ".runtime_test_results.txt"),
            (Join-Path $TestDir ".runtime_test_results.txt")
        )
        foreach ($m in ($runPassMarkers + $runFailMarkers + $summaryFiles)) {
            if (Test-Path $m) { Remove-Item $m -Force }
        }

        # Standalone exported templates forbid '--path', so we run directly in TestBinDir
        $standaloneResult = Invoke-TestCommand -Name "Standalone Compiled Test Runner (tests$exeExt --autorun)" `
            -Executable $runExe `
            -Arguments @("--headless", "--rendering-driver", "opengl3", "--quit-after", "15", "--", "--autorun") `
            -WorkingDirectory $TestBinDir `
            -CustomVerification

        foreach ($sf in $summaryFiles) {
            if (Test-Path $sf) {
                $summary = Get-Content $sf -Raw
                Write-Host "Standalone Test Execution Summary:`n$summary" -ForegroundColor Cyan
                break
            }
        }

        $failedMarkerFound = $runFailMarkers | Where-Object { Test-Path $_ } | Select-Object -First 1
        $passedMarkerFound = $runPassMarkers | Where-Object { Test-Path $_ } | Select-Object -First 1

        if ($failedMarkerFound) {
            $standaloneResult["Success"] = $false
            Write-Host "::error::Standalone runtime test suite reported failures!" -ForegroundColor Red
            $FailedSteps.Add("Standalone Test Suite (Failures recorded in $failedMarkerFound)")
            Write-Host "[FAILED] Standalone Compiled Test Runner (tests$exeExt --autorun)`n" -ForegroundColor Red
        } elseif (-not $standaloneResult["Success"] -and -not $passedMarkerFound) {
            $standaloneResult["Success"] = $false
            $FailedSteps.Add("Standalone Test Suite (Process exited with code $($standaloneResult['ExitCode']))")
            Write-Host "[FAILED] Standalone Compiled Test Runner (tests$exeExt --autorun) (Exit Code: $($standaloneResult['ExitCode']))`n" -ForegroundColor Red
        } else {
            $standaloneResult["Success"] = $true
            Write-Host "[PASSED] Standalone compiled test runner executed and verified with --autorun.`n" -ForegroundColor Green
        }
    } else {
        Write-Host "::error::Standalone tests executable '$runExe' was not created." -ForegroundColor Red
        $FailedSteps.Add("Standalone Test Suite (Executable not found: $runExe)")
    }

    # 2. Package and verify in Standalone Release Mode if requested
    if ($env:RELEASE -eq "1") {
        Write-Host "[Standalone Test] Packaging test project in RELEASE mode..." -ForegroundColor Cyan
        & $pkgScript -ProjectPath $TestDir -Name "tests" -Release 1 -ForceCompile

        if (Test-Path $runExe) {
            foreach ($m in ($runPassMarkers + $runFailMarkers + $summaryFiles)) {
                if (Test-Path $m) { Remove-Item $m -Force }
            }

            $relResult = Invoke-TestCommand -Name "Standalone Release Test Runner (tests$exeExt --autorun RELEASE=1)" `
                -Executable $runExe `
                -Arguments @("--headless", "--rendering-driver", "opengl3", "--quit-after", "15", "--", "--autorun") `
                -WorkingDirectory $TestBinDir `
                -CustomVerification

            $failedRel = $runFailMarkers | Where-Object { Test-Path $_ } | Select-Object -First 1
            $passedRel = $runPassMarkers | Where-Object { Test-Path $_ } | Select-Object -First 1

            if ($failedRel -or (-not $relResult["Success"] -and -not $passedRel)) {
                $relResult["Success"] = $false
                $FailedSteps.Add("Standalone Release Test Suite (Process exited with code $($relResult['ExitCode']))")
                Write-Host "[FAILED] Standalone Release Test Runner`n" -ForegroundColor Red
            } else {
                $relResult["Success"] = $true
                Write-Host "[PASSED] Standalone release test runner executed and verified with --autorun.`n" -ForegroundColor Green
            }
        }
    }
}

# -----------------------------------------------------------------------------
# Phase 3b: In-Project Runtime Test Runner (Godot Engine Host)
# -----------------------------------------------------------------------------
if (-not $SkipRuntimeTests) {
    Write-Host "--- Phase 3b: In-Project Runtime Test Runner (Godot Engine Host) ---" -ForegroundColor Magenta

    # Clear old marker files
    $runPassMarker = Join-Path $TestBinDir ".runtime_tests_passed"
    $runFailMarker = Join-Path $TestBinDir ".runtime_tests_failed"
    $summaryFile = Join-Path $TestBinDir ".runtime_test_results.txt"
    if (Test-Path $runPassMarker) { Remove-Item $runPassMarker -Force }
    if (Test-Path $runFailMarker) { Remove-Item $runFailMarker -Force }
    if (Test-Path $summaryFile) { Remove-Item $summaryFile -Force }

    $runtimeResult = Invoke-TestCommand -Name "Runtime Test Runner (main_test_runner.tscn --autorun)" `
        -Executable $GodotExe `
        -Arguments @("--headless", "--rendering-driver", "opengl3", "--path", ".", "--quit-after", "15", "--", "--autorun") `
        -WorkingDirectory $TestDir `
        -CustomVerification

    if (Test-Path $summaryFile) {
        $summary = Get-Content $summaryFile -Raw
        Write-Host "Test Execution Summary:`n$summary" -ForegroundColor Cyan
    }

    if (Test-Path $runFailMarker) {
        $runtimeResult["Success"] = $false
        Write-Host "::error::Runtime test suite reported failures!" -ForegroundColor Red
        $FailedSteps.Add("Runtime Test Suite (Failures recorded in $runFailMarker)")
        Write-Host "[FAILED] Runtime Test Runner (main_test_runner.tscn)`n" -ForegroundColor Red
    } elseif (-not $runtimeResult["Success"] -and -not (Test-Path $runPassMarker)) {
        $runtimeResult["Success"] = $false
        $FailedSteps.Add("Runtime Test Suite (Process exited with code $($runtimeResult['ExitCode']))")
        Write-Host "[FAILED] Runtime Test Runner (main_test_runner.tscn) (Exit Code: $($runtimeResult['ExitCode']))`n" -ForegroundColor Red
    } else {
        $runtimeResult["Success"] = $true
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
        if (-not $templateResult["Success"]) {
            $FailedSteps.Add("Smoke Test: Template Project")
        }
    }

    $basicDemoDir = Join-Path $ExamplesDir "basic_demo"
    if (Test-Path $basicDemoDir) {
        $demoResult = Invoke-TestCommand -Name "Smoke Test: Basic Demo Example" `
            -Executable $GodotExe `
            -Arguments @("--headless", "--rendering-driver", "opengl3", "--path", "examples/basic_demo", "--quit")
        if (-not $demoResult["Success"]) {
            $FailedSteps.Add("Smoke Test: Basic Demo")
        }
    }
}

# -----------------------------------------------------------------------------
# Generate Custom Status Report (Markdown & JSON)
# -----------------------------------------------------------------------------
$Duration = [math]::Round(((Get-Date) - $StartTime).TotalSeconds, 2)
$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$isMac = $false
try {
    if ($IsMacOS -or [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)) {
        $isMac = $true
    }
} catch {}
if (-not $isMac -and -not $onWindows) {
    if ((Get-Command uname -ErrorAction SilentlyContinue) -and ((& uname) -eq "Darwin")) { $isMac = $true }
}
$platformArch = if ([System.Environment]::Is64BitProcess) {
    if ($isMac -and [System.Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture -eq "Arm64") { "arm64" } else { "x86_64" }
} else { "x86" }
$platformName = if ($onWindows) { "Windows ($platformArch)" } elseif ($isMac) { "macOS ($platformArch)" } else { "Linux ($platformArch)" }
$crystalVer = (crystal -v 2>$null | Select-Object -First 1)
$godotVer = (& $GodotExe --version 2>$null | Select-Object -First 1)

$runtimeTotal = 0
$runtimePassed = 0
$runtimeFailed = 0
$summaryFile = Join-Path $TestBinDir ".runtime_test_results.txt"
if (Test-Path $summaryFile) {
    $rawSummary = Get-Content $summaryFile -Raw
    if ($rawSummary -match 'TOTAL=(\d+)') { $runtimeTotal = [int]$matches[1] }
    if ($rawSummary -match 'PASSED=(\d+)') { $runtimePassed = [int]$matches[1] }
    if ($rawSummary -match 'FAILED=(\d+)') { $runtimeFailed = [int]$matches[1] }
}

$statusBadge = if ($FailedSteps.Count -eq 0) { "**SUCCESS (All Passed)**" } else { "**FAILED ($($FailedSteps.Count) failed)**" }

$mdReport = [System.Text.StringBuilder]::new()
[void]$mdReport.AppendLine("## LibGodot Test Suite Status Report ($platformName)")
[void]$mdReport.AppendLine("")
[void]$mdReport.AppendLine("| Metric | Value |")
[void]$mdReport.AppendLine("| :--- | :--- |")
[void]$mdReport.AppendLine("| **Overall Status** | $statusBadge |")
[void]$mdReport.AppendLine("| **Platform** | $platformName |")
[void]$mdReport.AppendLine("| **Crystal Version** | $crystalVer |")
[void]$mdReport.AppendLine("| **Godot Version** | $godotVer |")
[void]$mdReport.AppendLine("| **Total Duration** | ${Duration}s |")
if ($runtimeTotal -gt 0) {
    [void]$mdReport.AppendLine("| **Runtime Assertions** | $runtimePassed / $runtimeTotal passed |")
}
[void]$mdReport.AppendLine("")
[void]$mdReport.AppendLine("### Executed Test Steps")
[void]$mdReport.AppendLine("")
[void]$mdReport.AppendLine("| Status | Phase / Test Step | Duration | Exit Code |")
[void]$mdReport.AppendLine("| :---: | :--- | :---: | :---: |")

foreach ($res in $RecordedResults) {
    $resIcon = if ($res["Success"]) { "PASSED" } else { "FAILED" }
    [void]$mdReport.AppendLine("| $resIcon | $($res['Name']) | $($res['Duration'])s | $($res['ExitCode']) |")
}

if ($FailedSteps.Count -gt 0) {
    [void]$mdReport.AppendLine("")
    [void]$mdReport.AppendLine("### Failures Detected ($($FailedSteps.Count))")
    foreach ($f in $FailedSteps) {
        [void]$mdReport.AppendLine("- FAIL: $f")
    }
}

$reportMdContent = $mdReport.ToString()
$reportMdPath = Join-Path $TestBinDir "test_report.md"
Set-Content -Path $reportMdPath -Value $reportMdContent -Force
$reportMdPathRoot = Join-Path $TestDir "test_report.md"
Set-Content -Path $reportMdPathRoot -Value $reportMdContent -Force

# Generate JSON report
$jsonReport = @{
    platform = $platformName
    crystal_version = $crystalVer
    godot_version = $godotVer
    duration_seconds = $Duration
    overall_success = ($FailedSteps.Count -eq 0)
    failed_steps_count = $FailedSteps.Count
    failed_steps = $FailedSteps
    runtime_summary = @{
        total = $runtimeTotal
        passed = $runtimePassed
        failed = $runtimeFailed
    }
    steps = $RecordedResults
    timestamp = (Get-Date -Format "o")
} | ConvertTo-Json -Depth 5
$reportJsonPath = Join-Path $TestBinDir "test_report.json"
Set-Content -Path $reportJsonPath -Value $jsonReport -Force
$reportJsonPathRoot = Join-Path $TestDir "test_report.json"
Set-Content -Path $reportJsonPathRoot -Value $jsonReport -Force

# Append to GITHUB_STEP_SUMMARY if running in GitHub Actions
if ($env:GITHUB_STEP_SUMMARY) {
    try {
        [System.IO.File]::AppendAllText($env:GITHUB_STEP_SUMMARY, "`n$reportMdContent`n")
        Write-Host "  -> Published test report to GitHub Step Summary." -ForegroundColor Green
    } catch {
        Write-Warning "Could not write to GITHUB_STEP_SUMMARY: $_"
    }
}

# -----------------------------------------------------------------------------
# Final Summary & Exit
# -----------------------------------------------------------------------------
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
