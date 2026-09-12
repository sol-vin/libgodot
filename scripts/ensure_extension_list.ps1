param(
    [string]$ProjectPath = "."
)

$ErrorActionPreference = "Stop"

$fullPath = (Resolve-Path $ProjectPath).Path
$cfgDir = Join-Path $fullPath ".godot"
if (-not (Test-Path $cfgDir)) {
    New-Item -ItemType Directory -Force -Path $cfgDir | Out-Null
}

$extLines = [System.Collections.Generic.List[string]]::new()
$addonsDir = Join-Path $fullPath "addons"
if (Test-Path $addonsDir) {
    $items = Get-ChildItem -Path $addonsDir -Filter "*.gdextension" -Recurse | Sort-Object {
        if ($_.FullName -like "*crystal_integration*") { 0 } else { 1 }
    }, FullName
    foreach ($item in $items) {
        $rel = $item.FullName.Substring($fullPath.Length).TrimStart('\', '/').Replace('\', '/')
        $extLines.Add("res://$rel")
    }
}

if ($extLines.Count -eq 0) {
    $extLines.Add('res://addons/crystal_integration/crystal.gdextension')
}

Set-Content -Path (Join-Path $cfgDir "extension_list.cfg") -Value $extLines -Force
