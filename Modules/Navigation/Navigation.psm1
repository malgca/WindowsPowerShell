# Description: File containing short name aliases (and their functions) for places I navigate to often.
# Author: Malusi Gcakasi
# Version: 0.1
# Last Modified: Mar 20, 2015 08:41 AM

function Move-WindowsPowerShell 
{ 
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\" 
}

function Move-WindowsPowerShellModules 
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\"
}

function Move-PoshGit
{
	cd "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Posh-Git\"
}

function Move-Home
{
	cd $env:HOMEPATH
}

function Move-VimFolder
{
	cd "C:\Users\$env:USERNAME\.vim\"
}

# Navigation aliases
Set-Alias mvps Move-WindowsPowerShell
Set-Alias mvmd Move-WindowsPowerShellModules
Set-Alias mvpsg Move-PoshGit

Set-Alias home Move-Home
Set-Alias mvvf Move-VimFolder

# Export members so they can be picked up as aliases in the $profile file
Export-ModuleMember -Function * -Alias *
