# Input bindings are passed in via param block.
param([byte[]] $InputBlob, $TriggerMetadata)

# Write out the blob name and size to the information log.
Write-Host "PowerShell Blob trigger function Processed blob! Name: $($TriggerMetadata.Name) Size: $($InputBlob.Length) bytes"

Push-OutputBinding -Name outputDocument -Value @{ 
    date     = Get-Date
    fileName = $TriggerMetadata.Name
    fileSize = $($InputBlob.Length)
    fileContents = [System.Text.Encoding]::ASCII.GetString($InputBlob)
} 