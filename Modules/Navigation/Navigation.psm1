# Description: File containing short name aliases (and their functions) for places I navigate to often.
# Author: Malusi Gcakasi
# Version: 0.1
# Last Modified: Sep 22, 2013 02:27 PM

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

function Move-VimTemplates
{
	cd "C:\Users\$env:USERNAME\.vim\templates"
}

function Move-VimAfter
{
	cd "C:\Users\$env:USERNAME\.vim\after"
}

function Move-DevelopmentFolder
{
	cd "C:\Users\$env:USERNAME\Development"
}

function Move-BalancedScorecardProject
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project"
}

function Move-ProjectNotes
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Notes"
}

function Move-ProjectImages
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Images"

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

function Move-ProjectExtantSystems
{
	cd "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Extant Systems"
}

# Navigation aliases
Set-Alias wps Move-WindowsPowerShell
Set-Alias scripts Move-WindowsPowerShellScripts
Set-Alias mods Move-WindowsPowerShellModules
Set-Alias tests Move-WindowsPowerShellTests
Set-Alias posh Move-PoshGit
Set-Alias dm Move-DownloadManga

Set-Alias home Move-Home
Set-Alias dev Move-DevelopmentFolder

Set-Alias vimfol Move-VimFolder
Set-Alias vimtem Move-VimTemplates
Set-Alias vimaft Move-VimAfter

Set-Alias projfol Move-BalancedScorecardProject
Set-Alias projnot Move-ProjectNotes
Set-Alias projimg Move-ProjectImages
Set-Alias projrl Move-ProjectReadingList
Set-Alias projmee Move-ProjectMeetings
Set-Alias projtem Move-ProjectTemplates
Set-Alias projext Move-ProjectExtantSystems

# Export members so they can be picked up as aliases in the $profile file
Export-ModuleMember -Function * -Alias *
