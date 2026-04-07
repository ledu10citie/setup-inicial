## Instala o servidor SSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

## Inicia o serviço
Start-Service sshd

## Configura para iniciar automaticamente com o Windows
Set-Service -Name sshd -StartupType 'Automatic'

## Garante que a regra de firewall esteja ativa
Get-NetFirewallRule -Name *OpenSSH-Server* | select Name, Enabled

New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
