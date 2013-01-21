# This scripts keeps my vim config scripts up to date with my git repo
$isGitInstalled = Test-Path env:GIT_HOME
$isInternetConnected = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]‘{DCB00C01-570F-4A9B-8D69-199FDBA5723B}’)).IsConnectedToInternet

function Push-VimRepo 
{
	if(!$isGitInstalled)
	{
		write-host "Git is either not installed on this machine or set to path"
		return
	}

	$currentDirectory = gl
	
	if($currentDirectory.toString() -ne $home)
	{
		cd $home
	}

	$isHomeGitInit = Test-path $home\.git
	
	if(!$isHomeGitInit)
	{
		git init
	}

	$doesVimrcExist = Test-Path _vimrc

	if(!$doesVimrcExist)
	{
		if(!$isInternetConnected) {

			return

		}
		git clone https://github.com/malgca/vim.git
		
		mv ~\vim\_gvimrc ~\gvimrc
		mv ~\vim\_vimrc ~\_vimrc
		mv ~\vim\abbreviations.vim ~\abbreviations.vim 
		rmdir ~\vim
	}

	git add _gvimrc _vimrc .vim

	$commitNow = Read-Host "Your vim files have been staged. Would you like to push your changes up stream? [y] [n]"
	
	while(($commitNow -ne "y") -and ($commitNow -ne "yes") `
		-and ($commitNow -ne "n") -and ($commitNow -ne "no"))
	{
		if(($commitNow -eq "y") -or ($commitNow -eq "yes"))
		{
			$commitMessage = Read-Host "What will your commit message be?"
			Write-Host "Committing..."
			git commit -m $commitMessage
			Write-Host "Now push!"
			git push
		}
		elseif(($commitNow -eq "n") -or ($commitNow -eq "no"))
		{
			Write-Host "Very good sir. Goodbye."
			start-sleep -seconds 3
		}
		else {
			write-host "Invalid input. Press enter to try again."
			read-host
		}
	}
	if($currentDirectory.toString() -ne $home)
	{
		cd $currentDirectory
	}
	
	exit "Successfully ran Upload-VimRepo function."
	#TODO: Refactor this function into something that can be used for automating git adding and pushing for repo's that need it often (e.g. WindowsPowerShell repo.)
}
