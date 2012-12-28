# Profile Variables
$isGitInstalled = Test-Path env:GIT_HOME

# Path Variables
$SCRIPTPATH = "~\Documents\WindowsPowerShell\Scripts"
$VIMPATH = "C:\Program Files (x86)\Vim\vim73\vim.exe"
$GVIMPATH = "C:\Program Files (x86)\Vim\vim73\gvim.exe"
$NETBEANSPATH = "C:\Program Files\NetBeans 7.2\bin\netbeans64.exe"
$NPPATH = "C:\Program Files (x86)\Notepad++\notepad++.exe"

# Custom Aliases
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH
Set-Alias gvi $GVIMPATH
Set-Alias gvim $GVIMPATH

Set-Alias nb $NETBEANSPATH
Set-Alias netbeans $NETBEANSPATH

# Functions
function nav($directory) 
{ 
	switch($directory)
	{
		"ant-tuts" { cd "~\Projects\Java\Tutorials\Ant2007" }
		default { $directory + " is not a valid nav directory" }
	}	
}

function edit-profile { vim $profile }

function edit-vimrc { vim "~\_vimrc" }

function edit-gvimrc { gvim "~\_gvimrc" }

function reload-profile {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }    
}

function git-add-vim 
{
	if(!$isGitInstalled)
	{
		Write-Host "Git is either not installed on this machine or set to its path variable."
		return
	}

	$currentDirectory = get-location
	
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
		git clone https://github.com/malgca/vim.git
		
		mv ~\vim\_gvimrc ~\gvimrc
		mv ~\vim\_vimrc ~\_vimrc
		mv ~\vim\abbreviations.vim ~\abbreviations.vim 

		return
	}

	git add _gvimrc _vimrc abbreviations.vim

	$commitNow = Read-Host "Your vim files have been staged. Would you like to push your changes up stream? [y] [n]"

	if(($commitNow -eq "y") -or 
	($commitNow -eq "Y") -or 
	($commitNow -eq "yes") -or
	($commitNow -eq "Yes"))
	{
		$commitMessage = Read-Host "What will your commit message be?"
		Write-Host "Committing..."
		git commit -m $commitMessage
		Write-Host "Now push!"
		git push
		return
	}
	else
	{
		Write-Host "Very good sir. Goodbye."
		return
	}

	if($currentDirectory.toString() -ne $home)
	{
		cd $currentDirectory
	}

	#TODO: Refactor this function into something that can be used for automating git adding and pushing for repo's that need it often (e.g. WindowsPowerShell repo.)
}
