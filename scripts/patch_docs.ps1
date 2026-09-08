# =============================================================================
# LibGodot Documentation Post-Processing Patch
# =============================================================================
# Patches Crystal Docs output in docs/ to fix height truncation and search limits
# on large API surfaces (1,000+ classes).
# =============================================================================

$ErrorActionPreference = "Stop"
$RootDir = Split-Path -Parent $PSScriptRoot
$DocsDir = Join-Path $RootDir "docs"
$CssFile = Join-Path $DocsDir "css/style.css"
$JsFile = Join-Path $DocsDir "js/doc.js"

if (-not (Test-Path $DocsDir)) {
    Write-Host "[Docs Patch] docs/ directory does not exist yet; skipping." -ForegroundColor Yellow
    exit 0
}

# 1. Patch CSS max-height cutoff in sidebar tree
if (Test-Path $CssFile) {
    $css = Get-Content $CssFile -Raw
    # Crystal docs template hardcodes:
    # .types-list li.open > ul {
    #   height: auto;
    #   max-height: 1000em;
    # }
    # For large namespaces (1,800+ entries like Godot), 1000em clips items after ~item 860 (OpenXR...).
    if ($css -match 'max-height:\s*1000em;') {
        Write-Host '[Docs Patch] Removing max-height cutoff (1000em to none) in CSS...' -ForegroundColor Cyan
        $cssPatched = $css -replace 'max-height:\s*1000em;', 'max-height: none;'
        Set-Content -Path $CssFile -Value $cssPatched -NoNewline
        Write-Host '[Docs Patch] CSS sidebar height cutoff patched successfully!' -ForegroundColor Green
    } else {
        Write-Host '[Docs Patch] CSS sidebar max-height already unconstrained.' -ForegroundColor DarkGray
    }
}

# 2. Patch search results limit in doc.js
if (Test-Path $JsFile) {
    $js = Get-Content $JsFile -Raw
    # Default MAX_RESULTS_DISPLAY = 140 can truncate search on comprehensive APIs.
    if ($js -match 'CrystalDocs\.MAX_RESULTS_DISPLAY\s*=\s*140;') {
        Write-Host '[Docs Patch] Increasing search display limit (140 to 500) in JS...' -ForegroundColor Cyan
        $jsPatched = $js -replace 'CrystalDocs\.MAX_RESULTS_DISPLAY\s*=\s*140;', 'CrystalDocs.MAX_RESULTS_DISPLAY = 500;'
        Set-Content -Path $JsFile -Value $jsPatched -NoNewline
        Write-Host '[Docs Patch] Search display limit increased successfully!' -ForegroundColor Green
    } else {
        Write-Host '[Docs Patch] Search display limit already configured.' -ForegroundColor DarkGray
    }
}
