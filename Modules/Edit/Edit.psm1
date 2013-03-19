# Description: Module to save all my editting functions in order to enforce a cleaner $profile file.
# Version: 1.0
# Author: Malusi Gcakasi
# Last Modified: Mar 19, 2013 07:20 PM

# Functions for files I edit often
function Edit-Profile
{
	vim $profile
}

function Edit-Vimrc
{
	vim "C:\Users\$env:USERNAME\_gvimrc"
}

function Edit-VimMappings
{
	vim "C:\Users\$env:USERNAME\.vim\config\gvim\mappings.vim"
}

function Edit-VimAutocommands
{
	vim "C:\Users\$env:USERNAME\.vim\config\gvim\autocommands.vim"
}

function Edit-VimFunctions
{
	vim "C:\Users\$env:USERNAME\.vim\config\gvim\functions.vim"
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
Set-Alias evrc Edit-Vimrc
Set-Alias evmap Edit-VimMappings
Set-Alias evauto Edit-VimAutocommands
Set-Alias evfunc Edit-VimFunctions

# Export Functions to be used in profile file.
Export-ModuleMember -Function * -Alias *
