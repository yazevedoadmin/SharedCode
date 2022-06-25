#Este comando trás o uso da caixa de correio de todos os colaboradores da organização

Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Connect-ExchangeOnline

Get-Mailbox -ResultSize Unlimited | Get-MailboxStatistics |
Select DisplayName, @{n=”Total Size (MB)”;e={[math]::Round(($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB),2)}}, StorageLimitStatus

