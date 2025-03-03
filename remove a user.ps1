#define the username to remove
$UserSamAccountName = "jdoe"

Remove-ADUser -Identity $UserSamAccountName
# Define the username to remove
$UserSamAccountName = "jdoe"

# Remove the user from AD
Remove-ADUser -Identity $UserSamAccountName

#this script removes a user 