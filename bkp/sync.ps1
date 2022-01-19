<#
.Synopsis
    Limpieza de archivos temporales generados por los sistemas VisualFOx
    SNAP MAIN VERSION
	  
.Description
	IT WORKS!
#>
param (
   
    [string]$t = ":"
    # [string]$folder = ":"

)
$t = $t.ToUpper()
$version ="v0.2.1"
$product = "systema"
$action = "SYNC"
$data = "C:\$t"
$sync = "E:" + "\bkp\$product\$Env:Computername\$t\$action"


Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  SYNCRONIZANDO $t $folder
-------------------------------------------------------------------------------"

robocopy "$data" "$sync" /R:5 /W:5 /MT:16 /MIR /Z 

Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  TERMINADO $target $folder
-------------------------------------------------------------------------------"

