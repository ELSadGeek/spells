<#
.Synopsis
    Sincronización con el amo y señor. 
	  
.Description
	IT WORKS!
#>

robocopy "C:\scripts" "\\172.16.3.250\spells\$Env:Computername" /R:5 /W:5 /MT:16 /MIR /Z /XD
 
#20:43

 .\mailtest\mail_test.ps1
 
 #Probando Git syncronización con servidor
 #Probando segunda syncronización