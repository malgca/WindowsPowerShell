# Description: File containing short name aliases (and their functions) for places I navigate to often.
# Author: Malusi Gcakasi
# Version: 0.1
# Last Modified: Mar 22, 2013 12:33 PM

function Move-WindowsPowerShell 
{ 
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\" 
}

function Move-WindowsPowerShellModules 
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\"
}

function Move-WindowsPowerShellTests
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Scripts\Test\"
}

function Move-WindowsPowerShellScripts
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Scripts\"
}

function Move-PoshGit
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Posh-Git\"
}

function Move-DownloadManga
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Scripts\MangaDownload\"
}

function Move-Home
{
	cd $env:HOME
}

function Move-VimFolder
{
	cd "C:\Users\$env:USERNAME\.vim"
}

function Move-BalancedScorecardProject
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\"
}

function Move-ProjectTreatise
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise"
}

function Move-ProjectReadingList
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Reading List"
}

function Move-ProjectMeetings
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Meetings"
}

function Move-ProjectTemplates
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Templates"
}

# Navigation aliases
Set-Alias wps Move-WindowsPowerShell
Set-Alias scripts Move-WindowsPowerShellScripts
Set-Alias mods Move-WindowsPowerShellModules
Set-Alias tests Move-WindowsPowerShellTests
Set-Alias posh Move-PoshGit
Set-Alias dm Move-DownloadManga

Set-Alias home Move-Home
Set-Alias vimfol Move-VimFolder

Set-Alias projfol Move-BalancedScorecardProject
Set-Alias projtre Move-ProjectTreatise
Set-Alias projrl Move-ProjectReadingList
Set-Alias projmee Move-ProjectMeetings
Set-Alias projtem Move-ProjectTemplates

# Export members so they can be picked up as aliases in the $profile
# file
Export-ModuleMember -Function * -Alias *
