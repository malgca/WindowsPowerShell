# File containing short name aliases (and their functions) for places I navigate to often.

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

# Navigation aliases
Set-Alias wps Move-WindowsPowerShell
Set-Alias scripts Move-WindowsPowerShellScripts
Set-Alias mods Move-WindowsPowerShellModules
Set-Alias tests Move-WindowsPowerShellTests
Set-Alias home Move-Home
Set-Alias posh Move-PoshGit
Set-Alias dm Move-DownloadManga
Set-Alias proj Move-BalancedScorecardProject
Set-Alias vimfol Move-VimFolder

# Export members so they can be picked up as aliases in the $profile
# file
Export-ModuleMember -Function * -Alias *
