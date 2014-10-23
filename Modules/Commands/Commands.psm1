function Remove-RailsServer() {
	$processPath = "C:\Sites\railsbridge\suggestotron\tmp\pids\server.pid";
	
	if(Test-Path $processPath) {
		rm $processPath;
	} else {
		write-host "The server process file does not exist."
	}
}

Set-Alias rrs Remove-RailsServer

Export-ModuleMember * -Alias *
