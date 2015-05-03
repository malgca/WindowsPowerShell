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

# Navigation aliases
Set-Alias mvwps Move-WindowsPowerShell
Set-Alias mvmod Move-WindowsPowerShellModules
Set-Alias mvposh Move-PoshGit

Set-Alias home Move-Home

# Export members so they can be picked up as aliases in the $profile file
Export-ModuleMember -Function * -Alias *
