<#
.Synopsis
    Sincronizar la partición de respaldo con disco NAS
	  
.Description
	IT WORKS!
#>
param (
   
     [string]$t = ":"
     
 )
 robocopy "D:\" "\\172.16.3.250\backup\DC1" /R:5 /W:5 /MT:16 /MIR /Z /XD 'System Volume Information' '$RECYCLE.BIN'

