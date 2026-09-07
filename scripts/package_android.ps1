param(
    [string]$ProjectPath = "template",
    [string]$Name = "",
    [string]$Entry = "",
    [switch]$Release,
    [string]$Output = "",
    [switch]$AdbInstall,
    [switch]$AdbRun
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $PSScriptRoot
$projFull = (Resolve-Path (Join-Path $RootDir $ProjectPath)).Path

if (-not $Name) {
    $Name = Split-Path -Leaf $projFull
}

if (-not $Output) {
    $androidBinDir = Join-Path $RootDir "bin/android"
    if (-not (Test-Path $androidBinDir)) {
        New-Item -ItemType Directory -Force -Path $androidBinDir | Out-Null
    }
    $Output = Join-Path $androidBinDir "$Name.apk"
}

$outputFull = [System.IO.Path]::GetFullPath($Output)
$outputDir = Split-Path -Parent $outputFull
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " LibGodot - Packaging Android APK" -ForegroundColor Cyan
Write-Host " Target Project: $projFull" -ForegroundColor Cyan
Write-Host " Godot Version : 4.8-dev4" -ForegroundColor Cyan
Write-Host " Output APK    : $outputFull" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Compile Android binaries (libcrystal_bridge.so & libgame.so)
$buildScript = Join-Path $RootDir "scripts/build_android.ps1"
$buildArgs = @{
    ProjectPath = $ProjectPath
}
if ($Entry) { $buildArgs["Entry"] = $Entry }
if ($Release) { $buildArgs["Release"] = "1" }

Write-Host "[PackageAndroid] Compiling native Android binaries via build_android.ps1..." -ForegroundColor Cyan
& $buildScript @buildArgs

# 2. Ensure export_presets.cfg exists in project
$presetCfg = Join-Path $projFull "export_presets.cfg"
if (-not (Test-Path $presetCfg)) {
    $templatePresets = Join-Path $RootDir "template/export_presets.cfg"
    if (Test-Path $templatePresets) {
        Copy-Item $templatePresets $presetCfg -Force
        Write-Host "  -> Copied export_presets.cfg from template to $projFull" -ForegroundColor Gray
    }
}

# 3. Locate Godot 4.8 executable
$godotExe = Join-Path $RootDir "godot.exe"
if (-not (Test-Path $godotExe)) {
    $godotLinux = Join-Path $RootDir "godot"
    if (Test-Path $godotLinux) {
        $godotExe = $godotLinux
    } elseif (Get-Command godot -ErrorAction SilentlyContinue) {
        $godotExe = (Get-Command godot).Source
    } elseif ($env:GODOT4) {
        $godotExe = $env:GODOT4
    }
}
if (-not (Test-Path $godotExe)) {
    throw "[PackageAndroid] Godot executable not found at '$godotExe'."
}

# 4. Check Godot 4.8-dev4 export template
$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$templateBase = if ($onWindows) {
    Join-Path $env:APPDATA "Godot/export_templates"
} else {
    $userHome = if ($env:HOME) { $env:HOME } else { [System.Environment]::GetFolderPath('UserProfile') }
    Join-Path $userHome ".local/share/godot/export_templates"
}
$template48Dir = Join-Path $templateBase "4.8.dev4"
$debugApkTemplate = Join-Path $template48Dir "android_debug.apk"
$releaseApkTemplate = Join-Path $template48Dir "android_release.apk"

if (Test-Path $debugApkTemplate) {
    Write-Host "  -> Found Godot 4.8-dev4 Android export templates at $template48Dir" -ForegroundColor Green
} else {
    Write-Warning "[PackageAndroid] Godot 4.8-dev4 Android template not found at $template48Dir. Godot will attempt auto-discovery."
}

# Ensure Android debug keystore exists
$keystoreDir = if ($onWindows) {
    Join-Path $env:USERPROFILE ".android"
} else {
    $userHome = if ($env:HOME) { $env:HOME } else { [System.Environment]::GetFolderPath('UserProfile') }
    Join-Path $userHome ".android"
}
$debugKeystore = Join-Path $keystoreDir "debug.keystore"
if (-not (Test-Path $debugKeystore)) {
    if (-not (Test-Path $keystoreDir)) {
        New-Item -ItemType Directory -Force -Path $keystoreDir | Out-Null
    }
    if (Get-Command keytool -ErrorAction SilentlyContinue) {
        Write-Host "  -> Generating debug keystore at '$debugKeystore'..." -ForegroundColor Gray
        & keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore $debugKeystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999
    }
}

# Ensure cmake directory check for Godot 4.8 AndroidSDKManager
if ($env:ANDROID_HOME -and (Test-Path (Join-Path $env:ANDROID_HOME "cmake"))) {
    $cmakeDir = Join-Path $env:ANDROID_HOME "cmake"
    $targetCmake = Join-Path $cmakeDir "3.22.1"
    if (-not (Test-Path $targetCmake)) {
        $anyCmake = Get-ChildItem -Path $cmakeDir -Directory -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($anyCmake) {
            Copy-Item -Path $anyCmake.FullName -Destination $targetCmake -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

# 5. Remove existing output APK if present
if (Test-Path $outputFull) {
    Remove-Item $outputFull -Force -ErrorAction SilentlyContinue
}

# 6. Execute Godot headless export
$exportMode = if ($Release) { "--export-release" } else { "--export-debug" }
Write-Host "[PackageAndroid] Exporting APK with Godot ($exportMode 'Android')..." -ForegroundColor Cyan

$godotProc = Start-Process -FilePath $godotExe -ArgumentList @(
    "--headless",
    "--path", "`"$projFull`"",
    $exportMode, "Android",
    "`"$outputFull`""
) -NoNewWindow -Wait -PassThru

if ($godotProc.ExitCode -ne 0 -or -not (Test-Path $outputFull)) {
    throw "[PackageAndroid] Godot export failed with exit code $($godotProc.ExitCode)."
}

$apkSize = (Get-Item $outputFull).Length
Write-Host "  [OK] Successfully created APK: '$outputFull' ($apkSize bytes)!" -ForegroundColor Green

# 7. Validate APK contents using 7-Zip
if (Get-Command 7z -ErrorAction SilentlyContinue) {
    Write-Host "[PackageAndroid] Inspecting APK native library contents..." -ForegroundColor Cyan
    $zipInspect = & 7z l $outputFull "lib/arm64-v8a/*"
    $hasBridge = $zipInspect -match "libcrystal_bridge\.so"
    $hasGame = $zipInspect -match "libgame\.so"
    
    if ($hasBridge -and $hasGame) {
        Write-Host "  [VERIFIED] Both libcrystal_bridge.so and libgame.so are present in APK lib/arm64-v8a/!" -ForegroundColor Green
    } else {
        Write-Warning "[PackageAndroid] Missing expected .so files in APK lib/arm64-v8a/. Contents:`n$($zipInspect -join "`n")"
    }
}

# 8. Optional ADB deployment
if ($AdbInstall -or $AdbRun) {
    if (Get-Command adb -ErrorAction SilentlyContinue) {
        Write-Host "[PackageAndroid] Deploying to connected Android device..." -ForegroundColor Cyan
        $devs = & adb devices
        Write-Host "$($devs -join "`n")" -ForegroundColor Gray
        
        Write-Host "  -> Installing APK: adb install -r '$outputFull'..." -ForegroundColor Cyan
        & adb install -r $outputFull
        
        if ($AdbRun) {
            Write-Host "  -> Launching game..." -ForegroundColor Cyan
            & adb shell am start -n "org.godotengine.crystalgame/com.godot.game.GodotApp"
        }
    } else {
        Write-Warning "[PackageAndroid] adb not found in PATH. Skipping device install."
    }
}

Write-Host "============================================================" -ForegroundColor Green
Write-Host " Android packaging complete!" -ForegroundColor Green
Write-Host " APK: $outputFull" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
