# Get current signed-in user object
$user = az ad signed-in-user show | ConvertFrom-Json

# Set principal name based on presence of "#" in userPrincipalName
if ($user.userPrincipalName -like "*#*" -and $user.mail) {
    $env:AZURE_PRINCIPAL_NAME = $user.mail
    Write-Host "Found a '#' so using mail attribute: $user.mail"
} else {
    $env:AZURE_PRINCIPAL_NAME = $user.userPrincipalName
    Write-Host "There is no '#' so using userPrincipalName attribute: $user.userPrincipalName"
}

# Write to azd env
azd env set "AZURE_PRINCIPAL_NAME" "$env:AZURE_PRINCIPAL_NAME"

Write-Host "User Principal Name Obtained: $env:AZURE_PRINCIPAL_NAME"

