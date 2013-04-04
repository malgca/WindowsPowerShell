# Define variables used in this script

$startGame = "False"		# Controls when the game terminates
$playGame = "True"		# Controls th play of an individual round
				# of play
$player = "X"			# Specifies the current player's turn
$winner = ""			# Specifies the winner
$moves = 0			# Counts the number of moves made
$move = ""			# Stores the current player's move
$tie = "False"			# Specifies when a tie occurs

# Variables representing game board squares

$A1 = " "
$A2 = " "
$A3 = " "
$B1 = " "
$B2 = " "
$B3 = " "
$C1 = " "
$C2 = " "
$C3 = " "

# This function resets variables representing variable board squares
function Clear-Board {

	$script:A1 = " "
	$script:A2 = " "
	$script:A3 = " "
	$script:B1 = " "
	$script:B2 = " "
	$script:B3 = " "
	$script:C1 = " "
	$script:C2 = " "
	$script:C3 = " "

}

# This function gets the player's permission to start a round of play
function Get-Permission {

	# Loop until a valid reply is collected
	while($startGame -eq "False") {

		# Clear the windows command console screen
		cls

		# Display the game's opening screen
		write-host "`n`n`n`n"
		write-host "				|	|"
		write-host "	Welcome to the      X   |   O   |"
		write-host "				|	|"
		write-host "			------------------------"
		write-host "				|	|"
		write-host "    TIC - TAC - TOE		|   X	|"
		write-host "				|	|"
		write-host "			------------------------"
		write-host "				|	|"
		write-host "	      GAME		|   O   |   X"
		write-host "				|	|"

		# Collect the player's input
		$response = read-host "`n`n`n`n`n`n`n Would you like to" `
			" play? (Y/N)"

		# Validate the player's input
		if($resonse -eq "Y") { # The player wants to play a new round

			$startGame = "True"

		}
		elseif($response -eq "N") { # The player wants to quit

			$startGame = "False"

			# Clear the windows command console screen
			cls

			# Terminate script execution
			exit
		
		}
	}
}

# This function displays the game board, showing each player's moves
function Display-Board {

	# Clear the windows command console screen
	cls

	# Display the game board
	write-host "`n`n			TIC - TAC - TOE`n`n`n"
	write-host "`n`n			   1        2       3`n"
	write-host "				|	|"
	write-host "		     A     $A1    |   $A2   |   $A3"
	write-host "				|	|"
	write-host "			------------------------"
	write-host "				|	|"
	write-host "		     B     $B1    |   $B2	|   $B3"
	write-host "				|	|"
	write-host "			------------------------"
	write-host "				|	|"
	write-host "		     C     $C1	|   $C2	|   $C3"
	write-host "				|	|"
	
	# Collect player move
	$move = read-host "`n`n`n`n Player $player's turn"
	$move # Return the player's input to the calling statement

}

# This function determines if the player's input is valid
function Validate-Move {

	if($move.length -eq 2) { 
		# Valid moves consist of 2 characters - Use regular
		# expression test that looks for instance of A, B and C
		# and instance of 1, 2 and 3
		if($move -match "[A-C][1-3]") {

			$result = "Valid"

		}
		else {

			# The move is invalid if it is not A1, A2, A3
			# B1, B2, B3, C1, C2 or C3
			$result = "Invalid"
		}
	}
	else {
		
		# The move is invalid if it does not consist of 2 characters
		$result = "Invalid"

	}

	# Move is invalid if it has already been assigned to a player
	# during a previous turn
	if(($move -eq "A1") -and ($A1 -ne " ")) {$result = "Invalid"}
	if(($move -eq "A2") -and ($A2 -ne " ")) {$result = "Invalid"}
	if(($move -eq "A3") -and ($A3 -ne " ")) {$result = "Invalid"}
	if(($move -eq "B1") -and ($B1 -ne " ")) {$result = "Invalid"}
	if(($move -eq "B2") -and ($B2 -ne " ")) {$result = "Invalid"}
	if(($move -eq "B3") -and ($B3 -ne " ")) {$result = "Invalid"}
	if(($move -eq "C1") -and ($C1 -ne " ")) {$result = "Invalid"}
	if(($move -eq "C2") -and ($C2 -ne " ")) {$result = "Invalid"}
	if(($move -eq "C3") -and ($C3 -ne " ")) {$result = "Invalid"}

	# Return this value to the statement that called this function
	$result
}

# This function checks the game board to see if there is a winner
function Check-Results {

	$winner = "" # Always reset this value before checking

	# Look for a winner horizontally
	if(($A1 -eq $player) -and ($A2 -eq $player) -and ($A3 -eq $player)) {

		$winner = $player

	}

	if(($B1 -eq $player) -and ($B2 -eq $player) -and ($B3 -eq $player)) {

		$winner = $player

	}

	if(($C1 -eq $player) -and ($C2 -eq $player) -and ($C3 -eq $player)) {

		$winner = $player

	}

	# Look for a winner vertically
	if(($A1 -eq $player) -and ($B1 -eq $player) -and ($C1 -eq $player)) {

		$winner = $player

	}

	if(($A2 -eq $player) -and ($B2 -eq $player) -and ($C2 -eq $player)) {

		$winner = $player

	}

	if(($A3 -eq $player) -and ($B3 -eq $player) -and ($C3 -eq $player)) {

		$winner = $player

	}

	# Look for a winner diagonally
	if(($A1 -eq $player) -and ($B2 -eq $player) -and ($C3 -eq $player)) {

		$winner = $player

	}

	if(($A3 -eq $player) -and ($B2 -eq $player) -and ($V1 -eq $player)) {

		$winner = $player

	}

	$winner # Return this value to the statement that called this
		# function
}

# This function displays the game board and the final results of a round
# of play
function Display-Results {

	# Clear the windows command console screen
	cls

	# Display the game board
	


	if($tie -eq "True") { # Check to see if the game resulted in a tie

		read-host "`n`n`n`n The game has ended in a tie." `
			" Press Enter to continue."

	}
	else { # If a tie did not occur, identify the winner
	
		read-host "`n`n`n`n Game over. $player has won. Press" `
			" Enter to continue."

	}
}

# Call function that resets the game board
cls

# Call function that asks the players for permission to start a new
# round of play

while($Terminate -ne "True") { # Loop until the player decides to quit

	# This loop controls the logic required to play a round of 
	# Tic - Tac - Toe
	while($playGame -eq "True") { 
	
		$move = Display-Board # Call function that displays the 
				      # game board and collects player moves
				      
		$validMove = Validate-Move # Call the function that
					   # validates player moves

		if($validMove -eq "Valid") { #Process valid moves

			# Increment variable that keeps track of the
			# number of valid moves
			$moves++

			# Assign the appropriate game board square to the
			# player that selected it
			if($move -eq "A1") {$A1 = $player}
			if($move -eq "A2") {$A2 = $player}
			if($move -eq "A3") {$A3 = $player}
			if($move -eq "B1") {$B1 = $player}
			if($move -eq "B2") {$B2 = $player}
			if($move -eq "B3") {$B3 = $player}
			if($move -eq "C1") {$C1 = $player}
			if($move -eq "C2") {$C2 = $player}
			if($move -eq "C3") {$C3 = $player}

		}
		else { # Process invalid moves

			# Clear the windows command console screen
			cls

			read-host "`n`n`n`n`n`n`n`n`nInvalid Move." `
				" Press Enter to try again."

			continue # Repeat this loop
		}

		$winner = Check-Results # Call function that determines
					# if the game s over and who, if
					# anyone, has won
		if($winner -eq "X") { # Perform the following actions
				      # when Player X wins
			
			write-host `a # Make a beep sound
			Display-Results # Call function that displays game
				       # results
			$playGame = "False"
			continue # Repeat this loop

		}

		if($winner -eq "O") { # Perform the following actions
				      # when Player O wins
			write-host `a # Make a beep sound
			Display-Results # Call function that displays
					# game results
			$playGame = "False"
			continue # Repeat this loop

		}

		if($moves -eq 9) { # Perform the following actions when a
				   # tie occurs

			write-host `a # Make a bep sound
			$tie = "True"
			Display-Results # Call function that displays the 
					# game's results
			$playGame = "False"
			continue # Repeat this loop
		
		}

		# The game is not over yet so switch player turn
		if($playGame -eq "True") {

			if($player -eq "X") {
				
				$player = "O"

			}
			else {

				$player = "X"
			
			}
		}

		# This next set of statements only runs when the current
		# round of play has ended

		$response = "False" # Set default value in order to
				    # ensure the loop executes

		# Loop until valid input is received
		while($response -ne "True") {

			# Clear the windows command console screen
			cls

			# Prompt the player to play a new game
			$response = read-host "`n`n Play again? (Y/N)"

			# Validate the player's input - Keep playing
			if($response -eq "Y") {

				# Reset default variable settings to get
				# ready for a new round of play
				$response = "True"
				$terminate = "False"
				$playGame = "True"

				Clear-Board
			
				$player = "X"
				$moves = 0
				$tie = "False"

			}
			elseif($response -eq "N") { # Time to quit

				# Clear the windows command console screen
				cls

				write-host "`n`n Please return and play" `
				 " again soon."

				read-host # Pause gameplay

				$response = "True"
				$terminate = "True"

			}
			else { # Invalid input received

				# Clear the windows command console screen
				cls

				write-host "`n`n Invalid input. Please" `
				 " press Enter to try again."

				read-host # Pause gameplay

			}
		}
	}
}

