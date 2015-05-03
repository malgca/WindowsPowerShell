# Description: Module to save all my editting functions in order to enforce a cleaner $profile file.
# Author: Malusi Gcakasi
# Last Modified: Sep 10, 2014 12:02 PM

function Edit-Profile
{
	sublime $profile
}

function Edit-NavigationModule
{
	sublime "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Navigation\Navigation.psm1"
}

function Edit-EditModule
{
	sublime "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Edit\Edit.psm1"
}

# Set-Aliases for Editting Module functions
Set-Alias edp Edit-Profile
Set-Alias ednav Edit-NavigationModule
Set-Alias eded Edit-EditModule

# Export Functions to be used in profile file.
Export-ModuleMember -Function * -Alias *
