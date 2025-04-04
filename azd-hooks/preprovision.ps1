# Set principal name based on presence of "#" in userPrincipalName
if ($user.userPrincipalName -like "*#*" -and $user.mail) {
    $env:AZURE_PRINCIPAL_NAME = $user.mail
} else {
    $env:AZURE_PRINCIPAL_NAME = $user.userPrincipalName
}

# Write to azd env
azd env set "AZURE_PRINCIPAL_NAME" "$env:AZURE_PRINCIPAL_NAME"

