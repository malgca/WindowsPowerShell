if (Get-Module renamer) { return }

Push-Location $renamerRoot

Pop-Location
# Export Members
Export-ModuleMember `
	-Alias @(
		'??') `
	-Function @(
		'Add-TagByResolution')

