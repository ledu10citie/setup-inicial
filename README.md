# setup-inicial


1. config

```sh
## Instala o servidor SSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

## Inicia o serviço
Start-Service sshd

## Configura para iniciar automaticamente com o Windows
Set-Service -Name sshd -StartupType 'Automatic'

## Garante que a regra de firewall esteja ativa
Get-NetFirewallRule -Name *OpenSSH-Server* | select Name, Enabled

```


2. Dica de mestre: Para não digitar senha toda vez, gere uma chave com ssh-keygen no seu Win e copie o conteúdo de ~/.ssh/id_rsa.pub para o arquivo `~\.ssh\authorized_keys` na máquina VPS.

3. Ferramentas "Backend-Friendly" Nativas

Uma vez dentro do terminal da máquina de teste, você pode gerenciar tudo sem GUI:

    Gerenciamento de Processos: Use o comando Get-Process ou o clássico tasklist.

    Logs em tempo real: Get-Content -Path "C:\logs\app.log" -Wait (Equivalente ao tail -f do Linux).

    Edição de Arquivos: O Windows 11 já vem com o vim ou nano instalados por padrão via PowerShell ou via instalação do Git. Se não tiver, você pode usar o comando notepad arquivo.txt e ele abrirá o bloco de notas na tela da máquina remota (se houver monitor) ou usar editores de terminal.

    Reiniciar Serviços: Restart-Service -Name "NomeDoSeuServico".

4. O "Pulo do Gato": Terminal como Default

Por padrão, o SSH do Windows abre o CMD. Como você é dev, provavelmente prefere o PowerShell. Para mudar o shell padrão do SSH na máquina remota:
PowerShell

## Rode isso na máquina remota como Admin

`New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force`

Por que isso é melhor para você?

    Nativo: Não gasta RAM com serviços de terceiros.

    Seguro: Usa criptografia de nível industrial.
