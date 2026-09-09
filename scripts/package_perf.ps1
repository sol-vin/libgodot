# =============================================================================
# LibGodot Standalone Performance Benchmark Packager
# =============================================================================
# Builds and packages the standalone LibGodot performance stress benchmark
# into a self-contained, redistributable archive: perf-<platform>.zip
# =============================================================================

param(
    [string]$TargetDir = "bin",
    [string]$Platform = "",
    [string]$ArchiveName = "",
    [string]$Release = "",
    [switch]$SkipVerify,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

# 1. Locate root directory and paths
$curr = $PSScriptRoot
$rootDir = ""
while ($curr) {
    if ((Test-Path (Join-Path $curr "shard.yml")) -and (Test-Path (Join-Path $curr "src/libgodot.cr"))) {
        $rootDir = $curr
        break
    }
    $parent = Split-Path -Parent $curr
    if ($parent -eq $curr) { break }
    $curr = $parent
}
if (-not $rootDir) {
    $rootDir = Split-Path -Parent $PSScriptRoot
}

$perfDir = Join-Path $rootDir "performance"
$perfBinDir = Join-Path $perfDir "bin"

# 2. Determine platform and extension conventions
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

$detectedPlatform = if ($onWindows) { "windows" } elseif ($isMac) { "macos" } else { "linux" }
$platformName = if ($Platform) { $Platform.ToLower() } else { $detectedPlatform }

$exeExt = if ($onWindows) { ".exe" } else { "" }
$soExt = if ($onWindows) { "dll" } elseif ($isMac) { "dylib" } else { "so" }

$zipFileName = if ($ArchiveName) { $ArchiveName } else { "perf-$platformName.zip" }
$targetFullDir = if ([System.IO.Path]::IsPathRooted($TargetDir)) { $TargetDir } else { Join-Path $rootDir $TargetDir }
if (-not (Test-Path $targetFullDir)) {
    New-Item -ItemType Directory -Force -Path $targetFullDir | Out-Null
}
$zipFilePath = Join-Path $targetFullDir $zipFileName

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "   Packaging Standalone Performance Benchmark: $zipFileName     " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Platform:   $platformName"
Write-Host "Target:     $zipFilePath"
Write-Host "Source:     $perfDir"

# 3. Ensure performance benchmark executable and libraries are compiled
$pkgScript = Join-Path $rootDir "scripts/package_game.ps1"
if (-not (Test-Path $pkgScript)) {
    throw "package_game.ps1 not found at $pkgScript"
}

Write-Host "`n[1/4] Ensuring performance benchmark executable is built..." -ForegroundColor Cyan
if ($Release -eq "1" -or $Release -eq "true") {
    & $pkgScript -ProjectPath $perfDir -Name "perf" -Release 1 -ForceCompile
} else {
    & $pkgScript -ProjectPath $perfDir -Name "perf" -ForceCompile
}

# 4. Assemble clean staging directory
$stagingDir = Join-Path $targetFullDir "perf-$platformName-stage"
if (Test-Path $stagingDir) {
    Remove-Item $stagingDir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $stagingDir | Out-Null

Write-Host "`n[2/4] Assembling standalone benchmark package..." -ForegroundColor Cyan

# Copy standalone executable(s)
$perfExe = Join-Path $perfBinDir "perf$exeExt"
if (-not (Test-Path $perfExe)) {
    $perfExe = Join-Path $perfBinDir "game$exeExt"
}
if (-not (Test-Path $perfExe)) {
    throw "Standalone performance executable not found in $perfBinDir"
}

Copy-Item $perfExe (Join-Path $stagingDir "perf$exeExt") -Force
if ($onWindows) {
    $consoleExe = Join-Path $perfBinDir "perf.console.exe"
    if (Test-Path $consoleExe) {
        Copy-Item $consoleExe (Join-Path $stagingDir "perf.console.exe") -Force
    }
}

$isTargetWindows = ($platformName -eq "windows")
$isTargetMac = ($platformName -eq "macos")
$isTargetLinux = ($platformName -eq "linux")
$targetLibFilter = if ($isTargetWindows) { "*.dll" } elseif ($isTargetMac) { "*.dylib" } else { "*.so*" }

# Copy dynamic libraries and pcks matching the target platform to root and bin/ of package
$stageBinDir = Join-Path $stagingDir "bin"
if (-not (Test-Path $stageBinDir)) { New-Item -ItemType Directory -Force -Path $stageBinDir | Out-Null }

$binCandidates = Get-ChildItem -Path $perfBinDir -File | Where-Object {
    (($_.Name -like $targetLibFilter) -or ($_.Name -like "*.pck")) -and ($_.Name -notmatch '^game\.(exe|console\.exe|pck|console\.pck)')
}
foreach ($lib in $binCandidates) {
    if ($lib.Name -notlike "*_loaded_*") {
        Copy-Item $lib.FullName $stagingDir -Force
        Copy-Item $lib.FullName $stageBinDir -Force
    }
}
New-Item -ItemType File -Force -Path (Join-Path $stageBinDir ".gdignore") | Out-Null
New-Item -ItemType File -Force -Path (Join-Path $stagingDir ".gdignore") | Out-Null

# Copy .godot configuration with extension_list.cfg
$stageGodot = Join-Path $stagingDir ".godot"
if (-not (Test-Path $stageGodot)) { New-Item -ItemType Directory -Force -Path $stageGodot | Out-Null }
$extList = Join-Path $perfDir ".godot/extension_list.cfg"
if (Test-Path $extList) {
    Copy-Item $extList (Join-Path $stageGodot "extension_list.cfg") -Force
}

# Copy addons with strictly target platform binaries
$stageAddons = Join-Path $stagingDir "addons"
if (-not (Test-Path $stageAddons)) { New-Item -ItemType Directory -Force -Path $stageAddons | Out-Null }
New-Item -ItemType File -Force -Path (Join-Path $stageAddons ".gdignore") | Out-Null

$perfAddons = Join-Path $perfDir "addons"
if (Test-Path $perfAddons) {
    foreach ($addonDir in Get-ChildItem -Path $perfAddons -Directory) {
        $addonStage = Join-Path $stageAddons $addonDir.Name
        $addonBinSrc = Join-Path $addonDir.FullName "bin"
        if (Test-Path $addonBinSrc) {
            $addonBinDest = Join-Path $addonStage "bin"
            if (-not (Test-Path $addonBinDest)) {
                New-Item -ItemType Directory -Force -Path $addonBinDest | Out-Null
            }
            Get-ChildItem -Path $addonBinSrc -Filter $targetLibFilter -File -ErrorAction SilentlyContinue | ForEach-Object {
                Copy-Item $_.FullName (Join-Path $addonBinDest $_.Name) -Force -ErrorAction SilentlyContinue
            }
        }
        foreach ($metaFile in @("plugin.cfg", "plugin.gd", "$($addonDir.Name).gdextension")) {
            $srcMeta = Join-Path $addonDir.FullName $metaFile
            if (Test-Path $srcMeta) {
                Copy-Item $srcMeta (Join-Path $addonStage $metaFile) -Force -ErrorAction SilentlyContinue
            }
        }
    }
}

# Ensure crystal_integration has required runtime libraries for the target platform
$requiredPlatformLibs = if ($isTargetWindows) {
    @("crystal_bridge.dll", "gc.dll", "iconv-2.dll", "pcre2-8.dll", "libgodot.dll")
} elseif ($isTargetMac) {
    @("crystal_bridge.dylib", "libgodot.dylib")
} else {
    @("crystal_bridge.so", "libgodot.so")
}

$stageIntegrationBin = Join-Path $stageAddons "crystal_integration/bin"
if (-not (Test-Path $stageIntegrationBin)) { New-Item -ItemType Directory -Force -Path $stageIntegrationBin | Out-Null }
foreach ($lib in $requiredPlatformLibs) {
    $srcLib = Join-Path $perfBinDir $lib
    if (Test-Path $srcLib) {
        Copy-Item $srcLib (Join-Path $stageIntegrationBin $lib) -Force -ErrorAction SilentlyContinue
    }
}

# Ensure execution permissions on Unix
if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
    & chmod +x (Join-Path $stagingDir "perf$exeExt")
    & chmod +x (Join-Path $stagingDir "game$exeExt")
}

# Clean any temporary shadow DLLs from staging
Get-ChildItem -Path $stagingDir -Filter "*_loaded_*" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

# 5. Verify the packaged standalone executable runs with short test
if (-not $SkipVerify) {
    Write-Host "`n[3/4] Verifying packaged standalone benchmark executable..." -ForegroundColor Cyan
    $runExe = Join-Path $stagingDir "perf$exeExt"
    if ($onWindows) {
        $consoleExe = Join-Path $stagingDir "perf.console.exe"
        if (Test-Path $consoleExe) {
            $runExe = $consoleExe
        }
    }

    $benchArgs = @("--headless", "--rendering-driver", "opengl3", "--quit-after", "5", "--", "--test=node_churn", "--duration=1")
    
    Push-Location $stagingDir
    try {
        if ($onWindows) {
            $argStr = ($benchArgs | ForEach-Object { if ($_ -match '\s') { "`"$_`"" } else { $_ } }) -join ' '
            cmd /c "`"$runExe`" $argStr" | Out-Host
            $runExit = $LASTEXITCODE
        } else {
            & $runExe $benchArgs | Out-Host
            $runExit = $LASTEXITCODE
        }
    } finally {
        Pop-Location
    }

    if ($runExit -ne 0) {
        Write-Warning "Packaged benchmark executable exited with code $runExit"
    } else {
        Write-Host "  [OK] Packaged standalone performance benchmark verified successfully!" -ForegroundColor Green
    }
} else {
    Write-Host "`n[3/4] Skipping verification (--SkipVerify specified)..." -ForegroundColor Yellow
}

# 6. Compress staging folder into zip archive
Write-Host "`n[4/4] Creating ZIP archive: $zipFilePath..." -ForegroundColor Cyan
if (Test-Path $zipFilePath) {
    Remove-Item $zipFilePath -Force
}

$compressSuccess = $false
if ($onWindows -or (Get-Command Compress-Archive -ErrorAction SilentlyContinue)) {
    try {
        Compress-Archive -Path "$stagingDir/*" -DestinationPath $zipFilePath -Force
        $compressSuccess = $true
    } catch {
        Write-Warning "Compress-Archive failed: $_. Attempting zip command..."
    }
}

if (-not $compressSuccess -and (Get-Command zip -ErrorAction SilentlyContinue)) {
    Push-Location $stagingDir
    try {
        & zip -r -q $zipFilePath *
        $compressSuccess = $true
    } finally {
        Pop-Location
    }
}

if (-not (Test-Path $zipFilePath)) {
    throw "Failed to create zip archive at $zipFilePath"
}

# Clean staging directory
Remove-Item $stagingDir -Recurse -Force -ErrorAction SilentlyContinue

$zipItem = Get-Item $zipFilePath
$zipSizeMb = [math]::Round($zipItem.Length / 1MB, 2)
Write-Host "`n=================================================================" -ForegroundColor Green
Write-Host "  SUCCESS: Standalone Performance Benchmark Packaged!            " -ForegroundColor Green
Write-Host "  File: $zipFilePath ($zipSizeMb MB)                             " -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Green
exit 0
