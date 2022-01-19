<#
.Synopsis
    Limpieza de archivos temporales generados por los sistemas VisualFOx
    SNAP MAIN VERSION
	  
.Description
	IT WORKS!
#>
param (
   
    [string]$t = ":", 
    [string]$stamp = ":"


)
$t = $t.ToUpper()
$version ="v0.2.1"
$action = "SNAP"
$data = "C:\$t\data"
$file = "E:\bkp\systema\DC1\$t\SNAP"

Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  INICIANDO $action PARA $t
-------------------------------------------------------------------------------"

7z a -r -m0=LZMA2:d64k:fb32 -ms=8m -mmt=30 -mx=1 $file\$stamp.7z  $data\*.*

Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  SNAP PARA <<$t>>  $folder LISTO
-------------------------------------------------------------------------------"

Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  CALCULANDO HASH $t $folder
-------------------------------------------------------------------------------"

$hash = (Get-FileHash -Path "$file\$stamp.7z" -Algorithm SHA256).Hash
$sha = (Get-FileHash -Path "$file\$stamp.7z" -Algorithm SHA256).Algorithm

Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  HASH $sha : $hash
-------------------------------------------------------------------------------"

Write-Output "$file"
Write-Output "$file\$stamp.7z = SHA256 $hash"
Write-Output "$sha $hash" >> "$file\$stamp.txt"

Write-Output "-------------------------------------------------------------------------------
BKP:$action $version  ::  LISTO!
-------------------------------------------------------------------------------"

