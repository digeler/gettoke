
cd gettoke
Import-Module ./gettoke.psm1
$t = Get-AuthenticationResult
$t.AccessToken > token.txt
Write-Host "Your token is in file name token.txt ,copy this file and set the env varialble token=token context"
