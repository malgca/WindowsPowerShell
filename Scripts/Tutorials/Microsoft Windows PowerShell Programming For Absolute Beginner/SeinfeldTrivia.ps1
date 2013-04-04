# Clear the windows command console screen
cls

# Define the variables used in this script to store player answers
$question1 = ""
$question2 = ""
$question3 = ""
$question4 = ""
$question5 = ""

# Define a variable to keep trackof the number of correctly answered 
# quiz questions
$noCorrect = 0

# Display the game's opening screen
write-host "`n`n`n`n`n`t`t WELCOME TO THE SEINFELD"
write-host "`n`n`n`t`t`t TRIVIA QUIZ"
write-host "`n`n`n`t`t`t By Jerry Lee Ford, Jr."
write-host "`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

# Pause script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls

# Provide the player with instructions
write-host "`n`n The Seinfeld Triva Quiz tests your knowledge of Seinfeld`n"
write-host " trivia. The quiz consists of five equally weighted multiple`n"
write-host " choice questions. At the end of the quiz your answers will`n"
write-host " be checked and you will be assigned a skill level, using`n"
write-host " the following scale.`n`n"
write-host "`t Score: 5 correct = Jerry (Expert)"
write-host "`t`t 4 correct = Kramer"
write-host "`t`t 3 correct = Elaine"
write-host "`t`t 2 correct = George"
write-host "`t`t 1 correct = Newman"
write-host "`t`t 0 correct = Babo (Clueless)"
write-host "`n`n`n`n Press Enter to continue."

# Pause script execution and wait for the player to press the Enter key
read-host

# Ask the player the first question
while(($question1 -ne "a") -and ($question1 -ne "b") `
	-and ($question1 -ne "c") -and ($question1 -ne "d")) {

	# Clear the windows command console screen
	cls

	write-host
	write-host " What is Kramer's first name?"
	write-host
	write-host " A. Peterman"
	write-host " B. Cosmo"
	write-host " C. Puddy"
	write-host " D. Peck"
	write-host

	$question1 = read-host "Type the letter representing the correct" `
				"answer and press the enter key"

}

# Clear the windows command console screen
cls

# Ask the player the second question
while(($question2 -ne "a") -and ($question2 -ne "b") `
	-and ($question2 -ne "c") -and ($question2 -ne "d")) {

	# Clear the windows command console screen
	cls

	write-host
	write-host " What was George's favorite pretend career?"
	write-host
	write-host " A. Bra Salesman"
	write-host " B. Real Estate"
	write-host " C. City Planner"
	write-host " D. Architect"
	write-host

	$question2 = read-host " Type the letter representing the correct" `
				"answer and press the Enter key"

}

# Clear the windows command console screen
cls

# Ask the player the third question
while(($question3 -ne "a") -and ($question3 -ne "b") `
	-and ($question3 -ne "c") -and ($question3 -ne "d")) {

	# Clear the windows command console screen
	cls

	write-host
	write-host " For whom did Elain buy white socks?"
	write-host
	write-host " A. Mr. Lippman"
	write-host " B. Mr. Peterman"
	write-host " C. Mr. Pitt"
	write-host " D. Puddy"
	write-host

	$question3 = read-host " Type the letter represening the correct" `
		"answer and press the Enter key"

}

# Clear the windows command console screen
cls

# Ask the player the fourth question
while(($question4 -ne "a") -and ($question4 -ne "b") `
	-and ($question4 -ne "c") -and ($question4 -ne "d")) {

	# Clear the windows command command console screen
	cls

	write-host
	write-host " What is Kramer scared of?"
	write-host
	write-host " A. Swimming"
	write-host " B. Fried Chicken"
	write-host " C. Clowns"
	write-host " D. The Dentist"
	write-host

	$question4 = read-host " Type the letter representing the correct" `
		"answer and press the Enter key"

}

# Clear the windows command console screen
cls

# Ask the player the fifth question
while(($question5 -ne "a") -and ($question5 -ne "b") `
	-and ($question5 -ne "c") -and ($question5 -ne "d")) {

	# Clear the windows command console screen
	cls

	write-host
	write-host " Where do Jerry's parents live?"
	write-host
	write-host " A. Kansas"
	write-host " B. New York"
	write-host " C. California"
	write-host " D. Florida"
	write-host

	$question5 = read-host " Type the letter representin the correct" `
		"answer and press the Enter key"

}

# Clear the windows command console screen
cls

write-host
write-host " OK, now press the Enter key to see how you did."

# Pause the script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls

# Grade the answers for each quiz question
if($question1 -eq "b") { $noCorrect++} # The answer to question 1 is "B"
if($question2 -eq "b") { $noCorrect++} # The answer to question 2 is "D"
if($question3 -eq "b") { $noCorrect++} # The answer to question 3 is "C"
if($question4 -eq "b") { $noCorrect++} # The answer to question 4 is "C"
if($question5 -eq "b") { $noCorrect++} # The answer to question 5 is "D"

# Assign a ranking based on quiz score
if($noCorrect -eq 0) {

	write-host
	write-host " You did not get any questions correct."
	write-host
	write-host " Your knowledge of Seinfeld trivia is no better than Babo's."

}

if($noCorrect -eq 1) {

	write-host
	write-host " You got 1 question correct."
	write-host
	write-host " Your knowledge of Seinfeld trivia is no better than" `
		"Newman's."

}

if($noCorrect -eq 2) {

	write-host
	write-host " You go 2 questions correct."
	write-host
	write-host " Your knowledge of Seinfeld trivia is approximately" `
		"that of George's."

}

if($noCorrect -eq 3) {

	write-host
	write-host " You got 3 questions correct."
	write-host
	write-host " Your knowledge of Seinfeld trivia is approximately" `
		"that of Elaine's."

}

if($noCorrect -eq 4) {

	write-host
	write-host " You got 4 questions correct."
	write-host
	write-host " Your knowledge of Seinfeld trivia is about as good" `
		"as Kramer's."

}

if($noCorrect -eq 5) {

	write-host
	write-host " You got 5 questions correct."
	write-host
	write-host " Your knowledge of Seinfeld trivia every bit as good" `
		"as Jerry's"

}

# Pause script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls

# Provide the player with instructions
write-host
write-host " Thanks for takning the Seinfeld Trivia Quiz!"

# Pause script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls
