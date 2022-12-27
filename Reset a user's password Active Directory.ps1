$username = Read-Host "Enter the username of the user whose password you want to reset"
$password = Read-Host -AsSecureString "Enter the new password"
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

$user = Get-WmiObject -Class Win32_UserAccount | Where-Object {$_.Name -eq $username}
$user.SetPassword($password)

Write-Host "Password successfully reset for user $username"
