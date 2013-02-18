# Modules Imported
Import-Module GitVim
Import-Module Navigation
Import-Module Edit
Import-Module PSGet

# Path Variables
$VIMPATH = "C:\Program Files (x86)\Vim\vim73\vim.exe"
$GVIMPATH = "C:\Program Files (x86)\Vim\vim73\gvim.exe"

# Launcher Aliases
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH
Set-Alias gvi $GVIMPATH
Set-Alias gvim $GVIMPATH

# Cmndlet Aliases
Set-Alias new New-Object

# Load posh-git example profile
. "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Posh-Git\profile.example.ps1"

