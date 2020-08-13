#Pull Exchange Dynamic Distribution Group list
param(
$DistGroup
)
Get-Recipient -RecipientPreviewFilter get-dynamicdistributiongroup $DistGroup.RecipientFilter -OrganizationalUnit $group.RecipientContainer : Select Displayname | Export=Csv "C:\dynamicdistributiongroup.csv
