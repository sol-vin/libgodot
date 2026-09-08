param(
    [string]$ProjectPath = ".",
    [switch]$Force,
    [switch]$Release
)

$ErrorActionPreference = "Stop"

$projFull = (Resolve-Path $ProjectPath).Path
$addonsDir = Join-Path $projFull "addons"

if (-not (Test-Path $addonsDir)) {
    Write-Host "[RecompileAddons] No addons directory found in '$projFull'." -ForegroundColor Yellow
    exit 0
}

# Resolve root libgodot directory
$curr = $projFull
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
$soExt = if ($onWindows) { "dll" } elseif ($isMac) { "dylib" } else { "so" }
$linkFlags = if ($onWindows) {
    "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init"
} elseif ($isMac) {
    "-dynamiclib"
} else {
    "-shared"
}

$buildScript = Join-Path $rootDir "scripts/build_crystal.ps1"
$srcPath = Join-Path $rootDir "src"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  LibGodot Addon Detection & Recompilation Engine         " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Scanning: $addonsDir" -ForegroundColor Gray

$addonDirs = Get-ChildItem -Path $addonsDir -Directory

$recompiledCount = 0
$upToDateCount = 0
$skippedNonRecompilable = 0

foreach ($addon in $addonDirs) {
    $addonName = $addon.Name
    # Skip core crystal_integration plugin itself from regular addon rebuild
    if ($addonName -eq "crystal_integration") {
        continue
    }

    $addonPath = $addon.FullName
    $binDir = Join-Path $addonPath "bin"
    $mainCr = Join-Path $addonPath "src/main.cr"
    $makefilePath = Join-Path $addonPath "Makefile"

    # Determine if addon is a Crystal addon and whether it has a recompilable target
    $hasCrSource = (Test-Path $mainCr) -or ((Get-ChildItem -Path $addonPath -Filter "*.cr" -Recurse -ErrorAction SilentlyContinue).Count -gt 0)
    $hasMakefile = Test-Path $makefilePath
    $isRecompilable = $hasCrSource -or $hasMakefile

    # Check for existing binary targets
    $binFiles = if (Test-Path $binDir) {
        Get-ChildItem -Path $binDir -Filter "*.$soExt" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notmatch '^crystal_bridge' -and $_.Name -notmatch '^(gc|iconv|pcre2|libgodot)' }
    } else {
        @()
    }

    if (-not $isRecompilable) {
        if ($binFiles -and $binFiles.Count -gt 0) {
            Write-Host "  [-] '$addonName': Precompiled binary addon ($($binFiles[0].Name)) - Non-recompilable target (preserved)." -ForegroundColor DarkGray
        } else {
            Write-Host "  [-] '$addonName': Non-Crystal addon - Skipped." -ForegroundColor DarkGray
        }
        $skippedNonRecompilable++
        continue
    }

    # Find the target output binary
    $targetBinary = $null
    if ($binFiles -and $binFiles.Count -gt 0) {
        $targetBinary = $binFiles[0].FullName
    } else {
        # Check .gdextension for declared library file
        $gdexts = Get-ChildItem -Path $addonPath -Filter "*.gdextension" -ErrorAction SilentlyContinue
        if ($gdexts -and $gdexts.Count -gt 0) {
            $gdextContent = Get-Content $gdexts[0].FullName -Raw
            if ($gdextContent -match 'res://addons/[^/]+/bin/([^"]+\.(?:dll|so|dylib))') {
                $targetBinary = Join-Path $binDir $Matches[1]
            }
        }
        if (-not $targetBinary) {
            $targetBinary = Join-Path $binDir "$addonName.$soExt"
        }
    }

    # Check if recompilation is needed based on source timestamps
    $needsCompile = $false
    if ($Force) {
        $needsCompile = $true
    } elseif (-not (Test-Path $targetBinary)) {
        $needsCompile = $true
    } else {
        $binTime = (Get-Item $targetBinary).LastWriteTime
        $allCrFiles = Get-ChildItem -Path $addonPath -Filter "*.cr" -Recurse -ErrorAction SilentlyContinue
        foreach ($cr in $allCrFiles) {
            if ($cr.LastWriteTime -gt $binTime) {
                $needsCompile = $true
                break
            }
        }
    }

    if (-not $needsCompile) {
        $binLeaf = Split-Path -Leaf $targetBinary
        Write-Host "  [OK] '$addonName': Up-to-date (Binary: $binLeaf)." -ForegroundColor Green
        $upToDateCount++
        continue
    }

    Write-Host "  [COMPILE] '$addonName': Changes detected, recompiling..." -ForegroundColor Cyan
    if (-not (Test-Path $binDir)) {
        New-Item -ItemType Directory -Force -Path $binDir | Out-Null
    }

    # Sync crystal_bridge and runtime dependencies to addon bin/
    $bridgeSrc = Join-Path $rootDir "bin/crystal_bridge.$soExt"
    if (Test-Path $bridgeSrc) {
        Copy-Item $bridgeSrc (Join-Path $binDir "crystal_bridge.$soExt") -Force -ErrorAction SilentlyContinue
    }
    $depsScript = Join-Path $rootDir "scripts/ensure_deps.ps1"
    if (Test-Path $depsScript) {
        & $depsScript -TargetBin $binDir
    }

    # Compile
    if ($hasMakefile -and (Get-Command make -ErrorAction SilentlyContinue)) {
        $makeArgs = @("-C", $addonPath, "build")
        if ($Release) { $makeArgs += "RELEASE=1" }
        & make $makeArgs
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[RecompileAddons] Failed to compile '$addonName' via Makefile."
            exit $LASTEXITCODE
        }
    } elseif (Test-Path $mainCr) {
        $params = @{
            Entry = $mainCr
            Output = $targetBinary
            LinkFlags = $linkFlags
            SourcePath = $srcPath
        }
        if ($Release) { $params["Release"] = $true }
        & $buildScript @params
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[RecompileAddons] Failed to compile '$addonName' ($mainCr)."
            exit $LASTEXITCODE
        }
    } else {
        Write-Warning "[RecompileAddons] Cannot determine compilation entry point for '$addonName'."
        continue
    }

    Write-Host "  [OK] '$addonName': Recompiled successfully -> $targetBinary" -ForegroundColor Green
    $recompiledCount++
}

Write-Host "----------------------------------------------------------" -ForegroundColor Gray
Write-Host "Addon Scan Summary: $recompiledCount recompiled, $upToDateCount up-to-date, $skippedNonRecompilable precompiled/skipped." -ForegroundColor Cyan
