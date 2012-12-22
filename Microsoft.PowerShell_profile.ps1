# Path Variables
$SCRIPTPATH = "~\Documents\WindowsPowerShell\Scripts"
$VIMPATH = "C:\Program Files (x86)\Vim\vim73\vim.exe"
$GVIMPATH = "C:\Program Files (x86)\Vim\vim73\gvim.exe"
$NETBEANSPATH = "C:\Program Files\NetBeans 7.2\bin\netbeans64.exe"
$NPPATH = "C:\Program Files (x86)\Notepad++\notepad++.exe"

# Custom Aliases
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH
Set-Alias gvi $GVIMPATH
Set-Alias gvim $GVIMPATH

Set-Alias nb $NETBEANSPATH
Set-Alias netbeans $NETBEANSPATH

# Functions
Function nav($directory) 
{ 
	switch($directory)
	{
		"ant-tuts" { cd "~\Projects\Java\Tutorials\Ant2007" }
		default { $directory + " is not a valid nav directory" }
	}	
}

Function edit-profile { vim $profile }

Function edit-vimrc { vim "~\_vimrc" }

Function edit-gvimrc { gvim "~\_gvimrc" }
