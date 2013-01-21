# modules imported
Import-Module GitVim
# Profile Variables

# Path Variables
$SCRIPTPATH = "~\Documents\WindowsPowerShell\Scripts"
$VIMPATH = "C:\Program Files (x86)\Vim\vim73\vim.exe"
$GVIMPATH = "C:\Program Files (x86)\Vim\vim73\gvim.exe"
$NETBEANSPATH = "C:\Program Files\NetBeans 7.2\bin\netbeans64.exe"


# Custom Aliases
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH
Set-Alias gvi $GVIMPATH
Set-Alias gvim $GVIMPATH

Set-Alias nb $NETBEANSPATH
Set-Alias netbeans $NETBEANSPATH

# Functions
function Edit-Profile { vim $profile }

function Edit-Vimrc { vim "~\_vimrc" }

function Edit-Gvimrc { gvim "~\_gvimrc" }
