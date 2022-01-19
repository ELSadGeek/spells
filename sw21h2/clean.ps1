Remove-Item -Path C:\Windows\Temp -Recurse
Remove-Item -Path C:\Windows\Prefetch -Recurse
Remove-Item -Path $Env:USERPROFILE\AppData\Local\Temp -Recurse
Write-Host "Limpieza de carpetas completa"
Write-Host "FINALIZADO"
Start-Sleep -Seconds 15
