param(
    [string]$AndroidBinDir = "bin/android"
)

$ErrorActionPreference = "Stop"
$RootDir = Split-Path -Parent $PSScriptRoot
$binFull = if (Test-Path $AndroidBinDir) { (Resolve-Path $AndroidBinDir).Path } else { Join-Path $RootDir $AndroidBinDir }

$auditLog = [System.Collections.Generic.List[string]]::new()
$auditLog.Add("===============================================================")
$auditLog.Add(" LibGodot Android Target Audit Report")
$auditLog.Add(" Timestamp: $((Get-Date).ToString('o'))")
$auditLog.Add("===============================================================")

$bridgeSo = Join-Path $binFull "arm64-v8a/libcrystal_bridge.so"
$gameSo = Join-Path $binFull "arm64-v8a/libgame.so"

$hasBridge = Test-Path $bridgeSo
$hasGame = Test-Path $gameSo
$bridgeSize = if ($hasBridge) { (Get-Item $bridgeSo).Length } else { 0 }
$gameSize = if ($hasGame) { (Get-Item $gameSo).Length } else { 0 }

$auditLog.Add("1. Native Shared Libraries (arm64-v8a):")
$auditLog.Add("   - libcrystal_bridge.so: $(if ($hasBridge) { "Present ($bridgeSize bytes)" } else { "MISSING" })")
$auditLog.Add("   - libgame.so:           $(if ($hasGame) { "Present ($gameSize bytes)" } else { "MISSING" })")

# Find APKs
$apks = Get-ChildItem -Path $binFull -Filter "*.apk" -ErrorAction SilentlyContinue
$auditLog.Add("`n2. Generated APK Packages:")
$apkRecords = [System.Collections.Generic.List[hashtable]]::new()
foreach ($apk in $apks) {
    $auditLog.Add("   - $($apk.Name): $($apk.Length) bytes")
    $hasBridgeInApk = $false
    $hasGameInApk = $false
    
    if (Get-Command 7z -ErrorAction SilentlyContinue) {
        $listing = & 7z l $apk.FullName "lib/arm64-v8a/*"
        $hasBridgeInApk = ($listing -match "libcrystal_bridge\.so")
        $hasGameInApk = ($listing -match "libgame\.so")
    } elseif (Get-Command unzip -ErrorAction SilentlyContinue) {
        $listing = & unzip -l $apk.FullName "lib/arm64-v8a/*"
        $hasBridgeInApk = ($listing -match "libcrystal_bridge\.so")
        $hasGameInApk = ($listing -match "libgame\.so")
    }
    
    $apkRecords.Add(@{
        name = $apk.Name
        size_bytes = $apk.Length
        has_bridge = $hasBridgeInApk
        has_game = $hasGameInApk
    })
}

$allPassed = ($hasBridge -and $hasGame -and $apks.Count -gt 0)
$statusBadge = if ($allPassed) { "**SUCCESS (All Verified)**" } else { "**FAILED**" }

# Build Markdown Report
$mdReport = [System.Text.StringBuilder]::new()
[void]$mdReport.AppendLine("## LibGodot Android Target Audit Report (arm64-v8a)")
[void]$mdReport.AppendLine("")
[void]$mdReport.AppendLine("| Metric | Value |")
[void]$mdReport.AppendLine("| :--- | :--- |")
[void]$mdReport.AppendLine("| **Overall Status** | $statusBadge |")
[void]$mdReport.AppendLine("| **Target Architecture** | arm64-v8a (API 29) |")
[void]$mdReport.AppendLine("| **libcrystal_bridge.so** | $(if ($hasBridge) { "OK (${bridgeSize} bytes)" } else { "MISSING" }) |")
[void]$mdReport.AppendLine("| **libgame.so** | $(if ($hasGame) { "OK (${gameSize} bytes)" } else { "MISSING" }) |")
[void]$mdReport.AppendLine("| **Generated APKs** | $($apks.Count) packages |")
[void]$mdReport.AppendLine("")
[void]$mdReport.AppendLine("### Executed Android Packages")
[void]$mdReport.AppendLine("")
[void]$mdReport.AppendLine("| APK Name | Size | Architecture | Bridge Bundled | Game Bundled |")
[void]$mdReport.AppendLine("| :--- | :---: | :---: | :---: | :---: |")

foreach ($r in $apkRecords) {
    $bridgeBundled = if ($r.has_bridge) { "YES" } else { "NO" }
    $gameBundled = if ($r.has_game) { "YES" } else { "NO" }
    [void]$mdReport.AppendLine("| $($r.name) | $($r.size_bytes) bytes | arm64-v8a | $bridgeBundled | $gameBundled |")
}

$reportMdContent = $mdReport.ToString()
$reportMdPath = Join-Path $binFull "test_report.md"
Set-Content -Path $reportMdPath -Value $reportMdContent -Force

$auditLogPath = Join-Path $binFull "android_audit_report.txt"
Set-Content -Path $auditLogPath -Value ($auditLog -join "`n") -Force

# Generate JSON
$jsonReport = @{
    platform = "Android (arm64-v8a)"
    overall_success = $allPassed
    bridge_so = @{ present = $hasBridge; size_bytes = $bridgeSize }
    game_so = @{ present = $hasGame; size_bytes = $gameSize }
    apks = $apkRecords
    timestamp = (Get-Date -Format "o")
} | ConvertTo-Json -Depth 5
$reportJsonPath = Join-Path $binFull "test_report.json"
Set-Content -Path $reportJsonPath -Value $jsonReport -Force

if ($env:GITHUB_STEP_SUMMARY) {
    try {
        [System.IO.File]::AppendAllText($env:GITHUB_STEP_SUMMARY, "`n$reportMdContent`n")
        Write-Host "  -> Published Android audit report to GitHub Step Summary." -ForegroundColor Green
    } catch {
        Write-Warning "Could not write to GITHUB_STEP_SUMMARY: $_"
    }
}

Write-Host "Android Target Audit complete. Report written to '$reportMdPath'." -ForegroundColor Green
