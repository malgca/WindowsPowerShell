$menuList = @()			# Stores an array containing information
				# about the script games
$playAgain = "True"		# Controls the execution of a loop that
				# controls game execution

# This function gets the player's permission to begin the game
function Get-GameListing {

	$gameList = @() # Stores an array containing a list of PowerShell
			# scripts
	$i = 0		# Index field used to keep position in array

	# Clear the screen
	cls

	# Display a game console header
	write-host ""
	write-host " --------------------------------"
	write-host " Windows PowerShell Game Console" `
		-ForegroundColor darkred
	write-host " --------------------------------"

	# Specify the location of the game scripts
	cd "~\Documents\WindowsPowerShell\Scripts\Microsoft Windows PowerShell Programming For Absolute Beginner"

	# Load an array with a list of all the PowerShell scripts in the 
	# specified folder
	$gameList = ls . *.ps1 | foreach-object -process { $gameList[$i] = $_.name; $i++ }

	$gameList # Return the contents of the array to the calling statment

}

# This function displays a menu listing of PowerShell games
function Write-MenuList {
	param($list) # The list of games to be displayed is passed as an array

	$Counter = 0 # Used to number each menu item

	write-host

	ForEach($i in $list) { # Iterate for each script stored in the array

		$counter++ # Increment the counter by 1

		if($couner -lt 10) { 	# Format the display of the first 9
					# scipts
			write-host " $counter. $i" -ForegroundColor Blue
		
		}
		else { # Format the display of all remaining scripts

			write-host " $counter. $i" -ForegroundColor Blue

		}
	}

	write-host "`n --------------------------"
}

function End-ScriptExecution {

	# Clear the screen
	cls

	write-host "`n Thank you for using the Windows PowerShell Game" `
		" Console"

	Start-Sleep 3 # Pause the execution of th script for 3 seconds

	cls # Clear the screen

}

$response = 0	# Stores player input

# Continue playing new games until the player decides to clse the game console
while($playAgain -eq "True") {

	# Call the function that generates an array containing a list of
	# game scripts
	$menuList = Get-GameListing

	# Call the function that converts the contents of the array into a
	# lis of menu items
	write-menulist $menuList

	# Prompt the player to pick a game to play
	$response = read-host "`n Enter the menu number for a game or Q" `
			      " to quit"

	# Prepare to close the game console when the user decides to quit
	if($response -eq "Q") {

		$playAgain = "False" 	# Modify variable value in order to
					# halt the loop

		continue # Repeat the loop

	}

	# Continue the player's input to an integer and then validate the
	# plaer's input
	if([int]$response -lt 1) { 	# Anything below 1 is not a valid 
					# menu number
		# Clear the screen
		cls

		write-host "`n `a`aInvalid selection."
		read-host 	# Pase the script until the player presses
				# the Enter key
		continue	# Repeat the loop
					
	}

	if([int]$response -gt $menuList.length) {

		# Clear the screen
		cls
		
		write-host "`n `a`aInvalid selection."
		read-host	# Pase the script until the player presses
				# the Enter key

		continue 	# Repeat the loop

	}

	Invoke-Expression $menuList[$response -1]	# Execute the
							# selected script

	# Clear the screen
	cls

}

End-ScriptExecution
