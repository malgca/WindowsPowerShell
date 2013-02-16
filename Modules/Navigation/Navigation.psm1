# File containing short name aliases (and their functions) for places I navigate to often.

function Move-WindowsPowerShell 
{ 
	cd "~\Documents\WindowsPowerShell\" 
}

function Move-WindowsPowerShellModules 
{
	cd "~\Documents\WindowsPowerShell\Modules\"
}

function Move-WindowsPowerShellTests
{
	cd "~\Documents\WindowsPowerShell\Scripts\Test\"
}

function Move-Home
{
	cd "~\"
}

function Move-PoshGit
{
	cd "~\Documents\WindowsPowerShell\Modules\Posh-Git\"
}

function Move-WindowsPowerShellScripts
{
	cd "~\Documents\WindowsPowerShell\Scripts\"
}

function Move-DownloadManga
{
	cd "~\Documents\WindowsPowerShell\Scripts\MangaDownload\"
}

function Move-SuggestotronApp
{
	cd "~\RailsBridge\Suggestotron"
}

# Navigation aliases
Set-Alias wps Move-WindowsPowerShell
Set-Alias scripts Move-WindowsPowerShellScripts
Set-Alias mods Move-WindowsPowerShellModules
Set-Alias tests Move-WindowsPowerShellTests
Set-Alias home Move-Home
Set-Alias posh Move-PoshGit
Set-Alias dm Move-DownloadManga
Set-Alias suggestotron Move-SuggestotronApp

# Export members so they can be picked up as aliases in the $profile 
# file
Export-ModuleMember -Function * -Alias *
