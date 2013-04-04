#clear any text from the command console
cls

# Start the knock knock joke
$userReply = ""

while( $userReply -ne "Who is there?") {
	$userReply = read-host "Knock Knock!"
}

cls

while( $userReply -ne "Orange who?") {
	$userReply = read-host "Orange"
}

cls

write-host "Orange you glad you created this PowerShell script?"

start-sleep -seconds 5

cls

while( $userReply -ne "Who is there?") {
	$userReply = read-host "Knock Knock!"
}

cls

while( $userReply -ne "Orange who?") {
	$userReply = read-host "Orange"
}

cls

write-host "Oranges are oranges but this is PowerShell scripting!"

start-sleep -seconds 5

cls

while( $userReply -ne "Who is there?") {
	$userReply = read-host "Knock Knock!"
}

cls

while( $userReply -ne "Banana who?") {
	$userReply = read-host "Banana"
}

cls

write-host "Orange you glad I didn't say orange?"

start-sleep -seconds 5

cls

write-output "The Knock Knock Joke..."
write-output ""
write-output "No credit will be given for jokes this bad..."

start-sleep -seconds 3

cls
