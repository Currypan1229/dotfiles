$pkg_name = "wez.wezterm.nightly"
$INSTALLED = WINGET --LIST --ID $PKG_NAME --EXACT 2>$NULL

if ($installed) {
	Write-Host "Wezterm (Nightly) is already installed!" -ForegroundColor Green
} else {
	Write-Host "Wezterm (Nightly) is not found. Starting installing..." -ForegroundColor Yellow
	winget install --id $pkg_name --exact
}
