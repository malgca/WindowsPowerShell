# Clear the windows command console screen
cls

# Define the variables used in this scrip to collect player inputs
$question = "" # This variable will be used to store the players question
$status = "Play" # This variable will be used to control game termination
$randomNo = New-Object System.Random # This variable stores a random object
$answer = 0 # This variable stores a randomly generated number
$time = (Get-Date).Hour # This variable stores the current hour of the day

# Display the game's opening screen
write-host
write-host
write-host
write-host
write-host "			WELCOME TO THE WINDOWS"
write-host
write-host
write-host
write-host
write-host "		       POWERSHELL FORTUNE TELLER"
write-host
write-host
write-host
write-host "			 By Jerry Lee Ford, Jr."
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host " Press Enter to continue."

# Pause script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls

# Provide the player with instructions
write-host
write-host " The fortune teller is a very busy and impatient mystic. Make"
write-host
write-host " your questions brief and simple and only expect to receive"
write-host
write-host " Yes / No styled answers."
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host " Press Enter to continue."

# Pause script execution and wait for the player to press the Enter key
read-host

# Continue gameplay until the player decides to stop
while($status -ne "Stop") {

	# Ask the player the first question
	while($question -eq "") {
		
		# Clear the windows command console screen
		cls
		
		write-host

		$question = read-host " What is your question? "

	}

	$question = "" # Reset variable to an empty string

	# Using the random object, get a random number between 1 and 4
	$answer = $randomNo.Next(1, 5)


	# Select an answer based on the time and the random number
	# If it is the afternoon the fortune teller will be a little cranky
	if($time -gt 12) {

		write-host
		if($answer -eq 1) { " Grrr. The answer is no!" }
		if($answer -eq 2) { " Grrr. The answer is never!" }
		if($answer -eq 3) { " Grrr. The answer is unclear!" }
		if($answer -eq 4) { " Grrr. The answer is yes!" }

	}

	# If it is morning, the fortune teller will be in a good mood
	
	else {

		write-host
		if($answer -eq 1) { " Ah. The answer is yes!" }
		if($answer -eq 2) { " Ah. The answer is always!" }
		if($answer -eq 3) { " Ah. The answer is uncertain!" }
		if($answer -eq 4) { " Ah. The answer is no!" }
	}

	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	write-host " Press Enter to continue."

	# Pause script execution and wait for the player to press the Enter key
	read-host

	# Clear the windows command console screen
	cls

	write-host

	# Prompt the player to continue to quit
	$reply = read-host " Press Enter to ask another question or type Q to quit."
	if($reply -eq "q") { $status = "Stop" }

}

# Claer the windows command console screen
cls

# Provide the player with instructions
write-host
write-host " Very well then. Please return again to get all your questions"
write-host " answered."
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host " Press Enter to continue."

# Pause script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls
