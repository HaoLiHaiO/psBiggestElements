$scriptPath = "C:\Program Files\BiggestElements"
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
$newPath = ($currentPath -split ";") -ne $scriptPath -join ";"

if ($currentPath -contains $scriptPath) {
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
    Write-Output "Path updated successfully."
} else {
    Write-Output "Path does not contain the script path."
}
