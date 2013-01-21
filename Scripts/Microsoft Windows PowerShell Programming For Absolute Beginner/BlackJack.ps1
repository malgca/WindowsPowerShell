$startGame = "False"		# Variable used to determine if the game
				# is played

$playerBusted = "False"		# Variable used to track when the player
				# busts

$randomNo = New-Object System.Random # This variable stores a random object

$playerHand = 0			# Stores the current value of the player's
				# hand

$computerHand = 0		# Stores the current value of the computer's
				# hand

$playAgain = "True"		# Controls the execution of the loop that
				# controls the execution of logic in the
				# main processing section

# This function gets the player's permission to begin the game
function Get-Permission {
	# Loop until a valid reply is collected
	while($startGame -eq "False") {
		# Clear the windows command console screen
		cls

		# Display the game's opening screen
		write-host "`n`n"
		write-host " Welcome to the" -foregroundColor Blue
		write-host ""
		write-host ""
		write-host " POWERSHELL BLACKJACK GAME" -foregroundColor Blue
		write-host ""
		write-host ""
		write-host ""
		write-host ""
		write-host ""
		write-host ""
		write-host ""
		write-host ""

		# Collect te player's input
		$response = read-host "`n`n`n`n`n`n`n Would you like to" `
			" play? (Y/N)"

		# Validate the player's input
		if($response -eq "Y") { # The player wants to play
			$startGame = "True"
		}
		elseif($response -eq "N") { # The player wants to quit
			Check-Registry
			exit # Terminate the script
		}
	}
}

# This function retrives a registry value that specifies whether or not the
# script should display a splash screen if the player chooses not to play a
# game aafter starting the script
function Check-Registry {

	# Clear the windows command console screen
	cls

	$currentLocation = Get-Location # Keep track of the current directory

	cd hkcu:\ # Change to the HKEY_CURRENT_USER hive

	# Retrieve the data stored in the Credits value under the
	# PSBlackJack subkey
	$regKey = $(Get-ItemProperty hkcu:\PSBlackJack).Credits

	if($regKey -eq "True") { # If the registry value is set to true
				 # display the closing splash screen

		write-host "`n`n`n"
		write-host " POWERSHELL BLACKJACK`n`n`n" 
			 -foregroundColor Blue
		write-host "	Developed by Jerry Lee Ford, Jr.`n`n"
		write-host "		Copyright 2007`n`n`n`n"
		write-host "	www.tech-publishing.com`n`n`n`n`n`n"

	}
	
	cd $currentLocation # Restore the current working directory

}

# This function controls the execution of an individual round of play
function Play-Game {

	# Call the function that deals the opening hands
	Deal-Hand

	# Call the function that manages the player's hand
	Get-PlayerHand

	# If the player has busted the game is over, otherwise it is the 
	# computer's turn
	if($script:playerBusted -eq "False") {

		# Call the function that manages the computer's hand
		Get-ComputerHand

	}

	# Call the function that analyzes the game results and declares
	# a winner
	Analyze-Results

}

# This function deals the player and the computer's initial hands
function Deal-Hand {

	# Assign a card to the player's hand
	$script:playerHand = Get-Card
	# Assign a card to the computer's hand
	$script:computerHand = Get-Card

}

# This function retrieves a random number representing a card and returns
# the value of that card back to the calling statement
function Get-Card {

	$number = 0

	# Generate the game's random number (between 1 - 13)
	$number = $randomNo.Next(1, 14)

	if($number -eq 1) {$number = 11} # Representing an ace
	if($number -gt 10) {$number = 10} # Representing a Jack, Queen or
					  # King
	$number # Return the number back to the calling statements

}

# This function is responsible for managing the computer's hand
function Get-ComputerHand {

	$tempCard = 0	# Stores the value of the computer's new card

	# The computer continues to take hits as long as its hand's
	# value is less than seventeen
	while($computerHand -lt 17) {

		$tempCard = Get-Card # Get a new card for the computer

		# Add the value of the new card to the computer's hand
		$script:computerHand = $script:computerHand + $tempCard

	}
}

# This function analyzes and displays the results of each game
function Analyze-Results {

	# Clear the windows command console screen
	cls

	# Display the player and computer's final hand
	write-host "`n`n`n`n RESULTS:`n`n"
	write-host " Player Hand: $playerHand`n"
	write-host " Computer Hand: $computerHand`n`n"

	# See if the player busted
	if($playerBusted -eq "True") {

		write-host "`a You have gone bust." -ForegroundColor Blue

	}
	else { # See if the computer bustd

		if($computerHand -gt 21) {

			write-host "`a The computer has gone bust." `
				-ForegroundColor Blue
		
		}
		else { # Neither the player nor the computer busted so look
		       # for a winner
			if($playerHand -gt $computerHand) {

				write-host "`a You Win!" -ForegroundColor Blue

			}
			if($playerHand -eq $computerHand) {

				write-host "`a Tie!" -ForegroundColor Blue

			}
			if($playerHand -lt $computerHand) {

				write-host "`a You lose." `
					-ForegroundColor Blue

			}
		}
	}
}

# This function displays the value of both the player and computer's
# current hands and prompts the player to take another card
function Get-PlayerHand {

	$keepGoing = "True"	# Control the execution of the loop that
				# manages the player's hand
	$response = ""		# Stores the player's input

	# Loop until a valid reply is collected
	while($keepGoing -eq "True") {

		# Clear the windows command console screen
		cls

		# Display the player and the computer's current hands
		write-host "`n`n"
		write-host ""
		write-host " CURRENT HAND:"
		write-host "`n"
		write-host " Player Hand:	$playerHand"
		write-host ""
		write-host " Computer Hand:	$computerHand"
		write-host ""
		write-host ""
		write-host ""
		write-host ""
		write-host ""
		write-host ""

		# Prompt the player to take another card
		$response = read-host "`n`n`n`n`n`n`n Do you want" `
			" another card? (Y/N)"

		# Validate the player's input
		if($response -eq "Y") {
			Get-NewCard # Get another card for the player
		}
		elseif($response -eq "N") { # The player wants to quit
			$keepGoing = "False"
			
			# Clear the windows command console screen
			cls
		}
		if($playerHand -gt 21) { # The player has gone bust
			$script:playerBusted = "True"
			$keepGoing = "False"
		}
	}
}

# This function is called whenever the player elects to get a new card
# and is responsible for updating the value of the player's hand
function Get-NewCard {

	$tempCard = 0 # Stores the value of the player's new card

	$tempCard = Get-Card # Get a new card for the player

	# Add the value of the new card to the player's hand
	$script:playerHand = $script:playerHand + $tempCard

}

Get-Permission	# Call function that asks the players for permission to 
		# start the game

# Continue playing new games until the player decides to quit the game
while($playAgain -eq "True") {
	# Call function that controls the play of individual games
	Play-Game

	# Prompt the player to play a new game
	$response = Read-Host "`n`n`n`n`n`n`n`n`n`n`n Press Enter to play" `
		" again or Q to quit"

	if($response -eq "Q") { # The plaer wants to quit

		$playAgain = "False"

		# Clear the windows command console screen
		cls
	}
	else { # The player did not enter Q so let's keep playing
		$playAgain = "True"
		$playerBusted = "False"
	}
}
