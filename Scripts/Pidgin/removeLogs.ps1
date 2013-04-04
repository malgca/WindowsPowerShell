# Description: Removes logs from my local thunderbird account.
# Author: Malusi Gcakasi
# Version: 0.2
# Last Modified: Apr 04, 2013 09:31 AM

# get the path to the utility account folder
$utilityFolder = "C:\Users\malgca\AppData\Roaming\.purple\logs\jabber\malgca.utility@gmail.com"

# get the chat account log folders
$folders = @(ls -n $utilityFolder)

# make sure thunderbird isn't running, if it is, kill thunderbird and run the script
$running = $false
$process = ps | ? { $_.ProcessName -eq "pidgin" } # getting the process

if($process -ne $null)
{
	write-host "Temporarily closing Pidgin in order to run script..."
	$running = $true
	kill $process
	sleep -seconds 3
}

# iterate through the log folders and remove everything in them
for($i = 0; $i -lt $folders.Count; $i++)
{
	$folder = $folders[$i]
	write-host "Removing $folder's Logs..."
	rm -r "$utilityFolder\$folder"
	write-host "Logs removed successfully!"
}

# if thunderbird was running, bring it back up again
if($running)
{
	"Restarting Pidgin"
	start pidgin
}
