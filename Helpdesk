# Retrieve information about a computer
$os = Get-WmiObject -Class Win32_OperatingSystem
$cpu = Get-WmiObject -Class Win32_Processor
$memory = Get-WmiObject -Class Win32_PhysicalMemory
$hdd = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}

Write-Host "Operating System: $($os.Caption) $($os.OSArchitecture)"
Write-Host "CPU: $($cpu.Name) $($cpu.NumberOfCores) cores"
Write-Host "Memory: $([Math]::Round($memory.Capacity/1GB,2)) GB"
Write-Host "Hard Drive: $($hdd.DeviceID) $([Math]::Round($hdd.Size/1GB,2)) GB"

# Reset a user's password
$username = Read-Host "Enter the username of the user whose password you want to reset"
$password = Read-Host -AsSecureString "Enter the new password"
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

$user = Get-WmiObject -Class Win32_UserAccount | Where-Object {$_.Name -eq $username}
$user.SetPassword($password)

Write-Host "Password successfully reset for user $username"

# Create a new user account
$username = Read-Host "Enter the username for the new user"
$password = Read-Host -AsSecureString "Enter the password for the new user"
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

$user = [wmiclass]"Win32_UserAccount"
$user.Create($username, $password, 2)

Write-Host "User $username successfully created"

# Add a user to a group
$username = Read-Host "Enter the username of the user you want to add to a group"
$group = Read-Host "Enter the name of the group"

Add-LocalGroupMember -Group $group -Member $username

Write-Host "User $username added to group $group"

# Remove a user from a group
$username = Read-Host "Enter the username of the user you want to remove from a group"
$group = Read-Host "Enter the name of the group"

Remove-LocalGroupMember -Group $group -Member $username

Write-Host "User $username removed from group $group"

# Enable or disable a user account
$username = Read-Host "Enter the username of the user whose account you want to enable or disable"
$enable = Read-Host "Enter 'enable' or 'disable'"

if ($enable -eq "enable") {
  Enable-LocalUser -Name $username
  Write-Host "User $username enabled"
} else {
  Disable-LocalUser -Name $username
  Write-Host "User $username disabled"
}

# Reset the Windows Firewall to its default settings
Reset-NetFirewallProfile
