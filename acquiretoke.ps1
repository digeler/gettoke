

Import-Module ./gettoke.psm1
$t = Get-AuthenticationResult
$t.AccessToken > token.txt
Write-Host "Your token is in file name token.txt ,copy the content of the file and paste inside the submit box"
