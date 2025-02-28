# Define the group and users
$groupName = "low-admin"
$users = @("User1", "User2", "User3")

# Check if the group exists, create it if it doesn't
if (-not (Get-LocalGroup -Name $groupName -ErrorAction SilentlyContinue)) {
    try {
        New-LocalGroup -Name $groupName -Description "Low privilege administrators"
        Write-Host "Group '$groupName' created successfully."
    } catch {
        Write-Host "Failed to create group '$groupName'. Error: $_"
        exit
    }
} else {
    Write-Host "Group '$groupName' already exists."
}

# Loop through each user, create if necessary, and add them to the group
foreach ($user in $users) {
    # Check if the user exists
    if (-not (Get-LocalUser -Name $user -ErrorAction SilentlyContinue)) {
        try {
            New-LocalUser -Name $user -NoPassword -FullName $user -Description "Low Admin User"
            Write-Host "User '$user' created successfully."
        } catch {
            Write-Host "Failed to create user '$user'. Error: $_"
            continue
        }
    } else {
        Write-Host "User '$user' already exists."
    }

    # Add the user to the group
    try {
        Add-LocalGroupMember -Group $groupName -Member $user -ErrorAction Stop
        Write-Host "Successfully added '$user' to '$groupName'."
    } catch {
        Write-Host "Failed to add '$user' to '$groupName'. Error: $_"
    }
}
