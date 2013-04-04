# Clear the windows command console screen
cls

# Define variables used in this script
$number = 0			# Keeps track of the game's secret number
$noOfGuesses = 0		# Keeps track of the number of guesses made
$randomNo = New-Object System.Random # This variable stores a random number
$playGame = "Yes"		# Control when to quit the game
$status = "Play"		# Controls the current round of play
$guess = 0			# Stores the player's guess
$reply = ""			# Stores the player's response when asked to
				# play again
				
# Display the game's opening screen
write-host "`n`n`n`n`t WELCOME TO THE GUESS MY"
write-host "`n`n`n`t`t`tNUMBER GAME"
write-host "`n`n`n`t`t`tBy Jerry Lee Ford, Jr."
write-host "`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

# Pause the game until the player presses the Enter key
read-host

# Loop until the player decides to quit the game
while($playGame -ne "No") {

	# Generate the game's random number (between 1 - 100)
	$number = $randomNo.Next(1, 101)

	# Clear the windows command console screen
	cls

	# Loop until the player guesses the secret number
	while($status -ne "Stop") {

		# Prompt the player to guess a number
		while($guess -eq "") {
		
			# Clear the windows command console screen
			cls

			write-host

			# Collect the player's guess
			$guess = read-host " Enter a number between 1 and 100"

		}

		# Keep track of the number of guesses made so far
		$noOfGuesses++

		if($guess -lt $number) { # The player's guess was too low

			# Clear the windows command console screen
			cls 

			write-host "`n Sorry. Your guess was too low." `
				" Press Enter to guess again."
			$guess = "" # Reset the player's guess
			read-host # Pause the game until the player
				# presses the Enter key

	}

	elseif($guess -gt $number) { # The player's guess was too high

		# Clear the windows command console screen
		cls

		write-host "`n Sorry. Your guess was too high. Press" `
			" Enter to guess again."

		$guess = "" # Reset the player's guess
		read-host # Pause the game until the player presses the
			# Enter key
	}

	else { # The player has guessed the game's secret number

		# Clear the windows command console screen
		cls

		write-host "`n Congratulations. You guessed my number!" `
			" Press Enter to continue."
		$status = "Stop" #Reset the player's guess
		read-host # Pause the game until the player preses the Enter key
	
	}

}
# Clear the windows command console screen
cls

# Display the game's opening screen
write-host "`n Game Statistics"
write-host " ---------------------------------------"
write-host "`n The secret number was: $number."
write-host "`n You guessed it in $noOfGuesses guesses.`n"
write-host " ---------------------------------------"
write-host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

# Pause the game until the player presses the Enter key
read-host

# Clear the windows command console screen
cls

$reply = "" # Stores the player's response when asked to play again

# Prompt the player to play another round
while($reply -eq "") {
	
	# Clear the windows command console screen
	cls

	write-host
	
	# Collect the player's answer
	$reply = read-host " Would you like to play again? (Y/N)"

	# Validate player input, allowing only Y and N as acceptable responses
	if(($reply -ne "Y") -and ($reply -ne "N")) {
		
		$reply = "" # Reset the variable to its default value
	}
}

# The player has elected to play again
if($reply -eq "Y") {

	# Reset variables to their defalt values
	$number = 0
	$noOfGuesses = 0
	$status = "Play"
	$guess = 0
	
}
	
else { # The player has decided to quit playing

	$playGame = "No" # Modify variable indicating that it is time
			 # to terminate gameplay

}
}
# Clear the windows command console screen
cls
