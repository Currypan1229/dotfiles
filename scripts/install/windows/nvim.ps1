$pkg_name = "Neovim.Neovim"
$installed = winget --list --id $pkg_name --exact 2>$null

if ($installed) {
	Write-Host "Neovim is already installed!" -ForegroundColor Green
} else {
	Write-Host "Neovim is not found. Starting installing..." -ForegroundColor Yellow
	winget install --id $pkg_name --exact
}
