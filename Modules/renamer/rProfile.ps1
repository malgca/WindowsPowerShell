# Load the renamer module from the current module
Import-Module .\renamer

function global:prompt {
	Write-Host "Renamer module loaded."
}

# enable necessary renamer functions.
Enable-Watchlist
