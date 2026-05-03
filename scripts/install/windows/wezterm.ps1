$pkg_name = "wez.wezterm.nightly"
winget list --id $pkg_name --exact 2>$null
$installed = $LASTEXITCODE -eq 0

if ($installed) {
	Write-Host "Wezterm (Nightly) is already installed!" -ForegroundColor Green
} else {
	Write-Host "Wezterm (Nightly) is not found. Starting installing..." -ForegroundColor Yellow

	winget install --id $pkg_name --exact --ignore-security-hash
}
