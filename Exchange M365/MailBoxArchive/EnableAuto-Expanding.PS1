#Habilitar o Arquivo morto auto-expansivo (Apenas para usuário com linceça Exchange Online Plan 2)
#Conecte-se ao Exchange Online primiero

#Se o valor indica True quer dizer que o arquivamento de expansão automática está habilitado para a organização.

#Verificar se está habilitado na organização
Get-OrganizationConfig | FL AutoExpandingArchiveEnabled

#Verificar se está habilitado para o usuário
Get-Mailbox UserMailbox | FL AutoExpandingArchiveEnabled

#Habilitar o auto expansivo por usuário
Enable-Mailbox UserMailbox -AutoExpandingArchive

#Habilitar para toda a organização
Set-OrganizationConfig -AutoExpandingArchive