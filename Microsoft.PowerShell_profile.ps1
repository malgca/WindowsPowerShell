# Modules Imported
Import-Module Navigation
Import-Module Edit

# Path Variables
$SublimePath = "C:\Program Files\Sublime Text 2\sublime_text.exe"

# Launcher Aliases
Set-Alias sublime $SublimePath

# Load posh-git example profile
. "C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\Posh-Git\profile.example.ps1"
