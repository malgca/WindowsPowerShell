# initialization section
# Define variables used in this script
$playGame = "True" 	# Controls gameplay and when to stop gameplay

$randomNo = New-Object System.Random # This variable stores a random object

$response = "" 		# Store the player's input when prompted to play a game

$number = 0		# Stores the game's randomly generated number

$secretWord = ""	# Stores the secret word for the current round of play

$attempts = 0		# Keeps track of the number of valid guesses made

$status = "True"	# Controls the current round of play a list of letters 
			# by the player during gameplay

$guesses = ""		# Stores player letter guesses

$reply			# Stores a display string with hidden characters
			# that is used to represent the secret word
			# during gameplay

$tempstring		# Stores the player's response when prompted to play
			# a new game

$validReply		# Stores the player's response when prompted to play a
			# new game


$rejectList = '~!@#$%^&*()_-+=[]{}:;\"<>,.?/|\\'   # String listing 
						   # unacceptable input
		
$GuessRemaining		# Keeps track of the number of guesses the player has 
			# left	

# Create an Associative array and load it with words
$words = @{}
$words[0] = @("","","","","","","","","","","","","","","")
$words[1] = @("C","O","M","M","A","N","D","E","R")
$words[2] = @("F","L","A","G")
$words[3] = @("T","O","A","S","T","E","R")
$words[4] = @("M","A","R","K","E","R")
$words[5] = @("P","I","C","T","U","R","E")
$words[6] = @("D","E","S","K")
$words[7] = @("G","L","O","B","E")
$words[8] = @("S","P","E","A","K","E","R")
$words[9] = @("B","A","C","K","Y","A","R","D")
$words[10] = @("P","E","N","C","I","L")

# functions and filters section

# This function determines if the players guess is correct or incorrect
function Check-Answer {
	param($reply) # Argument containing the players guess

	# Access script-level variable representing valid users guesses and
	# add the current guess to it
	$script:guesses = $script:guesses + " " + $reply

	# Loop through each letter in the secret word (e.g. each element 
	# in the array) and see if it matches the players guess
	for($i = 0; $i -le $secretWord.length - 1; $i++) {

		if($secretWord[$i] -ne $reply) { #The guess does not match

			# Place an underscore character into $word[0] in
			# place of the letter
			if($words[0][$i] -eq "") { $words[0][$i] = "_" }
		
		}
		else { # The guess match place the letter being guesed 
		       # into $word[0]
			$words[0][$i] = $reply
		}
	}
}

# main processing section
# Prompt the player to guess a number
while($playGame -ne "False") {

	# Clear the windows command console screen
	cls

	# Display the games opening screen
	write-host "`n`n`n`n"
	write-host " Welcome to the					********"
	write-host "						 *     *"
	write-host " PowerShell Hangman Game!			 O     *"
	write-host "						_|_    *"
	write-host "						 |     *"
	write-host "						/ \    *"
	write-host "						       *"
	write-host "						       *"
	write-host "						       *"
	write-host "						       *"
	write-host "						       *"
	write-host "						    *******"

	# Collect the players guess
	$response = read-host "`n`n`n`n`n`n Would you like to play? (Y/N)"

	# Validate the players input
	if($response -eq "Y") {

		$playGame = "True"
		$status = "True"
			
		# Reset variables at the beginning of each new round of play
		$tempString = ""
		$words[0] = @("", "", "", "", "", "", "", "", "", "", "", `
		"", "", "")
		$attempts = 0
		$guesses = ""
		$reply = ""

		# Generate a random number between 1 and 10
		$number = $randomNo.Next(1, 11)
		$secretWord = $words[$number] # Populate an array with the
					      # letters that make up the 
					      # games secret word using
					      # the random number to
					      # specify the array index


	}
	elseif($response -eq "N") {

		cls
		write-host "`n`n Please return and play again soon."
		read-host
		exit

	}
	else {

		# Clear the windows command console screen
		cls

		write-host "`n`n Invalid input. Please press Enter to" `
			   " try again."
		read-host
		continue
	}

	# Prompt the player to a letter
	while($status -eq "True") {

		# Create a loop collect and analyze player input
		while($reply -eq "") {
		
			# Clear the windows command consolse screen
			cls

			# Collect the player answer
			$reply = read-host "`n`n Enter a guess"
		
		}

		# Validate player input
		if($reply.Length -gt 1) { # Limit input to one 
					  # character at a time

			# Clear the windows command console screen
			cls

			write-host "`n`n Error: You may enter" `
			 " only one letter at a time."

			read-host "`n`n`n`n`n`n`n`n`n`n`n Press" `
			 " Enter to continue."

			$reply = "" # Clear out the players input

			continue # Repeat the loop
			
		}
					    
		if($reply.GetTypeCode() -ne "String") {
		 # Numeric input is not allowed
				
			# Clear the windows command console screen
			cls

			write-host "`n`n Error: Numeric guesses" `
			 " are not allowed."

			read-host "`n`n`n`n`n`n`n`n`n`n`n`n Press" `
			 " Enter to continue."

			$reply = "" # Clear out the players input

			contiinue
			
		}

		if($rejectList -match $reply) {

			# Clear the windows command console screen
			cls

			write-host "`n`n Error: Special" `
			 " characters are not permitted."

			read-host "`n`n`n`n`n`n`n`n`n`n`n Press" `
			 " Enter to continue."

			$reply = "" # Clear out the players input

			continue # Repeat the loop
			
		}

		# Clear the windows command console screen
		cls

		$attempts++ # Only increment for good guesses

		# Now that player input has been validated call on
		# the Check-Answer function to process the input
		Check-Answer $reply

		$tempString = "" # Clear out this variable used
				 # to display the current state of
				 # the word being guessed

		# Loop through $words[0] and create a temporary
		# display string that shows the state of the word
		# being guessed
		for($i = 0; $i -le $words[0].length - 1; $i++) {
			
			$tempString = $tempString + " " + `
			 $words[0][$i]

		}

		# Display the current state of the secret word
		# based on the input collected from the player
		write-host "`n`n Results:`n"
		write-host " -----------------`n"
		write-host " $tempString`n"
		write-host " -----------------`n`n"
		write-host " Letters that have been guessed: " `
		 " $guesses`n"

		# Calculate the number of guesses that the player
		# has left
		$GuessesRemaining = (12 - $attempts)

		# Display the number of guesses remaining in the
		# current round of play
		write-host " Number of guesses remaining: " `
		 "$guessesRemaining"
			
		# Pause the game to allow the player to review the
		# games status
		read-host "`n`n`n`n`n`n`n`n`n Press Enter to" `
		 " continue."

		# The secret word has been guessed if there are no
		# more underscore characters left in it - therefore
		# the player has guessed it
		if($tempString -notmatch "_") {
			
			write-host "`n Game over. You have" `
			 " guessed the secret word! In $attempts" `
			 " guesses.`n`n"

			write-host " The secret word was" `
			 " $secretWord `n`n"
			write-host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n"

			# Pause gameplay
			read-host

			$status = "false" # Signal the end of the
					# current round of play
				
			break # break out of the loop

		}

		# The player is only allowed 12 guesses. After
		# which the game ends.
		if($attempts -eq 12) {

			cls

			write-host "`n Game over. You have" `
			 " exceeded the maximum allowed number" `
			 " of guesses.`n`n"
			write-host " The secret word was" `
			 " $secretWord`n`n"
			write-host " The best you could do was" `
			 " $tempString`n`n`n`n`n`n`n`n`n`n`n`n" `
			 "`n`n`n"

			# Pause the game
			read-host
			
			# Signal the end of the current round 
			# of play
			$status = "false" 

			continue # Repeat the loop

		}

		$reply = "" # Clear out the players input

	}

}
