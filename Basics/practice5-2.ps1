Get-ChildItem -Path "C:\Temp\Test"

$file = Get-ChildItem -Path "C:\Temp\Test" | where {$_.Name -like "*.csv"} | Select Name,Length

$sizeKB = $file.Length/1KB
$sizeMB = $file.Length/1MB

Write-Host "`nFile Name: "$file.Name
Write-Host "Size in KB: "$sizeKB
Write-Host "Size in MB: "$sizeMB