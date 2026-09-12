# ==============================================================================
# verify_editor.ps1 - Verify Godot Editor Launch, Script Loader & Clean Shutdown
# ==============================================================================
param(
    [string]$Path = "template",
    [int]$QuitAfter = 50,
    [string]$GodotExe = "",
    [switch]$TestBuildButton = $false,
    [int]$ReloadCycles = 2,
    [switch]$PurgeCache = $false,
    [switch]$TestErrorRecovery = $false,
    [switch]$Verbose = $true
)

$ErrorActionPreference = "Stop"
$RootDir = if ($PSScriptRoot) { Split-Path -Parent $PSScriptRoot } else { (Get-Location).Path }

if (-not $GodotExe -or -not (Test-Path $GodotExe)) {
    $GodotExe = Join-Path $RootDir "godot.exe"
}

if (-not (Test-Path $GodotExe)) {
    Write-Error "Godot executable not found at $GodotExe"
}

$TargetDir = if ([System.IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $RootDir $Path }
if (-not (Test-Path $TargetDir)) {
    Write-Error "Target project directory not found at $TargetDir"
}

$projName = (Split-Path -Leaf $TargetDir)

if ($TestBuildButton -and $QuitAfter -eq 50) {
    $QuitAfter = 3600 + ($ReloadCycles * 1800)
}
if ($TestErrorRecovery -and $QuitAfter -eq 50) {
    $QuitAfter = 1800
}

Write-Host "=================================================================" -ForegroundColor Cyan
if ($TestErrorRecovery) {
Write-Host "  Verifying Editor Crystal Compilation Error Recovery             " -ForegroundColor Cyan
} elseif ($TestBuildButton) {
Write-Host "  Verifying Editor Crystal Rebuild & Live GDExtension Reloading   " -ForegroundColor Cyan
} else {
Write-Host "  Verifying Godot Editor Launch, Script Loader & Clean Shutdown  " -ForegroundColor Cyan
}
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Target Path:         $TargetDir"
Write-Host "Quit After:          $QuitAfter frames"
Write-Host "Test Build Button:   $TestBuildButton"
Write-Host "Reload Cycles:       $ReloadCycles"
Write-Host "Test Error Recovery: $TestErrorRecovery`n"

$scratchDir = Join-Path $RootDir "scratch"
if (-not (Test-Path $scratchDir)) { New-Item -ItemType Directory -Force -Path $scratchDir | Out-Null }
$prefix = if ($TestErrorRecovery) { "editor_err_recov_${projName}" } elseif ($TestBuildButton) { "editor_rebuild_${projName}" } else { "editor_verify_${projName}" }
$logFile = Join-Path $scratchDir "${prefix}_out.log"
$errLogFile = Join-Path $scratchDir "${prefix}_err.log"

# Purge .godot cache folder if requested or during reload verification to prevent leakage
if ($PurgeCache -or $TestBuildButton) {
    $godotCacheDir = Join-Path $TargetDir ".godot"
    if (Test-Path $godotCacheDir) {
        Write-Host "Purging .godot cache folder at '$godotCacheDir' to prevent leakage..." -ForegroundColor Cyan
        Remove-Item $godotCacheDir -Recurse -Force -ErrorAction SilentlyContinue
    }
    # Re-synchronize extension_list.cfg and binaries so Godot loads GDExtension cleanly
    $syncScript = Join-Path $RootDir "scripts/sync_bins.ps1"
    if (Test-Path $syncScript) {
        & powershell -NoProfile -ExecutionPolicy Bypass -File $syncScript | Out-Null
    }
}

# Clean up any stale temporary shadow copies or error logs from prior runs
if ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';') {
    cmd.exe /c "del /s /q /f /a:h `"$TargetDir\~*`" 2>nul & del /s /q /f `"$TargetDir\~*`" 2>nul" | Out-Null
} else {
    Get-ChildItem -Path $TargetDir -Filter "~*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
}
if (Test-Path $logFile) { Remove-Item $logFile -Force }
if (Test-Path $errLogFile) { Remove-Item $errLogFile -Force }

$scratchErrFile = Join-Path $TargetDir "src/scratch_syntax_error.cr"
if ($TestErrorRecovery) {
    $env:LIBGODOT_TEST_ERROR_RECOVERY = "1"
    $env:LIBGODOT_TEST_BUILD_BUTTON = "1"
    Set-Content -Path $scratchErrFile -Value "node BrokenSyntaxNode < Node2D do`n  def broken(`nend" -Force
} elseif ($TestBuildButton) {
    $env:LIBGODOT_TEST_BUILD_BUTTON = "1"
    $env:LIBGODOT_TEST_RELOAD_CYCLES = "$ReloadCycles"
}

try {
    $godotArgs = @("--editor", "--path", $TargetDir, "--quit-after", "$QuitAfter")
    $onUnix = ($env:OS -ne "Windows_NT" -and [System.IO.Path]::PathSeparator -ne ';')
    if ($onUnix -and -not $env:DISPLAY -and -not $env:WAYLAND_DISPLAY) {
        $godotArgs = @("--headless", "--rendering-driver", "opengl3") + $godotArgs
    }
    $process = Start-Process -FilePath $GodotExe -ArgumentList $godotArgs -RedirectStandardOutput $logFile -RedirectStandardError $errLogFile -PassThru
    $timeoutSec = if ($TestBuildButton) { 60 + ($ReloadCycles * 60) } elseif ($TestErrorRecovery) { 90 } else { 45 }
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while (-not $process.HasExited -and $sw.Elapsed.TotalSeconds -lt $timeoutSec) {
        Start-Sleep -Milliseconds 500
    }
    if (-not $process.HasExited) {
        Write-Host "[TIMEOUT] Godot Editor exceeded ${timeoutSec}s timeout. Terminating..." -ForegroundColor Red
        $process.Kill()
        $process.WaitForExit(5000)
    } else {
        $process.WaitForExit()
    }
} finally {
    if ($TestBuildButton) {
        Remove-Item Env:\LIBGODOT_TEST_BUILD_BUTTON -ErrorAction SilentlyContinue
        Remove-Item Env:\LIBGODOT_TEST_RELOAD_CYCLES -ErrorAction SilentlyContinue
    }
    if ($TestErrorRecovery) {
        Remove-Item Env:\LIBGODOT_TEST_ERROR_RECOVERY -ErrorAction SilentlyContinue
        if (Test-Path $scratchErrFile) {
            Remove-Item $scratchErrFile -Force -ErrorAction SilentlyContinue
        }
    }
}

$outContent = if (Test-Path $logFile) { Get-Content $logFile -Raw } else { "" }
$errContent = if (Test-Path $errLogFile) { Get-Content $errLogFile -Raw } else { "" }
$logContent = "$outContent`n$errContent"

$failed = $false

# 0. Check process exit code
if ($null -ne $process.ExitCode -and $process.ExitCode -ne 0) {
    Write-Host "[FAILED] Godot Editor process exited with non-zero exit code $($process.ExitCode)!" -ForegroundColor Red
    $failed = $true
}

# 1. Check for crashes / access violations / stack overflow
if ($logContent -match "CRASH INTERCEPTED" -or $logContent -match "EXCEPTION_ACCESS_VIOLATION" -or $logContent -match "Invalid memory access" -or $logContent -match "Stack overflow" -or $logContent -match "Segmentation fault") {
    Write-Host "[FAILED] Godot Editor crashed with access violation / stack overflow!" -ForegroundColor Red
    $failed = $true
}

# 2. Check for missing/unregistered Crystal classes in ClassDB
if ($logContent -match "Cannot get class 'Crystal") {
    Write-Host "[FAILED] Godot Editor reported missing Crystal class in ClassDB!" -ForegroundColor Red
    $failed = $true
}

# 3. Check for null syntax highlighter
if ($logContent -match 'Condition "p_syntax_highlighter\.is_null\(\)" is true') {
    Write-Host "[FAILED] Godot Editor reported null syntax highlighter!" -ForegroundColor Red
    $failed = $true
}

# 4. Check for PopupMenu out of bounds errors
if ($logContent -match "scene/gui/popup_menu\.cpp:2200" -or $logContent -match "Index p_idx = 1 is out of bounds") {
    Write-Host "[FAILED] Godot Editor threw PopupMenu out-of-bounds index errors!" -ForegroundColor Red
    $failed = $true
}

# 5. Check for GDExtension library open/copy failures (~crystal_bridge.dll or file locks)
if ($logContent -match "Failed to open '.*~crystal_bridge\.dll'" -or $logContent -match "Error copying library" -or $logContent -match "Can't open GDExtension dynamic library" -or $logContent -match "Error loading extension") {
    Write-Host "[FAILED] Godot Editor reported GDExtension library loading or copying error!" -ForegroundColor Red
    $failed = $true
}

# 6. Check for loader errors
if ($logContent -match "No loader found for resource.*\.cr") {
    Write-Host "[FAILED] Godot Editor failed to find resource loader for .cr file!" -ForegroundColor Red
    $failed = $true
}

# 7. Check for static string unref errors at shutdown
if ($logContent -match "BUG: Unreferenced static string to 0") {
    Write-Host "[FAILED] Godot Editor shutdown printed 'BUG: Unreferenced static string to 0' leaks!" -ForegroundColor Red
    $failed = $true
}

# 8. Check for ERR_CANT_OPEN on scripts
if ($logContent -match 'Condition "res\.is_null\(\)" is true\. Returning: ERR_CANT_OPEN') {
    Write-Host "[FAILED] Godot Editor failed to open resource (ERR_CANT_OPEN)!" -ForegroundColor Red
    $failed = $true
}

# 9. Check for missing required virtual methods
if ($logContent -match "Required virtual method .* must be overridden") {
    Write-Host "[FAILED] Godot Editor reported missing required virtual method!" -ForegroundColor Red
    $failed = $true
}

# 10. Check for GDExtension not reloadable error
if ($logContent -match "This GDExtension is not marked as 'reloadable'") {
    Write-Host "[FAILED] Godot Editor reported that GDExtension is not reloadable!" -ForegroundColor Red
    $failed = $true
}

# 11. Check TestBuildButton completion
if ($TestBuildButton) {
    if ($logContent -notmatch [regex]::Escape("[TestBuildButton] SUCCESS: Build Crystal button pressed, compilation succeeded, and GDExtension reloaded cleanly!")) {
        Write-Host "[FAILED] Automated Build Crystal button test did not complete reload verification!" -ForegroundColor Red
        $failed = $true
    } else {
        Write-Host "[PASSED] Automated Build Crystal button press, compilation, and live GDExtension reload verified successfully ($ReloadCycles reload cycles)!" -ForegroundColor Green
    }
}

# 12. Check TestErrorRecovery completion
if ($TestErrorRecovery) {
    if ($logContent -notmatch [regex]::Escape("[TestErrorRecovery] SUCCESS: Compilation failure captured gracefully and button recovered to 'Build Failed'!")) {
        Write-Host "[FAILED] Automated error recovery test did not capture compiler failure or recover button state!" -ForegroundColor Red
        $failed = $true
    } else {
        Write-Host "[PASSED] In-Editor Crystal compilation error recovery verified successfully!" -ForegroundColor Green
    }
}

if ($failed) {
    Write-Host "`n--- Verification Failed! Full Log Output ---" -ForegroundColor Red
    Write-Host $logContent
    $global:LASTEXITCODE = 1
    exit 1
}

Write-Host "[PASSED] Editor launched, registered Crystal resources, and shut down cleanly with 0 errors!" -ForegroundColor Green
$global:LASTEXITCODE = 0
exit 0
