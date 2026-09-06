# Change to the directory where this script is located
Set-Location -Path $PSScriptRoot

# Determine Godot executable
$godotCmd = "godot"
if (Test-Path "./godot.exe") {
    $godotCmd = "./godot.exe"
} elseif (Test-Path "./godot") {
    $godotCmd = "./godot"
}

# Run Godot from that directory
& $godotCmd --editor