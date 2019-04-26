Add-Type -Path "Microsoft.IdentityModel.Clients.ActiveDirectory.Platform.dll"
Add-Type -Path "Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
Add-type -Path "Newtonsoft.Json.dll"

function Get-AuthenticationResult
{
    $ErrorActionPreference = 'Stop'
    $VerbosePreference = 'Continue'

    # Detector-Local-Development app clientId
    $clientId = "21e09a0e-34d6-4e67-8e2e-a01fe5c8f2d5"
    $resourceId = "192bd8f2-c844-4977-aefd-77407619e80c"
    $redirectUri = New-Object system.uri("https://applens.azurewebsites.net")

    # Microsoft Tenant
    $tenantId = "72f988bf-86f1-41af-91ab-2d7cd011db47"
    $login = "https://login.microsoftonline.com"

    $promptBehavior = [Microsoft.IdentityModel.Clients.ActiveDirectory.PromptBehavior]::Never
    $platformParams = [Microsoft.IdentityModel.Clients.ActiveDirectory.PlatformParameters]::New($promptBehavior)

    $authContext = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext ("{0}/{1}" -f $login,$tenantId)
    $authenticationResult = $authContext.AcquireTokenAsync($resourceId, $clientID, $redirectUri, $platformParams).Result 

    return $authenticationResult
}