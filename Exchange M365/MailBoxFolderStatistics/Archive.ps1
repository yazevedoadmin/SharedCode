#Este comando trás o uso do arquivo morto da caixa de todos os colaboradores da organização
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Connect-ExchangeOnline

$Result=@()
$mailboxes = Get-Mailbox -ResultSize Unlimited
$totalmbx = $mailboxes.Count
$i = 1
$mailboxes | ForEach-Object {
$i++
$mbx = $_
$size = $null

Write-Progress -activity "Processing $mbx" -status "$i out of $totalmbx completed"

if ($mbx.ArchiveStatus -eq "Active"){
$mbs = Get-MailboxStatistics $mbx.UserPrincipalName

if ($mbs.TotalItemSize -ne $null){
$size = [math]::Round(($mbs.TotalItemSize.ToString().Split('(')[1].Split(' ')[0].Replace(',','')/1MB),2)
}else{
$size = 0 }
}

$Result += New-Object -TypeName PSObject -Property $([ordered]@{
UserName = $mbx.DisplayName
UserPrincipalName = $mbx.UserPrincipalName
ArchiveStatus =$mbx.ArchiveStatus
ArchiveName =$mbx.ArchiveName
ArchiveState =$mbx.ArchiveState
ArchiveMailboxSizeInMB = $size
ArchiveWarningQuota=if ($mbx.ArchiveStatus -eq "Active") {$mbx.ArchiveWarningQuota} Else { $null}
ArchiveQuota = if ($mbx.ArchiveStatus -eq "Active") {$mbx.ArchiveQuota} Else { $null}
AutoExpandingArchiveEnabled=$mbx.AutoExpandingArchiveEnabled
})
}
$Result | Export-CSV "C:\Archive-Mailbox-Report.csv" -NoTypeInformation -Encoding UTF8
Once you successfully run the above script, the output will be available in the Powershell object $Result. You can just filter the $Result array with Where-Object to generate further reports from this object. For example, run the below command to get details for the only archive enabled mailboxes.

1
$Result | Where-Object { $_.ArchiveStatus -eq "Active" } | Select UserName, UserPrincipalName, ArchiveMailboxSizeInMB, ArchiveWarningQuota, ArchiveQuota