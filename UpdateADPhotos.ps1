##########################################
# UpdateADPhotos.ps1
# Author: Jamie Tasker
# Built on: 28/08/2018
# Purpose: Update a users Active Directory profile picture. 
##########################################

# Function to connect to AD and update the user photos. 
Function Update-ADPhoto {
    Param ([String]$username, [string]$jpgfile)

    # Connect to the AD. We use GetCurrentDomain() to avoid manually entering AD info.
    $domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
    $entry = $domain.GetDirectoryEntry()

    # Set up some search filters to ensure we are only searching for users matching a supplied accont name.
    $search = [System.DirectoryServices.DirectorySearcher]$entry
    $search.Filter = "(&(objectclass=user)(objectcategory=person)(samAccountName=$username))"
    $result = $search.FindOne()

    if ($result -ne $null)
    {
        # Update the user photo if they exist.
        $user = $result.GetDirectoryEntry()
        # Open photo and convert to bytes. 
        [byte[]]$jpg = Get-Content $jpgfile -encoding byte
        # Change user photo. 
        $user.put("thumbnailPhoto",  $jpg )
        $user.setinfo()
        Write-Host "Updated photo for:" $user.displayname
    }
    else {Write-Host $username " Does not exist"}
}
