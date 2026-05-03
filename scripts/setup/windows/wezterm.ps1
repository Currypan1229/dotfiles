$cwd = (Get-Location).Path
$item = "~/.config/wezterm"

if (Test-Path -Path $item) {
	Remove-Item -Path $item
	Write-Host "Deleted exists symlink."
}

New-Item -Path $item -Value "${cwd}\wezterm" -ItemType SymbolicLink | Out-Null
