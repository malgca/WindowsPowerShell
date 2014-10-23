# Description: Module to save all my editting functions in order to enforce a cleaner $profile file.
# Author: Malusi Gcakasi
# Last Modified: Sep 10, 2014 12:02 PM

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
Set-Alias edp Edit-Profile
Set-Alias edmnav Edit-NavigationModule
Set-Alias edmed Edit-EditModule

Set-Alias edvrc Edit-Vimrc
Set-Alias edvmap Edit-VimMappings
Set-Alias edvauto Edit-VimAutocommands

# Export Functions to be used in profile file.
Export-ModuleMember -Function * -Alias *
