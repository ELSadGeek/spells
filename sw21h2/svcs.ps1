Stop-Service -Force -Name "SysMain"; Set-Service -Name "SysMain" -StartupType Disabled
Stop-Service -Force -Name "WSearch"; Set-Service -Name "WSearch" -StartupType Disabled
Stop-Service -Force -Name "TapiSrv"; Set-Service -Name "TapiSrv" -StartupType Disabled
Stop-Service -Force -Name "MapsBroker"; Set-Service -Name "MapsBroker" -StartupType Disabled
Stop-Service -Force -Name "SNMPTRAP"; Set-Service -Name "SNMPTRAP" -StartupType Disabled
Stop-Service -Force -Name "Fax"; Set-Service -Name "Fax" -StartupType Disabled
Stop-Service -Force -Name "BITS"; Set-Service -Name "BITS" -StartupType Disabled
Stop-Service -Force -Name "WBioSrvc"; Set-Service -Name "WBioSrvc" -StartupType Disabled
Stop-Service -Force -Name "TabletInputService"; Set-Service -Name "TabletInputService" -StartupType Disabled
Stop-Service -Force -Name "XboxGipSvc"; Set-Service -Name "XboxGipSvc" -StartupType Disabled
Stop-Service -Force -Name "XblAuthManager"; Set-Service -Name "XblAuthManager" -StartupType Disabled
Stop-Service -Force -Name "WpcMonSvc"; Set-Service -Name "WpcMonSvc" -StartupType Disabled
Stop-Service -Force -Name "DiagTrack"; Set-Service -Name "DiagTrack" -StartupType Disabled
Stop-Service -Force -Name "lfsvc"; Set-Service -Name "lfsvc" -StartupType Disabled
Write-Host "Servicios desactivados"

Write-Host "FINALIZADO"
Start-Sleep -Seconds 15


