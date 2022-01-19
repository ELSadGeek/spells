
Write-Output "Iniciando script remoto sysmti.com.mx"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Set-ExecutionPolicy Unrestricted -Scope Process -Force; iex ((Get-Content 'https://sysmti.com.mx/scripts/start.ps1')) 
choco install powershell-core -y
Set-ExecutionPolicy Unrestricted -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://sysmti.com.mx/scripts/start.ps1'))