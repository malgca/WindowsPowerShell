# Description: Removes logs from my local thunderbird account.
# Author: Malusi Gcakasi
# Version: 0.1
# Last Modified: Mar 25, 2013 10:06 AM

# get the path to the utility account folder
$utilityFolder = "C:\Users\malgca\AppData\Roaming\Thunderbird\Profiles\gvj6wic1.default\logs\gtalk\malgca.utility@gmail.com"

# get the chat account log folders
$folders = @(ls -n $utilityFolder)

# make sure thunderbird isn't running, if it is, kill thunderbird and run the script
$running = $false
$thunderProcess = ps | ? { $_.ProcessName -eq "thunderbird" } # getting the process

if($thunderProcess -ne $null)
{
	write-host "Temporarily closing Mozilla Thunderbird in order to run script..."
	$running = $true
	kill $thunderProcess
	sleep -seconds 3
}

# iterate through the log folders and remove everything in them
for($i = 1; $i -lt $folders.Count; $i++)
{
	$folder = $folders[$i]
	write-host "Removing Logs..."
	rm -r "$utilityFolder\$folder"
	write-host "Logs removed successfully!"
}

# if thunderbird was running, bring it back up again
if($running)
{
	"Restarting Thunderbird"
	start thunderbird
}
