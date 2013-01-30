# Modules Imported
Import-Module GitVim
Import-Module Navigation
Import-Module Edit

# Path Variables
$SCRIPTPATH = "~\Documents\WindowsPowerShell\Scripts"
$VIMPATH = "C:\Program Files (x86)\Vim\vim73\vim.exe"
$GVIMPATH = "C:\Program Files (x86)\Vim\vim73\gvim.exe"
$NETBEANSPATH = "C:\Program Files\NetBeans 7.2\bin\netbeans64.exe"

# Launcher Aliases
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH
Set-Alias gvi $GVIMPATH
Set-Alias gvim $GVIMPATH

Set-Alias nb $NETBEANSPATH
Set-Alias netbeans $NETBEANSPATH

# Load posh-git example profile
. 'C:\Users\Moo\Documents\WindowsPowerShell\Scripts\Posh-Git\profile.example.ps1'
