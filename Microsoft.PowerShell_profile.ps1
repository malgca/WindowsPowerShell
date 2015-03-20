# Modules Imported
Import-Module Navigation
Import-Module Edit

# Path Variables
$GVIMPATH = "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# Launcher Aliases
Set-Alias vim $GVIMPATH

# Load posh-git example profile
. "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Posh-Git\profile.example.ps1"
