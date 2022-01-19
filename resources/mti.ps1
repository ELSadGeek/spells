winver.exe

# Z:\TI\1_antivirus\setup_kes.exe
# Z:\TI\3 AnyDesk\3 AnyDesk_MTI.exe
# # \\172.16.3.215\sysmti\BCUninstaller_4.16_portable\BCUninstaller.exe
# \\172.16.3.215\sysmti\Auslogics.Driver.Updater.1.24.0.1.Portable\AuslogicsDriverUpdaterPortable.exe
# # \\172.16.3.215\sysmti\Auslogics.Disk.Defrag.Pro.9.5.0.2.Portable\DiskDefragPortable.exe
# \\172.16.3.215\sysmti\CCleanerPortable\cc.exe
# Z:\TI\1 antivirus\setup_kes.exe
# Z:\TI\5 Office\LibreOffice_7.1.1_Win_x64.msi

#Configurar Servicios y 

Stop-Service -Force -Name "SysMain"; Set-Service -Name "SysMain" -StartupType Disabled
Stop-Service -Force -Name "WSearch"; Set-Service -Name "WSearch" -StartupType Disabled

#Chocolatey | instalación de paquetes.

Set-ExecutionPolicy Unrestricted  -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install 7zip.install adobereader googlechrome zoom microsoft-edge k-litecodecpackfull google-drive-file-stream paint.net chocolateygui ultravnc greenshot whatsapp naps2 intel-dsa webex-meetings microsoft-teams choco-update-notifier --ignore-checksums
choco upgrade all

#Mantenimiento

gpupdate /force
ipconfig /flushdns
Dism /Online /Cleanup-image /RestoreHealth
Remove-Item -Path C:\Windows\Temp -Recurse
Remove-Item -Path C:\Windows\Prefetch -Recurse
Remove-Item -Path $Env:USERPROFILE\AppData\Local\Temp -Recurse
Restart-Computer 
