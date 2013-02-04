# This scripts keeps my vim config scripts up to date with my git repo
$ErrorAction = "Inquire"
$isGitInstalled = Get-Command git -TotalCount 1
$isInternetConnected = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]�{DCB00C01-570F-4A9B-8D69-199FDBA5723B}�)).IsConnectedToInternet

function Push-Repo
{
	param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Switch]$auto=$false
	 )

	Begin # Things to do before processing this script.
	{
		# Ensure that Git is already installed.
		if(!($isGitInstalled -eq $null))
		{
			write-host "Git is either not installed on this machine or set to path."
			return
		}

		# Get the current location
		$currentDirectory = gl

		# Check if the user's home directory has been initialized.
		$isHomeGitInit = Test-path $home\.git
	}

	Process
	{
		if($currentDirectory.toString() -ne $home)
		{
			cd $home
		}

		$doesVimExist = Test-Path ~\_vimrc, ~\_gvimrc, ~\.vim

		if($doesVimExist -notmatch "false")
		{
			if(!$isInternetConnected) {
				write-host "Your vim files do not exist on this computer and you are not connected to the internet to download them."
				return
			}
			elseif(!$auto)
			{
				$download = "Your vim files do not exist on this computer. Would you like to download them now? [y] [n]"
				while($download -ne "y" -or $download -ne "n")
				{
					cls
					$download = "Invalid Input. Would you like to download your vim files? [y] [n]"
				}

				if($download -eq "y")
				{
					git clone https://github.com/malgca/.vim.git

					mv ~\.vim\_gvimrc ~\gvimrc
					mv ~\.vim\_vimrc ~\_vimrc
				}
				else 
				{
					return
				}
			}
			else
			{
				git clone https://github.com/malgca/.vim.git

				mv ~\.vim\_gvimrc ~\gvimrc
				mv ~\.vim\_vimrc ~\_vimrc
			}
		}

		git add _gvimrc _vimrc .vim

		if(!$auto)
		{
			$commitNow = Read-Host "Your vim files have been staged. Would you like to push your changes up stream? [y] [n]"

			while(($commitNow -ne "y") -and ($commitNow -ne "yes") -and ($commitNow -ne "n") -and ($commitNow -ne "no"))
			{
				$commitNow = Read-Host "Invalid input. Would you like to push your changes up stream? [y] [n]"
			}

			if(($commitNow -eq "y") -or ($commitNow -eq "yes")) {
				$commitMessage = Read-Host "What will your commit message be?"
				Write-Host "Committing..."
				git commit -m $commitMessage
				Write-Host "Pushing..."
				git push
			}
			elseif(($commitNow -eq "n") -or ($commitNow -eq "no")) {
				Write-Host "Very good sir. Goodbye."
				start-sleep -seconds 3
			}
			else {
				write-host "Invalid input. Press enter to try again."
				read-host
			}
		}
		else
		{
			$commitMessage = "Automatic commit of recent changes to vim files and directories."
			git commit -m $commitMessage
			Write-Host "Pushing..."
			git push

		}
	}

	End
	{
		if(!$auto)
		{
			if($currentDirectory.toString() -ne $home)
			{
				cd $currentDirectory
			}
		}
	}
}
