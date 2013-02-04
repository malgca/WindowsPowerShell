<#   Prepare File List
$FileList=@(".\file0.txt",".\file1.txt",".\file2.txt",".\file3.txt",".\file4.txt", ".\file5.txt")

#   Clear FTP Directory
# $server = "www.newsbase.com"
$dir = "C:\Users\Moo\Documents\WindowsPowerShell\Scripts\Test\testArchive"

# open $server
# user derek bland1ne
# binary  
cd $dir    

For ($DelLoop=0; $DelLoop -le 5; $DelLoop++)
{
	$FileList[$DelLoop] | % { rm $FileList[$DelLoop] }
} #>

function deleteFTPSide 
{
	Param(
		[String] $ftpUserName = "b5_11374431",
		[String] $ftpDomain = "ftp.byethost5.com",
		[String] $ftpPassword = "Fireligh",
		[String] $ftpPort = 21,
		[String] $fileToDelete = "txtm8.byethost5.com/htdocs/tex.txt"
	)
	
	[String] $ftpPath = "ftp://"+"$ftpUserName"+":"+"$ftpPassword@$ftpDomain"+":"+"$ftpPort/$fileToDelete"

	write-host $ftpPath

	# create the FtpWebRequest and configure it
	$ftp = [System.Net.FtpWebRequest]::Create($ftpPath)
#	$ftp = [System.Net.FtpWebRequest]$ftp

	$ftp.Method = [System.Net.WebRequestMethods+Ftp]::DeleteFile
	
	$ftp.Credentials = new-object System.Net.NetworkCredential($ftpUserName,$ftpPassword)

	$ftp.UseBinary = $true
	$ftp.UsePassive = $true

	$response = [System.Net.FtpWebResponse]$ftp.GetResponse()
	$response.Close()
}

deleteFTPSide
