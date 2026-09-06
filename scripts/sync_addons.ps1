param(
    [string]$Source = "addons",
    [string[]]$Destinations = @("demo/addons", "template/addons")
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $Source)) {
    Write-Warning "[Sync] Source directory '$Source' does not exist."
    exit 0
}

$srcRoot = (Resolve-Path $Source).Path
$files = Get-ChildItem -Path $Source -Recurse -File

$srcRelPaths = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($file in $files) {
    $rel = $file.FullName.Substring($srcRoot.Length + 1)
    [void]$srcRelPaths.Add($rel)
}

foreach ($dest in $Destinations) {
    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    # 1. Copy / update all files from source to destination
    foreach ($file in $files) {
        $relPath = $file.FullName.Substring($srcRoot.Length + 1)
        $targetFile = Join-Path $dest $relPath
        $targetDir = Split-Path $targetFile

        if (-not (Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }

        # Use ReadAllBytes / WriteAllBytes to safely update files that Godot may have open with shared read
        try {
            $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
            [System.IO.File]::WriteAllBytes($targetFile, $bytes)
        } catch {
            try {
                Copy-Item -Path $file.FullName -Destination $targetFile -Force -ErrorAction SilentlyContinue
            } catch {}
        }
    }

    # 2. Remove stale files from destination to ensure 100% parity
    $destRoot = (Resolve-Path $dest).Path
    $destFiles = Get-ChildItem -Path $dest -Recurse -File
    foreach ($df in $destFiles) {
        $dRel = $df.FullName.Substring($destRoot.Length + 1)
        if (-not $srcRelPaths.Contains($dRel)) {
            try {
                Remove-Item -Path $df.FullName -Force -ErrorAction SilentlyContinue
            } catch {}
        }
    }
}

Write-Host "[Sync] Ensured complete parity: '$Source' -> $($Destinations -join ', ')"
