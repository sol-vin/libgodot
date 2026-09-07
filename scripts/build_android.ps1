param(
    [string]$ProjectPath = "test",
    [string]$Entry = "",
    [string]$Release = "",
    [string]$Abi = "arm64-v8a",
    [int]$ApiLevel = 29,
    [string]$NdkRoot = ""
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $PSScriptRoot
$projFull = (Resolve-Path (Join-Path $RootDir $ProjectPath)).Path

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " LibGodot - Android Cross-Compilation ($Abi / API $ApiLevel)" -ForegroundColor Cyan
Write-Host " Target Project: $projFull" -ForegroundColor Cyan
Write-Host " Godot Target  : 4.8-dev4" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan


# 1. Resolve Android NDK Root (preferred for Godot 4.8-dev4: NDK 29.x)
$resolvedNdk = $NdkRoot
if (-not $resolvedNdk -and $env:ANDROID_NDK_ROOT -and (Test-Path $env:ANDROID_NDK_ROOT)) {
    $resolvedNdk = $env:ANDROID_NDK_ROOT
}

if (-not $resolvedNdk) {
    $searchBases = @(
        $env:ANDROID_NDK_ROOT,
        $env:ANDROID_NDK_HOME,
        $env:ANDROID_NDK_LATEST_HOME,
        $env:ANDROID_HOME,
        $env:ANDROID_SDK_ROOT,
        (Join-Path $env:LOCALAPPDATA "Android/Sdk"),
        "C:\Android\Sdk",
        "C:\Users\Ian\AppData\Local\Android\Sdk",
        "/usr/local/lib/android/sdk",
        "/opt/android-sdk"
    )
    foreach ($base in $searchBases) {
        if (-not $base -or -not (Test-Path $base)) { continue }
        if (Test-Path (Join-Path $base "toolchains")) {
            $resolvedNdk = $base
            break
        }
        if (Test-Path (Join-Path $base "ndk")) {
            $ndkDir = Join-Path $base "ndk"
            $pref = Get-ChildItem -Path $ndkDir -Directory -Filter "29*" -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($pref) {
                $resolvedNdk = $pref.FullName
                break
            }
            $latest = Get-ChildItem -Path $ndkDir -Directory -ErrorAction SilentlyContinue | Sort-Object Name -Descending | Select-Object -First 1
            if ($latest) {
                $resolvedNdk = $latest.FullName
                break
            }
        }
    }
}

if (-not $resolvedNdk -or -not (Test-Path $resolvedNdk)) {
    throw "[BuildAndroid] Android NDK not found. Please set ANDROID_NDK_ROOT or install NDK via Android Studio / sdkmanager."
}

Write-Host "  -> Using Android NDK: $resolvedNdk" -ForegroundColor Green

# 2. Locate NDK LLVM Clang Toolchain
$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$hostTag = if ($onWindows) { "windows-x86_64" } else { "linux-x86_64" }
$llvmBin = Join-Path $resolvedNdk "toolchains/llvm/prebuilt/$hostTag/bin"

if (-not (Test-Path $llvmBin)) {
    throw "[BuildAndroid] NDK LLVM toolchain path not found at '$llvmBin'."
}

$targetTriple = "aarch64-linux-android"
$clangTarget = "$targetTriple$ApiLevel"

# Locate clang++ executable / cmd
$cxxCandidates = @(
    (Join-Path $llvmBin "$clangTarget-clang++.cmd"),
    (Join-Path $llvmBin "$clangTarget-clang++"),
    (Join-Path $llvmBin "clang++.exe"),
    (Join-Path $llvmBin "clang++")
)
$cxxExe = ""
foreach ($cand in $cxxCandidates) {
    if (Test-Path $cand) {
        $cxxExe = $cand
        break
    }
}

$ccCandidates = @(
    (Join-Path $llvmBin "$clangTarget-clang.cmd"),
    (Join-Path $llvmBin "$clangTarget-clang"),
    (Join-Path $llvmBin "clang.exe"),
    (Join-Path $llvmBin "clang")
)
$ccExe = ""
foreach ($cand in $ccCandidates) {
    if (Test-Path $cand) {
        $ccExe = $cand
        break
    }
}

if (-not $cxxExe) {
    throw "[BuildAndroid] Clang++ compiler not found in '$llvmBin'."
}
Write-Host "  -> Using C++ Compiler: $cxxExe" -ForegroundColor Green

# 3. Create Android output directories
$outDir = Join-Path $RootDir "bin/android/$Abi"
if (-not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Force -Path $outDir | Out-Null
}

$bridgeSo = Join-Path $outDir "libcrystal_bridge.so"
$gameSo = Join-Path $outDir "libgame.so"

# 4. Compile GDExtension C++ Loader Bridge (libcrystal_bridge.so)
Write-Host "[BuildAndroid] Compiling GDExtension bridge '$bridgeSo'..." -ForegroundColor Cyan
$bridgeSrc = Join-Path $RootDir "src/bridge/crystal_bridge.cpp"
$rsrcDir = Join-Path $RootDir "rsrc"

$cxxArgs = [System.Collections.Generic.List[string]]::new()
if ($cxxExe -like "*clang++*" -and $cxxExe -notlike "*$clangTarget*") {
    $cxxArgs.Add("--target=$clangTarget")
}
$cxxArgs.Add("-std=c++17")
$cxxArgs.Add("-O2")
$cxxArgs.Add("-fPIC")
$cxxArgs.Add("-shared")
$cxxArgs.Add("-D__ANDROID__=1")
$cxxArgs.Add("-DANDROID=1")
if ($Release -eq "1" -or $Release -eq "true") {
    $cxxArgs.Add("-DLIBGODOT_RELEASE=1")
    $cxxArgs.Add("-DNDEBUG")
}
$cxxArgs.Add("-I")
$cxxArgs.Add($rsrcDir)
$cxxArgs.Add($bridgeSrc)
$cxxArgs.Add("-o")
$cxxArgs.Add($bridgeSo)
$cxxArgs.Add("-ldl")
$cxxArgs.Add("-llog")

$proc = Start-Process -FilePath $cxxExe -ArgumentList $cxxArgs -NoNewWindow -Wait -PassThru
if ($proc.ExitCode -ne 0 -or -not (Test-Path $bridgeSo)) {
    throw "[BuildAndroid] Failed to compile libcrystal_bridge.so (Exit code: $($proc.ExitCode))."
}
Write-Host "  [OK] Successfully compiled '$bridgeSo' ($((Get-Item $bridgeSo).Length) bytes)." -ForegroundColor Green

# 5. Compile Crystal Game Shared Library (libgame.so)
$mainCr = if ($Entry) {
    if (Test-Path $Entry) { (Resolve-Path $Entry).Path } else { (Resolve-Path (Join-Path $RootDir $Entry)).Path }
} else {
    Join-Path $projFull "src/main.cr"
}
if ($mainCr -and (Test-Path $mainCr)) {
    Write-Host "[BuildAndroid] Compiling Crystal game library '$gameSo' from '$mainCr'..." -ForegroundColor Cyan

    
    $srcPath = Join-Path $RootDir "src"
    $baseCrystalPath = crystal env CRYSTAL_PATH
    $sep = if ($onWindows) { ";" } else { ":" }
    $env:CRYSTAL_PATH = "$srcPath$sep$baseCrystalPath"

    $scratchDir = Join-Path $RootDir "scratch/android_$Abi"
    if (-not (Test-Path $scratchDir)) {
        New-Item -ItemType Directory -Force -Path $scratchDir | Out-Null
    }
    $gameObj = Join-Path $scratchDir "game.o"


    $crystalFlags = [System.Collections.Generic.List[string]]::new()
    $crystalFlags.Add("build")
    $crystalFlags.Add("--cross-compile")
    $crystalFlags.Add("--target")
    $crystalFlags.Add($targetTriple)
    if ($Release -eq "1" -or $Release -eq "true") {
        $crystalFlags.Add("--release")
    }
    $crystalFlags.Add($mainCr)
    $crystalFlags.Add("-o")
    $crystalFlags.Add($gameObj)

    Write-Host "  -> Running Crystal cross-compile..." -ForegroundColor Gray
    $crProc = Start-Process -FilePath "crystal" -ArgumentList $crystalFlags -NoNewWindow -Wait -PassThru
    if ($crProc.ExitCode -ne 0 -or -not (Test-Path $gameObj)) {
        Write-Warning "[BuildAndroid] Crystal cross-compile step failed or produced no object file. Using bridge fallback."
    } else {
        # Link game.o into libgame.so with Android NDK Clang
        Write-Host "  -> Linking '$gameSo' with NDK Clang..." -ForegroundColor Gray
        $linkArgs = [System.Collections.Generic.List[string]]::new()
        if ($ccExe -like "*clang*" -and $ccExe -notlike "*$clangTarget*") {
            $linkArgs.Add("--target=$clangTarget")
        }
        $linkArgs.Add("-shared")
        $linkArgs.Add("-fPIC")
        $linkArgs.Add($gameObj)
        $linkArgs.Add("-o")
        $linkArgs.Add($gameSo)
        $rsrcAndroid = Join-Path $RootDir "rsrc/android/$Abi"
        if (Test-Path $rsrcAndroid) {
            $linkArgs.Add("-L$rsrcAndroid")
            $linkArgs.Add("-Wl,--whole-archive")
            if (Test-Path (Join-Path $rsrcAndroid "libgc.a")) {
                $linkArgs.Add("-lgc")
            }
            if (Test-Path (Join-Path $rsrcAndroid "libpcre2-8.a")) {
                $linkArgs.Add("-lpcre2-8")
            }
            $linkArgs.Add("-Wl,--no-whole-archive")
        }
        $linkArgs.Add("-lm")
        $linkArgs.Add("-lc")
        $linkArgs.Add("-ldl")
        $linkArgs.Add("-llog")

        $linkProc = Start-Process -FilePath $ccExe -ArgumentList $linkArgs -NoNewWindow -Wait -PassThru
        if ($linkProc.ExitCode -eq 0 -and (Test-Path $gameSo)) {
            Write-Host "  [OK] Successfully linked '$gameSo' ($((Get-Item $gameSo).Length) bytes)." -ForegroundColor Green
        } else {
            Write-Warning "[BuildAndroid] NDK linker exited with code $($linkProc.ExitCode)."
        }
    }
}

# 6. Synchronize binaries to consumer projects
$syncScript = Join-Path $RootDir "scripts/sync_bins.ps1"
if (Test-Path $syncScript) {
    & $syncScript
}

Write-Host "============================================================" -ForegroundColor Green
Write-Host " Android build completed for $Abi!" -ForegroundColor Green
Write-Host " Output: $outDir" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
