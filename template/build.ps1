# Build script for Crystal Godot Template
$ErrorActionPreference = "Stop"

Write-Host "[Template] Building Crystal game.dll..." -ForegroundColor Cyan
if (-not (Test-Path "bin")) {
    New-Item -ItemType Directory -Path "bin" | Out-Null
}

# Ensure .godot/extension_list.cfg exists so GDExtension is discovered
if (-not (Test-Path ".godot")) {
    New-Item -ItemType Directory -Path ".godot" | Out-Null
}
Set-Content -Path ".godot/extension_list.cfg" -Value "res://addons/crystal_integration/crystal.gdextension" -Force

# Sync addons from root for complete parity
if (Test-Path "../addons") {
    & powershell -ExecutionPolicy Bypass -File "../scripts/sync_addons.ps1" -Source "../addons" -Destinations "addons"
}

# Copy runtime DLLs
$crystalPath = Split-Path (Get-Command crystal).Source
foreach ($dll in @("gc.dll", "iconv-2.dll", "pcre2-8.dll")) {
    $src = Join-Path $crystalPath $dll
    if (Test-Path $src) {
        Copy-Item $src "bin/" -Force
    }
}

# Copy crystal_bridge.dll
if (Test-Path "../bin/crystal_bridge.dll") {
    Copy-Item "../bin/crystal_bridge.dll" "bin/" -Force
}

# Copy libgodot.dll if present
if (Test-Path "../bin/libgodot.dll") {
    Copy-Item "../bin/libgodot.dll" "bin/" -Force
}

$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$sep = if ($onWindows) { ";" } else { ":" }
$soExt = if ($onWindows) { "dll" } else { "so" }

# Set CRYSTAL_PATH so require "libgodot" finds ../src/libgodot.cr
$origPath = crystal env CRYSTAL_PATH
$env:CRYSTAL_PATH = "../src$sep$origPath"

# Compile Crystal source
if ($onWindows) {
    crystal build --link-flags "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init" src/main.cr -o "bin/game.$soExt"
} else {
    $wrapperPath = Join-Path ([System.IO.Path]::GetTempPath()) "crystal_cc_wrapper.sh"
    $scriptContent = @'
#!/usr/bin/env bash
is_shared=0
for arg in "$@"; do
    if [ "$arg" = "-shared" ]; then
        is_shared=1
        break
    fi
done

target_cc="${REAL_CC:-cc}"
if [ "$is_shared" -eq 0 ]; then
    exec "$target_cc" "$@"
fi

objs=()
flags=()
for arg in "$@"; do
    if [ "$arg" = "-rdynamic" ]; then
        continue
    elif [ -f "$arg" ] && [[ "$arg" == *.o || "$arg" == *.o.* || "$arg" == *.obj ]]; then
        objs+=("$arg")
    else
        flags+=("$arg")
    fi
done

if [ ${#objs[@]} -eq 0 ]; then
    exec "$target_cc" "$@"
fi

tmp_dir="${TMPDIR:-/tmp}"
combined="$tmp_dir/crystal_comb_$$.o"
localized="$tmp_dir/crystal_loc_$$.o"
cleanup() { rm -f "$combined" "$localized"; }
trap cleanup EXIT INT TERM

ld -r "${objs[@]}" -o "$combined" || exit $?
objcopy --keep-global-symbol=crystal_godot_init "$combined" "$localized" || exit $?
"$target_cc" "$localized" "${flags[@]}"
exit $?
'@
    Set-Content -Path $wrapperPath -Value $scriptContent -NoNewline -Force
    if (Get-Command chmod -ErrorAction SilentlyContinue) {
        & chmod +x $wrapperPath
    }
    if (-not [string]::IsNullOrWhiteSpace($env:CC) -and $env:CC -ne $wrapperPath) {
        $env:REAL_CC = $env:CC
    }
    $env:CC = $wrapperPath

    $symFile = "addons/crystal_integration/crystal_game.sym"
    if (-not (Test-Path $symFile)) {
        $symFile = Join-Path ([System.IO.Path]::GetTempPath()) "crystal_game.sym"
        Set-Content -Path $symFile -Value "{`n  global:`n    crystal_godot_init;`n  local:`n    *;`n};`n" -Force
    }
    $extraFlags = "-Wl,--undefined-version -Wl,--exclude-libs,ALL -Wl,--no-export-dynamic -Wl,--version-script=$symFile"
    if ((Get-Command ld.lld -ErrorAction SilentlyContinue) -or (Get-Command lld -ErrorAction SilentlyContinue)) {
        $extraFlags = "-fuse-ld=lld $extraFlags"
    }
    crystal build --link-flags "-shared $extraFlags" src/main.cr -o "bin/game.$soExt"
}

# Ensure playable Godot game executable is in place
$godotExe = ""
$godotCandidates = @(
    "../godot$exeExt",
    "../../godot$exeExt",
    "../godot.exe",
    $env:GODOT4,
    $env:GODOT4_BIN
)
foreach ($cand in $godotCandidates) {
    if ($cand -and (Test-Path $cand)) {
        $godotExe = (Resolve-Path $cand).Path
        break
    }
}
if (-not $godotExe -and (Get-Command godot -ErrorAction SilentlyContinue)) {
    $godotExe = (Get-Command godot).Source
}

if ($godotExe -and (Test-Path $godotExe)) {
    Copy-Item $godotExe "game$exeExt" -Force
    Copy-Item $godotExe "bin/game$exeExt" -Force
    if (Test-Path "project.godot") { Copy-Item "project.godot" "bin/" -Force }
    Write-Host "[Template] Created playable executable: game$exeExt" -ForegroundColor Green
}

Write-Host "[Template] Build completed successfully: bin/game.$soExt" -ForegroundColor Green

