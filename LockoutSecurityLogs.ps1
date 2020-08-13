#Simple script to pull all accounts that were locked out

Get-EventLog -LogName Security  | Where-Object {$_.EventID -eq 4740} | Select-Object -Property Source, EventID, InstanceId, Message | ConvertTo-CSV | Out-File C:\Lockout.csv
