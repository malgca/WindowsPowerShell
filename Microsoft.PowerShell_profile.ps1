# Path Variables
$SCRIPTPATH = "~\Documents\WindowsPowerShell\Scripts"
$VIMPATH = "C:\Program Files (x86)\Vim\vim73\vim.exe"

# Custom Aliases
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH

# Functions
Function scroll-slow { process { $_; Start-Sleep -seconds .5 }}

Function ant-tutorials { cd "~\Projects\Java\Tutorials\Ant, In Action 2007" }

Function edit-profile { vim $profile }

Function edit-vimrc { vim "C:\Program Files (x86)\Vim\_vimrcv" }