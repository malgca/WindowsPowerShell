# Clear the windows command console screen
cls

# Define the variables used in this script
$playGame = "True" 	# This variable controls game play
$randomNo = New-Object System.Random # This variable stores a random object
$number = 0		# This variable stores the numeric version of the
			# computer's move
$guess = 0		# This variable stores the numeric version of the
			# player's move
$playerMove = ""	# This variable stores the string version of the
			# player's move
$computerMove = ""	# This variable stores the string version of the
			# computer's move
$noPlayed = 0		# This variable keeps track of the number of 
			# games played
$noWon = 0		# This variable keeps track of the number of games
			# won
$noLost = 0		# This variable keeps track of the number of games
			# lost
$noTied = 0		# This variable keeps track of the number of games
			# tied

# Display the game's opening screen
write-host "`n`n`n`n`t`t`tWELCOME TO THE"
write-host "`n`n`n`t`tROCK, PAPER, SCISSORS GAME"
write-host "`n`n`n`t`t`t By Jerry Lee Ford, Jr."
write-host "`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

# Pause the game until the player presses the Enter key
read-host

# Loop until the player decides to quit
while($playGame -ne "False") {
	
	# Generate the game's random number (between 1 - 3)
	# Value assignment: 1 = Rock, 2 = Paper, 3 = Scissors
	$number = $randomNo.Next(1, 4)

	# Translate the computer's move to English
	if($number -eq 1) {$computerMove = "Rock"}
	if($number -eq 2) {$computerMove = "Paper"}
	if($number -eq 3) {$computerMove = "Scissors"}

	# Prompt the player to guess a number
	while($guess -eq "") {

		# Clear the windows command console screen
		cls

		# Display instructions
		write-host "`n`n"
		write-host " Enter one of the following options:`n"
		write-host " -------------------`n"
		write-host " R = Rock"
		write-host " P = Paper"
		write-host " S = Scissors"
		write-host " Q = Quit`n"
		write-host " -------------------`n`n`n`n`n`n`n`n`n`n"

		# Collect the player's guess
		$guess = read-host " Make a move"
		
		# Validate the player move
		if($guess -eq "Q") { # Player has decided to quit playing

			# Clear the windows command console screen
			cls

			write-host "`n`n"
			write-host " Game over. Thanks for playing" `
				   " Rock, Paper, Scissors."
			write-host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n"
			write-host " Press Enter to view game stats and" `
				   " quit the game."

			# Pause while the player reads the screen
			read-host
	
			$playGame = "False" # Set variable to false
					    # indicating the game is over
			
			# Skip the remainder of the loop
			continue

		}
		elseif(($guess -ne "R") -and ($guess -ne "P") `
			-and ($guess -ne "S")) {

			# Clear the windows command console screen
			cls

			write-host "`n`n`n Invalid input. Please try again."

			# Pause wihle the player reads the screen
			read-host

			$guess = "" # Clear out the playe's previous guess

			continue # Skip the remainder of the loop
		}

		# Translate the player's move to English		
		if($guess -eq "R") {$playerMove = "Rock"}
		if($guess -eq "P") {$playerMove = "Paper"}
		if($guess -eq "S") {$playerMove = "Scissors"}

		# Clear the windows command console screen
		cls

		write-host "`n`n`n Results:`n"
		write-host " ------------------`n"
		write-host " The computer picked: $computerMove`n"
		write-host " You picked: $playerMove`n"
		write-host " ------------------`n`n"

		$noPlayed += 1 # Increment count by 1

		switch($computerMove) {

			"Rock" { # The computer picked rock

				if($playerMove -eq "Rock") {
				
					$noTied += 1 # Increment count by 1
					write-host " You tie!"
				
				}

				if($playerMove -eq "Paper") {
				
					$noWon += 1 # Increment count by 1
					write-host " You win!"

				}

				if($playerMove -eq "Scissors") {
				
					$noLost += 1 # Increment count by 1
					write-host " You lose!"

				}
			}

			"Paper" { # The computer picked paper

				if($playerMove -eq "Rock") {
				
					$noLost += 1 # Increment count by 1
					write-host " You Lose!"
				
				}

				if($playerMove -eq "Paper") {
				
					$noTied += 1 # Increment count by 1
					write-host " You tie!"

				}

				if($playerMove -eq "Scissors") {
				
					$noWon += 1 # Increment count by 1
					write-host " You Won!"

				}
			}

			"Scissors" { # The computer picked rock

				if($playerMove -eq "Rock") {
				
					$noWon += 1 # Increment count by 1
					write-host " You win!"
				
				}

				if($playerMove -eq "Paper") {
				
					$noLost += 1 # Increment count by 1
					write-host " You lose!"

				}

				if($playerMove -eq "Scissors") {
				
					$noTied += 1 # Increment count by 1
					write-host " You tie!"

				}
			}
		}		
	
		# Pause the game until the player presses the Enter key
		read-host		

	}

	# Reset variables to prepare for a new round of play
	$number = 0		# Reset the computer's guess back to zero
	$guess = 0		# Reset the numeric version of the player's guess 
				# back to zero
	$playerMove = ""	# Reset the string version of the player's guess
				# back to an empty string
	$computerMove = ""	# Reset the string version of the player's guess
				# back to an empty string

}

# Clear the windows command console screen
cls

# Display the game statistics
write-host "`n`n`n Game Statistics`n"
write-host " ---------------------`n"
write-host "`n Number of games played: 	$noPlayed"
write-host "`n Number of games won:	$noWon"
write-host "`n Number of games lost:	$noLost"
write-host "`n Number of games tied:	$noTied"
write-host " ---------------------"
write-host "`n`n`n`n`n`n`n Press Enter to continue."

# Pause the game until the player presses the Enter key
read-host

# Clear the windows command console screen
cls
