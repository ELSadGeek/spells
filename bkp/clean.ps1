<#
.Synopsis
    Limpieza de archivos temporales generados por los sistemas VisualFOx
	  
.Description
	IT WORKS!
#>
param (
   
    [string]$t = ":" 
    
)

$now = Get-Date
$tempC = "C:\temp"
$tempS = "C:\$t\temp"
$days_ago = "-1" <# 0 Borra todo -1 Borra ayer hacia atrás #>
$del_files_older = $now.AddDays($days_ago)

Write-Output "-------------------------------------------------------------------------------
BKP:SYSTEMA  ::           INICIANDO SCRIPT DE LIMPIEZA SYSTEMAS
-------------------------------------------------------------------------------"

Get-ChildItem $tempC | Where-Object { $_.LastWriteTime -lt $del_files_older } | Remove-Item -Recurse -Verbose
Get-ChildItem $tempS | Where-Object { $_.LastWriteTime -lt $del_files_older } | Remove-Item -Recurse -Verbose

Write-Output "-------------------------------------------------------------------------------
BKP:SYSTEMA  ::           FINALIZANDO SCRIPT DE LIMPIEZA SYSTEMAS
-------------------------------------------------------------------------------"

