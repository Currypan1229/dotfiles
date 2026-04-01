param($style)

if ($style -and (Test-Path $style)) {
    $env:STARSHIP_CONFIG = $style
}

starship init powershell | Invoke-Expression

clear
