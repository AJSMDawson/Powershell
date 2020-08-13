#Use to pull all active Office365 users that have any license, and export those licenses
$Msolcred = Get-Credentials
Connect-MsolService -Credential $msolcred
Get-MsolUser -all | where {$_.isLicensed -eq $true} | select Displayname, userprincipalname, islicensed, {$_.Licenses.AccountSkuId} | Export-CSV C:\UserExport.csv -NoTypeInformation
