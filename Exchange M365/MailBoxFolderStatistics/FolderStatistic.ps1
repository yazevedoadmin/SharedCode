#Este comando é utilizado para trazer o uso de uma pasta da caixa de correio.
#No exemplo abaixo trás a ReverableItems.

Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Connect-ExchangeOnline

$All = Get-Mailbox -ResultSize Unlimited
$All | foreach {Get-MailboxFolderStatistics -Identity $_.Identity -FolderScope RecoverableItems | Format-Table Identity,FolderAndSubfolderSize -AutoSize}