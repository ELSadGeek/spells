
$now = Get-Date
$sysmerc = "E:\bkp\systema\DC1\sysmerc\SNAP"
$sysmti = "E:\bkp\systema\DC1\sysmti\SNAP"
$days_ago = "-30" <# 0 Borra todo -1 Borra ayer hacia atrás #>
$del_files_older = $now.AddDays($days_ago)

Write-Output "-------------------------------------------------------------------------------
BKP:SYSTEMA  ::           INICIANDO SCRIPT DE LIMPIEZA SYSTEMAS
-------------------------------------------------------------------------------"

Get-ChildItem $sysmti | Where-Object { $_.LastWriteTime -lt $del_files_older } | Remove-Item -Recurse -Verbose
Get-ChildItem $sysmerc | Where-Object { $_.LastWriteTime -lt $del_files_older } | Remove-Item -Recurse -Verbose

Write-Output "-------------------------------------------------------------------------------
BKP:SYSTEMA  ::           FINALIZANDO SCRIPT DE LIMPIEZA SYSTEMAS
-------------------------------------------------------------------------------"