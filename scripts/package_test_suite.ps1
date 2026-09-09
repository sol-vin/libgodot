param(
    [string]$TargetDir = "bin",
    [string]$Platform = "",
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

$testDir = Join-Path $rootDir "test"
$testBinDir = Join-Path $testDir "bin"

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

$zipFileName = "tests-$platformName.zip"
$targetFullDir = if ([System.IO.Path]::IsPathRooted($TargetDir)) { $TargetDir } else { Join-Path $rootDir $TargetDir }
if (-not (Test-Path $targetFullDir)) {
    New-Item -ItemType Directory -Force -Path $targetFullDir | Out-Null
}
$zipFilePath = Join-Path $targetFullDir $zipFileName

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "       Packaging Standalone Test Suite: $zipFileName            " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Platform:   $platformName"
Write-Host "Target:     $zipFilePath"
Write-Host "Source:     $testDir"

# 3. Ensure test standalone executable and libraries are compiled
$pkgScript = Join-Path $rootDir "scripts/package_game.ps1"
if (-not (Test-Path $pkgScript)) {
    throw "package_game.ps1 not found at $pkgScript"
}

Write-Host "`n[1/4] Ensuring test suite standalone executable is built..." -ForegroundColor Cyan
if ($Release -eq "1" -or $Release -eq "true") {
    & $pkgScript -ProjectPath $testDir -Name "tests" -Release 1 -ForceCompile
} else {
    & $pkgScript -ProjectPath $testDir -Name "tests" -ForceCompile
}

# 4. Assemble clean staging directory
$stagingDir = Join-Path $targetFullDir "tests-$platformName-stage"
if (Test-Path $stagingDir) {
    Remove-Item $stagingDir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $stagingDir | Out-Null

Write-Host "`n[2/4] Assembling standalone test suite package..." -ForegroundColor Cyan

# Copy standalone executable(s)
$testExe = Join-Path $testBinDir "tests$exeExt"
if (-not (Test-Path $testExe)) {
    $testExe = Join-Path $testBinDir "game$exeExt"
}
if (-not (Test-Path $testExe)) {
    throw "Standalone test executable not found in $testBinDir"
}

Copy-Item $testExe (Join-Path $stagingDir "tests$exeExt") -Force
if ($onWindows) {
    $consoleExe = Join-Path $testBinDir "tests.console.exe"
    if (Test-Path $consoleExe) {
        Copy-Item $consoleExe (Join-Path $stagingDir "tests.console.exe") -Force
    }
}

$isTargetWindows = ($platformName -eq "windows")
$isTargetMac = ($platformName -eq "macos")
$isTargetLinux = ($platformName -eq "linux")
$targetLibFilter = if ($isTargetWindows) { "*.dll" } elseif ($isTargetMac) { "*.dylib" } else { "*.so*" }

# Copy dynamic libraries matching the target platform to root and bin/ of package
$stageBinDir = Join-Path $stagingDir "bin"
if (-not (Test-Path $stageBinDir)) { New-Item -ItemType Directory -Force -Path $stageBinDir | Out-Null }

$binCandidates = Get-ChildItem -Path $testBinDir -File | Where-Object {
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

# Source project files (project.godot, scenes, scripts, export_presets.cfg) are omitted
# as they are already compiled into tests.pck / tests.console.pck.

# Copy .godot configuration with extension_list.cfg
$stageGodot = Join-Path $stagingDir ".godot"
if (-not (Test-Path $stageGodot)) { New-Item -ItemType Directory -Force -Path $stageGodot | Out-Null }
$extList = Join-Path $testDir ".godot/extension_list.cfg"
if (Test-Path $extList) {
    Copy-Item $extList (Join-Path $stageGodot "extension_list.cfg") -Force
}

# Copy addons with strictly target platform binaries
$stageAddons = Join-Path $stagingDir "addons"
if (-not (Test-Path $stageAddons)) { New-Item -ItemType Directory -Force -Path $stageAddons | Out-Null }
New-Item -ItemType File -Force -Path (Join-Path $stageAddons ".gdignore") | Out-Null

$testAddons = Join-Path $testDir "addons"
if (Test-Path $testAddons) {
    foreach ($addonDir in Get-ChildItem -Path $testAddons -Directory) {
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

# Ensure crystal_integration and dummy addon bins have required runtime libraries for the target platform
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
    $srcLib = Join-Path $testBinDir $lib
    if (Test-Path $srcLib) {
        Copy-Item $srcLib (Join-Path $stageIntegrationBin $lib) -Force -ErrorAction SilentlyContinue
    }
}

foreach ($dummyName in @("dummy_audio", "dummy_dialogue", "dummy_inventory")) {
    $dummyBin = Join-Path $stageAddons "$dummyName/bin"
    if (Test-Path $dummyBin) {
        foreach ($lib in $requiredPlatformLibs) {
            $srcLib = Join-Path $testBinDir $lib
            if (Test-Path $srcLib) {
                Copy-Item $srcLib (Join-Path $dummyBin $lib) -Force -ErrorAction SilentlyContinue
            }
        }
    }
}

# Ensure execution permissions on Unix
if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
    & chmod +x (Join-Path $stagingDir "tests$exeExt")
    & chmod +x (Join-Path $stagingDir "game$exeExt")
}

# Clean any temporary shadow DLLs from staging
Get-ChildItem -Path $stagingDir -Filter "*_loaded_*" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

# 5. Verify the packaged standalone executable runs with --autorun
if (-not $SkipVerify) {
    Write-Host "`n[3/4] Verifying packaged standalone executable (tests$exeExt --autorun)..." -ForegroundColor Cyan
    $runExe = Join-Path $stagingDir "tests$exeExt"
    if ($onWindows) {
        $consoleExe = Join-Path $stagingDir "tests.console.exe"
        if (Test-Path $consoleExe) {
            $runExe = $consoleExe
        }
    }
    $verifyPassMarker1 = Join-Path $stagingDir "bin/.runtime_tests_passed"
    $verifyPassMarker2 = Join-Path $stagingDir ".runtime_tests_passed"
    $verifyFailMarker1 = Join-Path $stagingDir "bin/.runtime_tests_failed"
    $verifyFailMarker2 = Join-Path $stagingDir ".runtime_tests_failed"
    foreach ($m in @($verifyPassMarker1, $verifyPassMarker2, $verifyFailMarker1, $verifyFailMarker2)) {
        if (Test-Path $m) { Remove-Item $m -Force }
    }

    $testArgs = @("--headless", "--rendering-driver", "opengl3", "--quit-after", "15", "--", "--autorun")
    
    Push-Location $stagingDir
    try {
        if ($onWindows) {
            $argStr = ($testArgs | ForEach-Object { if ($_ -match '\s') { "`"$_`"" } else { $_ } }) -join ' '
            cmd /c "`"$runExe`" $argStr" | Out-Host
            $runExit = $LASTEXITCODE
        } else {
            & $runExe $testArgs | Out-Host
            $runExit = $LASTEXITCODE
        }
    } finally {
        Pop-Location
    }

    if ($runExit -ne 0) {
        Write-Warning "Packaged test executable exited with code $runExit"
    }
    if ((Test-Path $verifyFailMarker1) -or (Test-Path $verifyFailMarker2)) {
        $failFile = if (Test-Path $verifyFailMarker1) { $verifyFailMarker1 } else { $verifyFailMarker2 }
        $failText = Get-Content $failFile -Raw
        throw "Packaged standalone test suite execution reported failures:`n$failText"
    }
    Write-Host "  [OK] Packaged standalone test suite verified successfully with --autorun!" -ForegroundColor Green
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
Write-Host "  SUCCESS: Standalone Test Suite Packaged Successfully!           " -ForegroundColor Green
Write-Host "  File: $zipFilePath ($zipSizeMb MB)                             " -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Green
exit 0
