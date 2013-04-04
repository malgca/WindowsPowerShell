# Clear the windows command console screen
cls

# Define the variables used in this script to collect player input
$animal = "" #Stores t name of an animal supplied by the player
$vehicle = "" #Stores the name of a vehicle supplied by the player
$store = "" #Stores the name of a store supplied by the player
$dessert = "" #Stores the name of a dessert supplied by the player

# Display the game's opening screen
write-host
write-host
write-host
write-host
write-host
write-host "			THE STORY"
write-host
write-host
write-host
write-host
write-host " 		    OF THE THREE AMIGOS"
write-host
write-host
write-host
write-host 
write-host "		   By Jerry Lee Ford, Jr."
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

# Pause script execution and wait for the player to press the enter key.
read-host

# Clear the windows commad console screen
cls 

# Provide the player with instructions
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host " This is an interactive mad-lib styled story. Before it can be"
write-host
write-host " told, you must answer a few questions."
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

# Ask the player the first question
while($animal -eq "") {
	
	# Clear the windows command console screen
	cls

	write-host
	write-host
	write-host
	write-host
	write-host
	write-host

	$animal = read-host " Enter the name of a scary animal"

}

# Ask the player a second question
while($vehicle -eq "") {
	
	# Clear the windows command console screen
	cls

	write-host
	write-host
	write-host
	write-host
	write-host
	write-host
	
	$vehicle = read-host " Enter the name of a transport vehicle"

}

# Ask the player the third question
while ($store -eq "") {

	# Clear the windows command console screen
	cls

	write-host
	write-host
	write-host
	write-host
	write-host
	write-host

	$store = read-host " Enter the name of your favorite store"
}

# Ask the player the fourth question
while ($dessert -eq "") {
	
	# Clear the windows command console screen
	cls

	write-host
	write-host
	write-host
	write-host
	write-host
	write-host

	$dessert = read-host " Enter the name of you favorite dessert"

}

# Clear the windows command console screen
cls

# Provide the player with instructions
write-host
write-host
write-host
write-host
write-host
write-host " Once upon a time there were three very special children"
write-host " name Alexander, William and Molly. Alexander was the oldest"
write-host " and was known to be brave and strong. Molly, the youngest,"
write-host " was just five years old, yet she possessed an extraordinary"
write-host " sense of awareness that even the wisest sage would"
write-host " admire and respect. William, the middle child, was both brave"
write-host " and wise many times beyond his years. They lived together at"
write-host " the top of a hill, just outside the outskirts of town, where"
write-host " they faithfully watched over the townsfolk. Always together"
write-host " and always looking out for each other and the people in the"
write-host " town, they were known by everyone as The Three Amigos."
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
write-host
write-host
write-host
write-host
write-host
write-host " One day, which started out no different than any other day, a"
write-host " great roar was heard from the center of the town. Women and"
write-host " small children could be seen screaming and running in panic."
write-host " The Three Amigos climbed to the top of their watch tower and"
write-host " began scanning the town streets for the source of the noise."
write-host " and panic. Alexander was the first to find the problem,"
write-host " spotting a gigantic $animal moving quickly towards the"
write-host " mayor's office. Just ahead of the $animal stood the town's"
write-host " men, attempting to make a desparate stand."
write-host " 'Hurry, we must go!' shouted Molly. 'The town needs The"
write-host " Three Amigos!' In an instant, Alexander, William and Molly"
write-host " jumped into an old $vehicle, scarred and worn by years"
write-host " of faithful service, and hurriedly raced into town."
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
write-host
write-host
write-host
write-host
write-host
write-host " Within minutes, The Three Amigos found themselves standing in"
write-host " the center of Main street. The town was quiet and seemed"
write-host " almost deserted except for the old $store, where citizens"
write-host " had retreated once their last stand had failed. The $animal"
write-host " was standing in front of the $store, preparing to"
write-host " break in and kill the good citizens of the town."
write-host " 'What do we do?' said Alexander. William looked around and"
write-host " saw a pile of $dessert stacked up against the town"
write-host " barbershop's storefront. 'Follow me', yelled William,"
write-host " heading straight for the pile of $dessert. Alexander"
write-host " and Molly instantly knew what to do, each grabbing a $dessert"
write-host " and hurling pieces of $dessert at the animal. Unable to"
write-host " deal with the power of the attack launched by The Three"
write-host " Amigos the $animal fled the town, never to be seen or heard"
write-host " of again."
write-host
write-host
write-host " Press Enter to continue."

# Pause script execution and wait for the player to press the Enter key
read-host

# Clear the windows command console screen
cls

# Provide the player with instructions
write-host
write-host
write-host
write-host
write-host
write-host
write-host " The townsfolk ran out of the $store and began cheering for"
write-host " their heroes. Once again The Three Amigos has saved the day."
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host "				THE END"
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
