$scriptPath = "C:\Program Files\BiggestElements"
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

if ($currentPath -notcontains $scriptPath) {
    [System.Environment]::SetEnvironmentVariable("Path", "$currentPath;$scriptPath", [System.EnvironmentVariableTarget]::Machine)
    Write-Output "Path updated successfully."
} else {
    Write-Output "Path already contains the script path."
}
