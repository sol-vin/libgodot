param(
    [switch]$Release
)

$RootDir = Split-Path -Parent $PSScriptRoot
$testAddons = Join-Path $RootDir "test/addons"
$buildScript = Join-Path $RootDir "scripts/build_crystal.ps1"

if (-not (Test-Path $testAddons)) {
    exit 0
}

$addons = Get-ChildItem -Path $testAddons -Directory -Filter "dummy_*"

foreach ($addon in $addons) {
    $addonName = $addon.Name
    $mainCr = Join-Path $addon.FullName "src/main.cr"
    if (-not (Test-Path $mainCr)) { continue }

    $binDir = Join-Path $addon.FullName "bin"
    if (-not (Test-Path $binDir)) {
        New-Item -ItemType Directory -Force -Path $binDir | Out-Null
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
    $ext = if ($onWindows) { "dll" } elseif ($isMac) { "dylib" } else { "so" }
    $linkFlags = if ($onWindows) {
        "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init"
    } elseif ($isMac) {
        "-dynamiclib"
    } else {
        "-shared"
    }
    $outLib = Join-Path $binDir "$addonName.$ext"
    Write-Host "[DummyAddon] Compiling $addonName -> $outLib..."
    $params = @{
        Entry = $mainCr
        Output = $outLib
        LinkFlags = $linkFlags
    }
    if ($Release) { $params["Release"] = $true }

    & $buildScript @params
    if ($LASTEXITCODE -ne 0) {
        Write-Error "[DummyAddon] Failed to compile $addonName"
        exit $LASTEXITCODE
    }
}

Write-Host "[DummyAddon] All dummy addons built successfully!"
exit 0
