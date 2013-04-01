# Description: Module to save all my editting functions in order to enforce a cleaner $profile file.
# Version: 1.0
# Author: Malusi Gcakasi
# Last Modified: Mar 26, 2013 08:00 AM

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

# Create project notes, save them in the right place and start working 
function Edit-ProjectNotes
{
	$time = Get-Date -Format "MMM dd, yyyy"
	$exists = Test-Path("C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Notes\$time")

	if($exists)
	{
		start "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Notes\$time\Notes.docx"
	}
	else
	{
		# Open word and create the document
		$word = New-Object -ComObject "Word.Application"
		$doc = $word.documents.add()

		# Get focus so you can edit
		$focus = $word.Selection

		# Set the Title of the document
		$focus.Style = "Title"
		$focus.TypeText("Notes: $time")
		$focus.TypeParagraph()
		$focus.Style = "Heading 1"
		$focus.TypeText("<Additional Title Here>")
		$focus.TypeParagraph( )
		$focus.TypeParagraph()
		# Set Font Stuff
		$focus.Font.size = 12
		$focus.Font.Name = "Calibri Light"

		# Save the document under the correct date in the notes folder
		mkdir "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Notes\$time"
		$doc.SaveAs([ref]"C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Notes\$time\Notes.docx")

		$word.visible = $true
	}
}

function Edit-ProjectTreatise
{
	start "C:\Users\$env:USERNAME\Documents\University\Balanced Scorecard Project\Treatise\Main\Treatise.docx"
}

# Set-Aliases for Editting Module functions
Set-Alias ep Edit-Profile
Set-Alias enavmod Edit-NavigationModule
Set-Alias eeditmod Edit-EditModule

Set-Alias evrc Edit-Vimrc
Set-Alias evmap Edit-VimMappings
Set-Alias evauto Edit-VimAutocommands
Set-Alias evfunc Edit-VimFunctions

Set-Alias eprojnotes Edit-ProjectNotes
Set-Alias eprojtre Edit-ProjectTreatise

# Export Functions to be used in profile file.
Export-ModuleMember -Function * -Alias *
