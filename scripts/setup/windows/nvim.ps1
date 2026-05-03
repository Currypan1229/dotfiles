$cwd = (Get-Location).Path
$item = "~/AppData/Local/nvim"

if (Test-Path -Path $item) {
	Remove-Item -Path $item
	Write-Host "Deleted exists symlink."
}

New-Item -Path $item -Value "${cwd}\nvim" -ItemType SymbolicLink | Out-Null
