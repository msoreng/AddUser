# Define user details
$UserFirstName = "John"
$UserLastName = "Doe"
$UserSamAccountName = "jdoe"
$UserPassword = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force
$UserOU = "OU=Users,DC=yourdomain,DC=com"

#Create a new user
New-ADUser 
    -GivenName $UserFirstName 
    -Surname $UserLastName 
    -SamAccountName $UserSamAccountName 
    -UserPrincipalName "$UserSamAccountName@yourdomain.com" 
    -Name "$UserFirstName $UserLastName" 
    -Path $UserOU 
    -AccountPassword $UserPassword 
    -Enabled $true 
    -ChangePasswordAtLogon $true 
    -PassThru

#This script creates a new user in a specified Organizational Unit (OU) and forces a password change at first login.