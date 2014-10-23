#Description: Contains paths for files being watched by the renamer
#Author: Malusi Gcakasi
#Version: 1.0.0
#Last Modified:

$watchList = @{
	"C:\Users\$env:USERNAME\My Pictures\Test Folder"
}

function Enable-Watchfolders {
	$watchList.GetEnumerator() | % { Write-Host "Name: " + $_.Name + " Value: " + $_.Value
}

function Disable-Watchfolders {
}
