# Script to automate downloading manga
# Version: 1.0
# Maintainer: Malusi Gcakasi
# Last Modified: 

$mangaPanda = "www.mangapanda.com/"					# Site from which to download manga

function downloadManga {
	Param(
		$ErrorActionPreference = "Stop",
		[Parameter(Position = 0, Mandatory = $true)]
		[String]$mangaName,				# Name of manga to download must be specified		
		[String]$mangaChapter = ""		# Chapter of manga to download, if not specified, 
										# will automatically download latest one.
	)

	Begin
	{
		$ie = New-Object -com "InternetExplorer.Application" 	# Open IE
		$ie.Navigate($mangaPanda+"alphabetical")				# Go to the manga list page

		write-host "getting busy"
		while ($ie.Busy) { start-sleep 5 }	# Pause everything while i.e is working
		write-host "done being busy"

		$doc = $ie.Document		# Get the page document that we're now exploring

		write-host "getting links"
		# TODO: Convert following array to dictionary for speed.
		$linkArray = ([System.String]$doc.getElementById("wrapper_body").InnerHtml).Split("`r`n")
	}

	Process
	{	
		# Get first manga entry which roughly matches the search string
		$mangaEntry = $linkArray | where { $_ -match $mangaName } | select -first 1

		# Get manga link length, starting at first "  and ending at last (" - 2) to get 
		# rid of trailing "
		$linkLength = ($mangaEntry.LastIndexOf("`"") - 2) - ($mangaEntry.IndexOf("`""))

		$mangaLink = $mangaEntry.SubString($mangaEntry.IndexOf("`"") + 2, $linkLength)

		# Navigate to manga page
		$ie.Navigate($mangaPanda+$mangaLink)

		write-host ($ie -eq $null)
		write-host "getting busy... again..."
		while ($ie.Busy) { start-sleep 5 }	# Pause everything while i.e is working
		write-host "done being busy... again..."

		# Update doc to get current page's html
		$doc = $ie.Document

		# Start Chapter Operations here
		write-host "Going to the chapter operations..."
		
		# Get array of available chapters
		$chapterArray = ([System.String]$doc.getElementById("listing").innerHtml).Split("`r`n")

		# If the chapter to download isn't specified, download the latest one. Else, download the
		# specified chapter
		$chapterEntry = $chapterArray | where { $_ -match ($mangaName+' '+$mangaChapter).trim() } | select -last 1
		
		# Get the length of latest chapters' url, starting at first " and ending at last (" - 2)
		# to get rid of trailing "
		$chapterLinkLength = ($chapterEntry.LastIndexOf("`"") - 2) - ($chapterEntry.IndexOf("`""))

		$chapterLink = $chapterEntry.Substring($chapterEntry.IndexOf("`"") + 2, $chapterLinkLength)

		write-host "Page operations starting"
		# Navigate to the chapter's first page and get a list of the available pages links
		$ie.Navigate($mangaPanda+$chapterLink)

		write-host "getting busy... for pages this time..."
		while ($ie.Busy) { start-sleep 5 }	# Pause everything while i.e is working
		write-host "done being busy... for pages this time..."

		# Update doc to get current page's html
		$doc = $ie.Document

		$pagesArray = ([System.String]$doc.getElementById("pageMenu").innerHtml).Split("`r`n")

		# Create a directory to put this under (for now will put it in "Downloads\Manga\$mangaName\$mangaChapter")
		$mangaChapter = $chapterLink.Substring($chapterLink.LastIndexOf("/") + 1)
		$mangaDir = "C:\Users\$env:USERNAME\Downloads\Manga\$mangaName\$mangaChapter\"

		if(-not(Test-Path $mangaDir))
		{
			write-host "Creating $mangaDir"
			mkdir $mangaDir
		}

		write-host "Downloading pages---------------------------------"

		# Create a web client to download the file
		$webClient = New-Object System.Net.WebClient

		for($i = 0; $i -lt $pagesArray.Count - 1; $i++)	
		{
			# Get the length of the link for each individual page.
			$pageLinkLength = ($pagesArray[$i].LastIndexOf("`"") - 1) - $pagesArray[$i].IndexOf("/")
			# Get the actual link for each individual page.
			$pageLink = $pagesArray[$i].Substring($pagesArray[$i].Indexof("/") + 1, $pageLinkLength)

			# Navigate to the chapter's current page and download the page
			$ie.Navigate($mangaPanda+$pageLink)

			write-host "getting page $i"
			while ($ie.Busy) { start-sleep 5 }	# Pause everything while i.e is working
			write-host "done page $i"

			# Update doc to get current page's html
			$doc = $ie.Document

			$img = [System.String]$doc.getElementById("img").src

			$imgExtension = $img.Substring($img.LastIndexOf("."))
			$localPath = $mangaDir + ($i + 1) + $imgExtension

			if(-not (Test-Path $localPath))
			{
				$img
				$webClient.DownloadFile($img, $localPath)
			}
		}
	}

	End
	{
		read-host
		kill -name iexplore # Brute force destruction of Internet Explorer in case it's still lingering.
	}
}

downloadManga "Claymore"
