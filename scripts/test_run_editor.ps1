# scripts/test_run_editor.ps1 - Automated verification of run-editor.ps1
param(
    [switch]$Verbose = $false
)

$ErrorActionPreference = "Stop"
$RootDir = Split-Path -Parent $PSScriptRoot
$RunEditorScript = Join-Path $RootDir "run-editor.ps1"
$ScratchDir = Join-Path $RootDir "scratch"
if (-not (Test-Path $ScratchDir)) {
    New-Item -ItemType Directory -Force -Path $ScratchDir | Out-Null
}

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "         Verifying run-editor.ps1 CLI & Log Shadowing            " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan

$pwshExe = (Get-Process -Id $PID).Path
if (-not $pwshExe -or -not (Test-Path $pwshExe)) { $pwshExe = "powershell" }

$failedTests = 0

function Assert-Test {
    param(
        [string]$TestName,
        [bool]$Condition,
        [string]$Details = ""
    )
    if ($Condition) {
        Write-Host "  [PASSED] $TestName" -ForegroundColor Green
    } else {
        Write-Host "  [FAILED] ${TestName}: ${Details}" -ForegroundColor Red
        $script:failedTests++
    }
}

# -----------------------------------------------------------------------------
# Test 1: Invalid Path Handling
# -----------------------------------------------------------------------------
Write-Host "`n[Test 1] Testing invalid path error handling..." -ForegroundColor Yellow
$proc = Start-Process -FilePath $pwshExe -ArgumentList @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $RunEditorScript, "-Path", "non_existent_folder_xyz_99") -RedirectStandardOutput (Join-Path $ScratchDir "test1_out.log") -RedirectStandardError (Join-Path $ScratchDir "test1_err.log") -PassThru -Wait
$t1Out = Get-Content (Join-Path $ScratchDir "test1_out.log") -Raw -ErrorAction SilentlyContinue
Assert-Test "Invalid path exits with non-zero exit code" ($proc.ExitCode -ne 0) "ExitCode was $($proc.ExitCode)"
Assert-Test "Invalid path outputs helpful error message" ($t1Out -match "does not exist") "Output was: $t1Out"

# -----------------------------------------------------------------------------
# Test 2: Typo Parameter Handling (-pah instead of -path)
# -----------------------------------------------------------------------------
Write-Host "`n[Test 2] Testing typo parameter error handling..." -ForegroundColor Yellow
$proc2 = Start-Process -FilePath $pwshExe -ArgumentList @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $RunEditorScript, "-pah", "template") -RedirectStandardOutput (Join-Path $ScratchDir "test2_out.log") -RedirectStandardError (Join-Path $ScratchDir "test2_err.log") -PassThru -Wait
$t2Out = Get-Content (Join-Path $ScratchDir "test2_out.log") -Raw -ErrorAction SilentlyContinue
Assert-Test "Typo parameter exits with non-zero code" ($proc2.ExitCode -ne 0) "ExitCode was $($proc2.ExitCode)"
Assert-Test "Typo parameter suggests -Path" ($t2Out -match "Did you mean '-Path'") "Output was: $t2Out"

# -----------------------------------------------------------------------------
# Test 3: Headless Launch & Output Shadowing to Log File
# -----------------------------------------------------------------------------
Write-Host "`n[Test 3] Testing headless launch and real-time log shadowing..." -ForegroundColor Yellow
$testLog = Join-Path $ScratchDir "runner_shadow_test.log"
if (Test-Path $testLog) { Remove-Item $testLog -Force }

$proc3 = Start-Process -FilePath $pwshExe -ArgumentList @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $RunEditorScript, "-Path", "template", "-LogFile", $testLog, "--headless", "--quit-after", "10") -PassThru -Wait

Assert-Test "Headless run exits with 0" ($proc3.ExitCode -eq 0) "ExitCode was $($proc3.ExitCode)"
Assert-Test "Log file was created" (Test-Path $testLog) "File $testLog was not found"

if (Test-Path $testLog) {
    $logContent = Get-Content $testLog -Raw
    Assert-Test "Log contains LibGodot Editor Session Log header" ($logContent -match "LibGodot Editor Session Log") "Missing session header"
    Assert-Test "Log contains engine startup output" ($logContent -match "Godot Engine" -or $logContent -match "CrystalBridge") "Missing Godot output"
    Assert-Test "Log contains Session Ended trailer" ($logContent -match "Session Ended") "Missing session ended trailer"

    # Test 4: Verify log file handle is completely unlocked
    Write-Host "`n[Test 4] Testing log file lock release..." -ForegroundColor Yellow
    $canDelete = $false
    try {
        Remove-Item $testLog -Force -ErrorAction Stop
        $canDelete = $true
    } catch {
        $canDelete = $false
    }
    Assert-Test "Log file handle was released cleanly" $canDelete "File was locked"
}

# -----------------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------------
Write-Host "`n=================================================================" -ForegroundColor Cyan
if ($failedTests -eq 0) {
    Write-Host "  SUCCESS: All run-editor.ps1 verification checks passed!       " -ForegroundColor Green
    Write-Host "=================================================================`n" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host "  FAILED: $failedTests run-editor.ps1 check(s) failed!           " -ForegroundColor Red
    Write-Host "=================================================================`n" -ForegroundColor Cyan
    exit 1
}
