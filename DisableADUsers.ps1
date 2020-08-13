#Disable, Move, and remove groups from users in a CSV
#CSV should have UserName first, then the usernames needed.

Import-Module ActiveDirectory
$list = "PATH TO CSV"
$DisabledOU = "DISABLED OU HERE"


Import-CSV $list | ForEach-Object{
  $user = Get-ADUser -Identity $_.UserName -Properties MemberOf
  Disable-ADAccount -Identity $_.UserName
  #Comment/Remove next line if you do not disable Exchange mailboxes
  Disable-Mailbox -Identity $_.UserName
  $user | Move-ADObject -TargetPath $disabledUsersOU
  ForEach ($group in ($user | Select-Object -ExpandProperty MemberOf))
	{
		Remove-ADGroupMember -Identity $group -Members $user
	}



}
