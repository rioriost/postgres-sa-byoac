Get-Content ../.azure/rag120/.env | ForEach-Object {
    if ($_ -match "^\s*([^#][^=]*)=(.*)$") {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim('"').Trim()
        [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
    }
}
