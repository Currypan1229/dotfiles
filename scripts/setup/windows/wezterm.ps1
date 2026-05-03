$cwd = (Get-Location).Path
$cfg_dir ="~/.config"
$item = "${cfg_dir}/wezterm"

if (Test-Path -Path $item) {
	Remove-Item -Path $item
	Write-Host "Deleted exists symlink."
}

New-Item -Path $cfg_dir -ItemType Directory | Out-Null
New-Item -Path $item -Value $cwd -ItemType SymbolicLink | Out-Null
