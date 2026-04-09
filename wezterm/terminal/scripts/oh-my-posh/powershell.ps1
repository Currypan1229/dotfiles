param($style)

if ($style.Length -gt 0) {
    # If a style argument is provided, use it to initialize Oh My Posh
    oh-my-posh init pwsh --config $style --async | Invoke-Expression
} else {
    # Fallback to default style if no argument is provided
    oh-my-posh init pwsh --async | Invoke-Expression
}

clear
