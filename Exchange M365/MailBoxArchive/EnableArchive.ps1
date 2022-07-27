#Habilitar arquivo morto no Exchange Online
#Conecte-se no Exchange Online primeiro

#Habilitar por usuário
Enable-Mailbox -Identity UserMail -Archive
#Or
Enable-Mailbox UserMail -AutoExpandingArchive

#Habilitar para toda a organização
Get-Mailbox -Filter {ArchiveGuid -Eq "00000000-0000-0000-0000-000000000000" -AND RecipientTypeDetails -Eq "UserMailbox"} | Enable-Mailbox -Archive
#Or
Get-Mailbox -Filter {ArchiveStatus -Eq "None" -AND RecipientTypeDetails -eq "UserMailbox"} | Enable-Mailbox -Archive