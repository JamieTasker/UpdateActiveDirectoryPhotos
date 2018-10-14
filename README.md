# UpdateActiveDirectoryPhotos
A PowerShell function to update Active Directory thumbnail photos without the use of the Active Directory extension. 

The function connects to the AD domain of the PC running the code. It does not connect to any external domains. 

## Why use this over the Active Directory extension?
If you have access to the AD extension for PowerShell, use that instead. 
I created this function merely because as I was tasked with bulk updating AD user photos without any external tools. 

## How do I use the function?
Simply copy the code into your PowerShell script and call it as follows:
```powershell
Update-ADPhoto -username "USERNAME" -jpgfile "path\to\photo.jpg"
```
Easy!

## What OS does this work under?
The code was tested on PowerShell 1.0 under Windows 7.
I see no reason why it shouldn't run on later versions however.
