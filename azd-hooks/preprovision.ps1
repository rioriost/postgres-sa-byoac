# Run azd auth login --check-status and capture the output
$userOutput = azd auth login --check-status

# Extract the first email address found in the output
# The reason for this is because some users may have multiple Entra ID principals
# associated to their logged in account, and this way we get the exact principal name
# from which azd is logged in with.  It takes the string of the return text of the command and
# extracts the first email address it finds in the string.
if ($userOutput -match "[\w\.\-]+@[\w\.\-]+\.\w+")
{
    $email = $matches[0]
    $env:AZURE_PRINCIPAL_NAME = $email

    Write-Host "Extracted email: $env:AZURE_PRINCIPAL_NAME"

    # Write to azd env
    azd env set "AZURE_PRINCIPAL_NAME" "$env:AZURE_PRINCIPAL_NAME"

    Write-Host "User Principal Name Set: $env:AZURE_PRINCIPAL_NAME"
}
else
{
    $errorMessage = "ERROR: No email address found in azd auth output."
    Write-Host $errorMessage
    throw $errorMessage
}