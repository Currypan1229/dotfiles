$pkg_name = "wez.wezterm.nightly"
winget list --id $pkg_name --exact 2>$null
$installed = $LASTEXITCODE -eq 0

if ($installed) {
	Write-Host "Wezterm (Nightly) is already installed!" -ForegroundColor Green
} else {
	Write-Host "Wezterm (Nightly) is not found. Starting installing..." -ForegroundColor Yellow

	$insecured = winget settings export | ConvertFrom-Json
	if (!($insecured.adminSettings.InstallerHashOverride)) {
		winget settings --enable InstallerHashOverride
	}

	winget install --id $pkg_name --exact --force

	if (!($insecured.adminSettings.InstallerHashOverride)) {
		winget settings --disable InstallerHashOverride
	}
}
