<#
.Synopsis
    Limpieza de archivos temporales generados por los sistemas VisualFOx
    SNAP MAIN VERSION
	  
.Description
	IT WORKS!
#>
param (
   
     [string]$t = ":"
     
 )
 
$ID = "$((Get-Date).ToString('yy'))$((Get-Date).ToString('MM'))$((Get-Date).ToString('dd'))$((Get-Date).ToString('HH'))$((Get-Date).ToString('mm'))"
Write-Output $ID
Start-Transcript -Path "F:/bkp/logs/$ID.txt"
Stop-Service -Name "SrvcLic" -Verbose 
$dacaspel = "C:\Program Files (x86)\Common Files\Aspel"
$SNAP = "F:\bkp\aspel\SNAP"
$SYNC = "F:\bkp\aspel\SYNC"

7z a -r -m0=LZMA2:d64k:fb32 -ms=8m -mmt=30 -mx=1 "$SNAP\$ID.7z"  $dacaspel\*.f*

$hash = (Get-FileHash -Path "$SNAP\$ID.7z" -Algorithm SHA256).Hash
$sha = (Get-FileHash -Path "$SNAP\$ID.7z" -Algorithm SHA256).Algorithm

Write-Output "$SNAP"
Write-Output "$SNAP\$ID.7z = SHA256 $hash"
Write-Output "$sha $hash" >> "$SNAP\$ID.txt"

Write-Output "-------------------------------------------------------------------------------
 SINCRONIZANDO CON UBICACION LOCAL
-------------------------------------------------------------------------------"

robocopy "$dacaspel" "$sync" /R:5 /W:5 /MT:16 /MIR /Z 

Write-Output "-------------------------------------------------------------------------------
TERMINADO
-------------------------------------------------------------------------------"
Start-Service -Name "SrvcLic" -Verbose 

Write-Output "-------------------------------------------------------------------------------
 SINCRONIZANDO CON UBICACION REMOTA
-------------------------------------------------------------------------------"

robocopy "F:/" "\\172.16.3.250\backup\MEX-046" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECICLE.BIN"

Write-Output "-------------------------------------------------------------------------------
TERMINADO
-------------------------------------------------------------------------------"

Stop-Transcript