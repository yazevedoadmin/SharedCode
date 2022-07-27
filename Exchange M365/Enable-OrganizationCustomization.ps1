#Este comando é util para quando tentamos realizar alterações no Microsoft 365 e ele solicita que tenha está fucnoonalidade 
#(Exemplo alteração de politicas e regras (Security Painel)).

#Connect to Exchange Online
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Connect-ExchangeOnline

#Enable function
Enable-OrganizationCustomization