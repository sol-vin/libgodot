param(
    [Parameter(Mandatory = $true)]
    [string]$Entry,
    [Parameter(Mandatory = $true)]
    [string]$Output,
    [string]$LinkFlags = "",
    [switch]$Release,
    [string]$SourcePath = "",
    [string]$Flags = ""
)

$RootDir = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($SourcePath)) {
    $SourcePath = Join-Path $RootDir "src"
}

# Set CRYSTAL_PATH
$baseCrystalPath = crystal env CRYSTAL_PATH
$sep = if ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';') { ";" } else { ":" }
$env:CRYSTAL_PATH = "$SourcePath$sep$baseCrystalPath"

$buildArgs = [System.Collections.Generic.List[string]]::new()
$buildArgs.Add("build")

if ($Release) {
    $buildArgs.Add("--release")
} else {
    $buildArgs.Add("--debug")
    if ($onWindows -and $LinkFlags -notmatch '/DEBUG') {
        $LinkFlags = if ([string]::IsNullOrWhiteSpace($LinkFlags)) { "/DEBUG:FULL" } else { "$LinkFlags /DEBUG:FULL" }
    }
}

if (-not [string]::IsNullOrWhiteSpace($Flags)) {
    foreach ($f in ($Flags -split '\s+')) {
        if (-not [string]::IsNullOrWhiteSpace($f)) {
            $buildArgs.Add($f)
        }
    }
}

# On Linux, shared library linking requires hiding static runtime symbols
# and using a version script to avoid "version node not found for symbol" errors on mangled names containing '@'.
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

if ($isMac -and ($Output -match '\.dylib$' -or $LinkFlags -match '-dynamiclib')) {
    if ($LinkFlags -notmatch '-dynamiclib') {
        $LinkFlags = if ([string]::IsNullOrWhiteSpace($LinkFlags)) { "-dynamiclib" } else { "$LinkFlags -dynamiclib" }
    }
} elseif (-not $onWindows -and -not $isMac -and ($Output -match '\.so$' -or $LinkFlags -match '-shared')) {
    # Crystal passes -rdynamic when invoking cc, which translates to -export-dynamic.
    # On Linux, this forces internal Crystal symbols containing '@' into .dynsym,
    # causing linkers (LLD and GNU ld) to fail with "has undefined version" or "version node not found".
    # We use a wrapper for CC that strips -rdynamic so only exported symbols (crystal_godot_init) enter .dynsym.
    $wrapperCandidate = Join-Path $RootDir "scripts/cc_wrapper.sh"
    $wrapperPath = ""
    if (Test-Path $wrapperCandidate) {
        $wrapperPath = (Resolve-Path $wrapperCandidate).Path
    } else {
        $wrapperPath = $wrapperCandidate
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
objcopy -w --keep-global-symbol=crystal_godot_init "$combined" "$localized" || exit $?
"$target_cc" "$localized" "${flags[@]}"
exit $?
'@
        Set-Content -Path $wrapperPath -Value $scriptContent -NoNewline -Force
    }
    if (Get-Command chmod -ErrorAction SilentlyContinue) {
        & chmod +x $wrapperPath
    }
    if (-not [string]::IsNullOrWhiteSpace($env:CC) -and $env:CC -ne $wrapperPath) {
        $env:REAL_CC = $env:CC
    }
    $env:CC = $wrapperPath

    if ($LinkFlags -notmatch '--version-script') {
        $candidates = @(
            (Join-Path $RootDir "src/bridge/crystal_game.sym"),
            (Join-Path $RootDir "addons/crystal_integration/crystal_game.sym"),
            (Join-Path (Get-Location) "addons/crystal_integration/crystal_game.sym")
        )
        $symFile = ""
        foreach ($cand in $candidates) {
            if (Test-Path $cand) {
                $symFile = (Resolve-Path $cand).Path
                break
            }
        }
        if ([string]::IsNullOrWhiteSpace($symFile)) {
            $symFile = Join-Path ([System.IO.Path]::GetTempPath()) "crystal_game.sym"
            Set-Content -Path $symFile -Value "{`n  global:`n    crystal_godot_init;`n  local:`n    *;`n};`n" -Force
        }
        $extraFlags = "-Wl,--undefined-version -Wl,--exclude-libs,ALL -Wl,--no-export-dynamic -Wl,--version-script=$symFile"
        if ((Get-Command ld.lld -ErrorAction SilentlyContinue) -or (Get-Command lld -ErrorAction SilentlyContinue)) {
            $extraFlags = "-fuse-ld=lld $extraFlags"
        }
        $LinkFlags = if ([string]::IsNullOrWhiteSpace($LinkFlags)) { "-shared $extraFlags" } else { "$LinkFlags $extraFlags" }
    }
}

if (-not [string]::IsNullOrWhiteSpace($LinkFlags)) {
    $buildArgs.Add("--link-flags")
    $buildArgs.Add($LinkFlags)
}

$buildArgs.Add($Entry)
$buildArgs.Add("-o")
$buildArgs.Add($Output)

& crystal $buildArgs
exit $LASTEXITCODE
