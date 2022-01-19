<#
.Synopsis
    Mantenimeinto al servidor de los systemas           
	  
.Description
	IT WORKS!
#>
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /RestoreHealth /Source:D:\install.wim
sfc /scannow
