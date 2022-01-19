<#
.Synopsis
    Mantenimeinto diario PC's           
	  
.Description
	IT WORKS!
#>
$tempFolder1 = "C:\temp"
$tempFolder2 = "%USERPROFILE%\AppData\Local\Temp"
$days_ago = "-1" <# 0 Borra todo -1 Borra ayer hacia atrás #>
$del_older = $now.AddDays($days_ago)

Write-Output "-------------------------------------------------------------------------------
BKP:SYSTEMA  ::           INICIANDO SCRIPT DE LIMPIEZA SYSTEMAS
-------------------------------------------------------------------------------"

Get-ChildItem $tempFolder1 | Where-Object { $_.LastWriteTime -lt $del_older } | Remove-Item -Recurse -Verbose
Get-ChildItem $tempFolder2 | Where-Object { $_.LastWriteTime -lt $del_older } | Remove-Item -Recurse -Verbose
Remove-Item %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper #Por fin se van los wallpapers negros!!!!

Write-Output "-------------------------------------------------------------------------------
BKP:SYSTEMA  ::           FINALIZANDO SCRIPT DE LIMPIEZA SYSTEMAS
-------------------------------------------------------------------------------"
