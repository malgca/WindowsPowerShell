# Module to save all my editting functions in order to enforce a cleaner $profile file.

# Functions for files I edit often
function Edit-Profile
{
	vim $profile
}

function Edit-Vimrc
{
	vim "C:\Users\$env:USERNAME\_gvimrc"
}

function Edit-NavigationModule
{
	vim "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Navigation\Navigation.psm1"
}

function Edit-EditModule
{
	vim "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Edit\Edit.psm1"
}

# Set-Aliases for Editting Module functions
Set-Alias enavmod Edit-NavigationModule
Set-Alias eeditmod Edit-EditModule
Set-Alias ep Edit-Profile
Set-Alias evimrc Edit-Vimrc

# Export Functions to be used in profile file.
Export-ModuleMember -Function * -Alias *
