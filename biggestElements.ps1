param (
    [string]$Path = $HOME,
    [switch]$GridView
)

$files = Get-ChildItem -Path $Path -Recurse -Force -File | 
    Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | 
    Sort-Object { $_.SizeKB } -Descending

if ($GridView) {
    $files | Out-GridView
} else {
    $files | ForEach-Object {
        if ($_.SizeGB -ge 1) {
            "$($_.FullName) $([math]::round($_.SizeGB, 2))GB"
        } elseif ($_.SizeMB -ge 1) {
            "$($_.FullName) $([math]::round($_.SizeMB, 2))MB"
        } else {
            "$($_.FullName) $([math]::round($_.SizeKB, 2))KB"
        }
    }
}
