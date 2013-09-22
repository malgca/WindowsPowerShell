# Description: Contains basic image manipulation properties
# Author: Malusi Gcakasi
# Version: 0.1
# Last Modified: Sep 22, 2013 05:29 PM

#Import Assemblies
Add-Type -Assembly System.Drawing

# Gets all images in a directory
function Get-DirectoryImages {
	param([string]$directoryName = $(Get-Location))
	ls -r -inc @('*.jpg';
			'*.jpeg';
			'*.png';
			'*.gif';
			'*.tif') | % { [System.Drawing.Image]::FromFile($_.FullName) }
}

# Removes all images under a certain resolution from a directory
function Add-TagByResolution {
	$minWidth = 800
	$minHeight = 600

	Get-DirectoryImages | ? { $_.Width -le $minWidth -and $_.Height -le $minHeight } | % { write-host $_.Tag }
}

# Export Members
Export-ModuleMember -Function * -Alias *
