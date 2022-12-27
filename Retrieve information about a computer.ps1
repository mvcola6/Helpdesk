# Retrieve information about a computer
$os = Get-WmiObject -Class Win32_OperatingSystem
$cpu = Get-WmiObject -Class Win32_Processor
$memory = Get-WmiObject -Class Win32_PhysicalMemory
$hdd = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}

$memorySize = ([Math]::Round(($memory | ForEach-Object {$_.Capacity} | Measure-Object -Sum).Sum/1GB,2))

Write-Host "Operating System: $($os.Caption) $($os.OSArchitecture)"
Write-Host "CPU: $($cpu.Name) $($cpu.NumberOfCores) cores"
Write-Host "Memory: $memorySize GB"
Write-Host "Hard Drive: $($hdd.DeviceID) $([Math]::Round($hdd.Size/1GB,2)) GB"
