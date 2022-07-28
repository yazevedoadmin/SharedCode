#Forçar a moviementação para o Arquivo Morto ignorando as regras de retenção.
#Conecte-se ao Exchange Online primiero.

#Sempre rodar os Get's primeiro para verificar as informações e no final para validar a execução.
Get-mailbox -identity UserMailBox |fl *retentionholdenable*
Get-mailbox -identity UserMailBox |fl *delayhold*
Get-Mailbox -identity UserMailBox | FL *HoldApplied*

#Colocar a politica que será utilizada (Atenção neste comando).
Set-Mailbox UserMailBox -RetentionPolicy "Default MRM Policy"

#Códigos de alteração para remover as politicas
Set-Mailbox UserMailBox -RetentionHoldEnabled $false
Set-Mailbox -Identity UserMailBox -RemoveDelayHoldApplied

#Comando que força a movimentação
Start-ManagedFolderAssistant -Identity UserMailBox