Set-ExecutionPolicy Unrestricted -Force

Set-ExecutionPolicy RemoteSigned

Enable-PSRemoting

Install-Module -Name ExchangeOnlineManagement

Import-Module ExchangeOnlineManagement

Connect-ExchangeOnline

#Connect para operações diferentes
Connect-IPPSSession