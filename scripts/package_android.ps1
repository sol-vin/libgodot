param(
    [string]$ProjectPath = "template",
    [string]$Name = "",
    [string]$Entry = "",
    [switch]$Release,
    [string]$Output = "",
    [string]$Keystore = "",
    [string]$KeystoreAlias = "",
    [string]$KeystorePassword = "",
    [switch]$RandomKeystore,
    [switch]$AdbInstall,
    [switch]$AdbRun
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $PSScriptRoot
$projFull = if ([System.IO.Path]::IsPathRooted($ProjectPath)) {
    (Resolve-Path $ProjectPath).Path
} else {
    (Resolve-Path (Join-Path $RootDir $ProjectPath)).Path
}

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
Write-Host " Mode          : $(if ($Release) { 'Release' } else { 'Debug' })" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Compile Android binaries (libcrystal_bridge.so & libgame.so)
$buildScript = Join-Path $RootDir "scripts/build_android.ps1"
$buildArgs = @{
    ProjectPath = $projFull
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

# Ensure project has icon.svg so Godot Android export doesn't warn/error
$projIcon = Join-Path $projFull "icon.svg"
if (-not (Test-Path $projIcon)) {
    $templateIcon = Join-Path $RootDir "template/icon.svg"
    $templateImport = Join-Path $RootDir "template/icon.svg.import"
    if (Test-Path $templateIcon) {
        Copy-Item $templateIcon $projIcon -Force
        if (Test-Path $templateImport) {
            Copy-Item $templateImport (Join-Path $projFull "icon.svg.import") -Force
        }
        Write-Host "  -> Copied icon.svg to $projFull" -ForegroundColor Gray
    }
}
$projGodot = Join-Path $projFull "project.godot"
if (Test-Path $projGodot) {
    $godotContent = Get-Content $projGodot -Raw
    if ($godotContent -notmatch 'config/icon\s*=') {
        $godotContent = $godotContent -replace '(\[application\][\r\n]+)', "`$1config/icon=`"res://icon.svg`"`n"
        Set-Content -Path $projGodot -Value $godotContent -NoNewline
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

# 5. Ensure host GDExtension bridge exists so headless Godot can load the project during export
$hostBridgeName = if ($onWindows) { "crystal_bridge.dll" } else { "crystal_bridge.so" }
$hostBridgePath = Join-Path $projFull "bin/$hostBridgeName"
if (-not (Test-Path $hostBridgePath)) {
    $rootBridgePath = Join-Path $RootDir "bin/$hostBridgeName"
    if (-not (Test-Path $rootBridgePath)) {
        $hostCxx = if (Get-Command g++ -ErrorAction SilentlyContinue) { "g++" } elseif (Get-Command clang++ -ErrorAction SilentlyContinue) { "clang++" } else { "" }
        if ($hostCxx) {
            Write-Host "  -> Compiling host bridge for headless export: '$rootBridgePath'..." -ForegroundColor Gray
            $bridgeSrc = Join-Path $RootDir "src/bridge/crystal_bridge.cpp"
            $rsrcDir = Join-Path $RootDir "rsrc"
            if ($onWindows) {
                & $hostCxx -std=c++17 -O2 -shared -I $rsrcDir $bridgeSrc -o $rootBridgePath
            } else {
                & $hostCxx -std=c++17 -O2 -fPIC -shared -I $rsrcDir $bridgeSrc -o $rootBridgePath -ldl
            }
        }
    }
    $syncScript = Join-Path $RootDir "scripts/sync_bins.ps1"
    if (Test-Path $syncScript) { & $syncScript }
}

# 6. Keystore Resolution and Configuration (via manage_keystore.ps1)
# If no keystore exists, manage_keystore.ps1 automatically creates a totally random one.
$manageKeystoreScript = Join-Path $RootDir "scripts/manage_keystore.ps1"
$keystoreDir = if ($onWindows) {
    Join-Path $env:USERPROFILE ".android"
} else {
    $userHome = if ($env:HOME) { $env:HOME } else { [System.Environment]::GetFolderPath('UserProfile') }
    Join-Path $userHome ".android"
}

$targetKeystore = $Keystore
if (-not $targetKeystore) {
    if ($Release) {
        $targetKeystore = if ($env:GODOT_ANDROID_KEYSTORE_RELEASE_PATH) {
            $env:GODOT_ANDROID_KEYSTORE_RELEASE_PATH
        } else {
            Join-Path $keystoreDir "release.keystore"
        }
    } else {
        $targetKeystore = if ($env:GODOT_ANDROID_KEYSTORE_DEBUG_PATH) {
            $env:GODOT_ANDROID_KEYSTORE_DEBUG_PATH
        } else {
            Join-Path $keystoreDir "debug.keystore"
        }
    }
}

$keystoreAction = if ($RandomKeystore -or (-not (Test-Path $targetKeystore))) {
    "Create"
} else {
    "GetOrCreate"
}

$ksParams = @{
    Action   = $keystoreAction
    Path     = $targetKeystore
    PassThru = $true
}
if ($RandomKeystore -or (-not (Test-Path $targetKeystore))) {
    $ksParams["Random"] = $true
}
if ($KeystoreAlias) { $ksParams["Alias"] = $KeystoreAlias }
if ($KeystorePassword) { $ksParams["Password"] = $KeystorePassword }

Write-Host "[PackageAndroid] Resolving Android signing keystore..." -ForegroundColor Cyan
$ks = & $manageKeystoreScript @ksParams

if ($Release) {
    $env:GODOT_ANDROID_KEYSTORE_RELEASE_PATH = $ks.KeystorePath
    $env:GODOT_ANDROID_KEYSTORE_RELEASE_USER = $ks.Alias
    $env:GODOT_ANDROID_KEYSTORE_RELEASE_PASSWORD = $ks.Password
    Write-Host "  -> Configured Godot release signing:" -ForegroundColor Green
    Write-Host "       Keystore: $($ks.KeystorePath)" -ForegroundColor Green
    Write-Host "       Alias:    $($ks.Alias)" -ForegroundColor Green
    Write-Host "       SHA-256:  $($ks.FingerprintSha256)" -ForegroundColor Green
} else {
    $env:GODOT_ANDROID_KEYSTORE_DEBUG_PATH = $ks.KeystorePath
    $env:GODOT_ANDROID_KEYSTORE_DEBUG_USER = $ks.Alias
    $env:GODOT_ANDROID_KEYSTORE_DEBUG_PASSWORD = $ks.Password
    Write-Host "  -> Configured Godot debug signing:" -ForegroundColor Green
    Write-Host "       Keystore: $($ks.KeystorePath)" -ForegroundColor Green
    Write-Host "       Alias:    $($ks.Alias)" -ForegroundColor Green
    Write-Host "       SHA-256:  $($ks.FingerprintSha256)" -ForegroundColor Green
}

# 7. Ensure cmake directory check for Godot 4.8 AndroidSDKManager
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

# 8. Remove existing output APK if present
if (Test-Path $outputFull) {
    Remove-Item $outputFull -Force -ErrorAction SilentlyContinue
}

# 9. Execute Godot headless export
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

# 10. Validate APK contents using 7-Zip
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

# 11. Decode APK signing certificate to verify signature
Write-Host "[PackageAndroid] Verifying signed APK certificate..." -ForegroundColor Cyan
& $manageKeystoreScript -Decode -Path $outputFull

# 12. Optional ADB deployment
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
