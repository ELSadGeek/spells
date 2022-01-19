Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# choco uninstall all -y
# choco install 7zip.install adobereader googlechrome vlc zoom libreoffice-fresh google-drive-file-stream paint.net chocolateygui ultravnc greenshot whatsapp naps2 intel-dsa webex-meetings microsoft-teams -y
Write-Host "Software actualizado"
Write-Host "FINALIZADO"
Start-Sleep -Seconds 15