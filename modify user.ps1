#define user details
$UserSamAccountName = "jdoe"
$NewTitle = "IT Manager"
$NewDepartment = "Information Technology"
$NewPhone = "555-1234"

#modify user properties 
Set-ADUser -Identity $UserSamAccountName 
    -Title $NewTitle 
    -Department $NewDepartment `
    -OfficePhone $NewPhone

#This script updates a users title, department and phone number