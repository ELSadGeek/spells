<#
.Synopsis
    Mantenimeinto al servidor de los systemas           
	  
.Description
	IT WORKS!
#>

DISM /Online /Cleanup-Image /RestoreHealth /Source:WIM:d:\install.wim:1 /LimitAccess
sfc /scannow
