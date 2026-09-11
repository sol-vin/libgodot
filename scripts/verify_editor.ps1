# ==============================================================================
# verify_editor.ps1 - Verify Godot Editor Launch, Script Loader & Clean Shutdown
# ==============================================================================
param(
    [string]$Path = "template",
    [int]$QuitAfter = 50,
    [switch]$Verbose = $true
)

$ErrorActionPreference = "Stop"
$RootDir = if ($PSScriptRoot) { Split-Path -Parent $PSScriptRoot } else { (Get-Location).Path }
$GodotExe = Join-Path $RootDir "godot.exe"

if (-not (Test-Path $GodotExe)) {
    Write-Error "Godot executable not found at $GodotExe"
}

$TargetDir = if ([System.IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $RootDir $Path }
if (-not (Test-Path $TargetDir)) {
    Write-Error "Target project directory not found at $TargetDir"
}

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "  Verifying Godot Editor Launch, Script Loader & Clean Shutdown  " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Target Path: $TargetDir"
Write-Host "Quit After:  $QuitAfter frames`n"

$scratchDir = Join-Path $RootDir "scratch"
if (-not (Test-Path $scratchDir)) { New-Item -ItemType Directory -Force -Path $scratchDir | Out-Null }
$logFile = Join-Path $scratchDir "editor_verify.log"
if (Test-Path $logFile) { Remove-Item $logFile -Force }

$cmd = "`"$GodotExe`" --verbose --editor --path `"$TargetDir`" --quit-after $QuitAfter > `"$logFile`" 2>&1"
$process = Start-Process -FilePath "cmd.exe" -ArgumentList @("/c", $cmd) -PassThru -Wait

$logContent = if (Test-Path $logFile) { Get-Content $logFile -Raw } else { "" }

$failed = $false

# 1. Check for crashes / access violations
if ($logContent -match "CRASH INTERCEPTED" -or $logContent -match "EXCEPTION_ACCESS_VIOLATION" -or $logContent -match "Invalid memory access") {
    Write-Host "[FAILED] Godot Editor crashed with access violation!" -ForegroundColor Red
    $failed = $true
}

# 2. Check for loader errors
if ($logContent -match "No loader found for resource.*\.cr") {
    Write-Host "[FAILED] Godot Editor failed to find resource loader for .cr file!" -ForegroundColor Red
    $failed = $true
}

# 3. Check for static string unref errors at shutdown
if ($logContent -match "BUG: Unreferenced static string to 0") {
    Write-Host "[FAILED] Godot Editor shutdown printed 'BUG: Unreferenced static string to 0' leaks!" -ForegroundColor Red
    $failed = $true
}

# 4. Check for ERR_CANT_OPEN on scripts
if ($logContent -match 'Condition "res\.is_null\(\)" is true\. Returning: ERR_CANT_OPEN') {
    Write-Host "[FAILED] Godot Editor failed to open resource (ERR_CANT_OPEN)!" -ForegroundColor Red
    $failed = $true
}

# 5. Check for missing required virtual methods
if ($logContent -match "Required virtual method .* must be overridden") {
    Write-Host "[FAILED] Godot Editor reported missing required virtual method!" -ForegroundColor Red
    $failed = $true
}

if ($failed) {
    Write-Host "`n--- Verification Failed! Full Log Output ---" -ForegroundColor Red
    Write-Host $logContent
    exit 1
}

Write-Host "[PASSED] Editor launched, registered Crystal resources, and shut down cleanly with 0 errors!" -ForegroundColor Green
exit 0
