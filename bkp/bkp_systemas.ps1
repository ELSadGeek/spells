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
Start-Transcript -Path "D:/bkp/logs/$ID$t.txt"
# Disable-NetAdapter -Name "LAN" -Confirm:$false


$sys_path = "C:\$t"
$SNAP = "D:\bkp\$t\SNAP"
$SYNC = "D:\bkp\$t\SYNC"

Write-Output "-------------------------------------------------------------------------------
    RESPALDANDO TABLAS DEL SISTEMA DE $t
-------------------------------------------------------------------------------"

7z a -r -m0=LZMA2:d64k:fb32 -ms=8m -mmt=30 -mx=1 $SNAP\$ID.7z  $sys_path\data\*.*
$hash = (Get-FileHash -Path "$SNAP\$ID.7z" -Algorithm SHA256).Hash
$sha = (Get-FileHash -Path "$SNAP\$ID.7z" -Algorithm SHA256).Algorithm

Write-Output "-------------------------------------------------------------------------------
    TERMINADO
-------------------------------------------------------------------------------"

Write-Output "$SNAP"
Write-Output "$SNAP\$ID.7z = SHA256 $hash"
Write-Output "$sha $hash" >> "$SNAP\$ID.txt"
# Enable-NetAdapter -Name "LAN" -Confirm:$false

Write-Output "-------------------------------------------------------------------------------
    LIMPIANDO SISTEMA $t
-------------------------------------------------------------------------------"

$now = Get-Date
$tempC = "C:\temp"
$tempS = "C:\$t\temp"
$days_ago = "-1" <# 0 Borra todo -1 Borra ayer hacia atrás #>
$del_files_older = $now.AddDays($days_ago)
Get-ChildItem $tempC | Where-Object { $_.LastWriteTime -lt $del_files_older } | Remove-Item -Recurse -Verbose
Get-ChildItem $tempS | Where-Object { $_.LastWriteTime -lt $del_files_older } | Remove-Item -Recurse -Verbose

Write-Output "-------------------------------------------------------------------------------
    TERMINADO
-------------------------------------------------------------------------------"
Write-Output "-------------------------------------------------------------------------------
    SINCRONIZANDO CON UBICACION LOCAL
-------------------------------------------------------------------------------"

robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

Write-Output "-------------------------------------------------------------------------------
    TERMINADO
-------------------------------------------------------------------------------"

Write-Output "-------------------------------------------------------------------------------
    SINCRONIZANDO CON UBICACION REMOTA
-------------------------------------------------------------------------------"

robocopy "D:\" "\\172.16.3.250\backup\DC1" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"

Write-Output "-------------------------------------------------------------------------------
    TERMINADO
-------------------------------------------------------------------------------"

Stop-Transcript

# Variables Mail 
$smtp_password = ConvertTo-SecureString '#5@vH#]*q5V]' -AsPlainText -Force
$smtp_credential = New-Object System.Management.Automation.PSCredential ('bot@sysmti.com.mx', $smtp_password)
$From = new-object System.Net.Mail.MailAddress("bot@sysmti.com.mx", "BKP")
$To = "jfernandez@mtinter.com.mx"
$Cc = "jfernandez@mtinter.com.mx"
# $Attachment = @(".\logs\$Env:Computername\$scp_name$snap_time.txt","E:\backup\dc1\$scp_name\$snap_time.txt")
$Attachment = "D:/bkp/logs/$ID$t.txt"
$Subject = "BKP: $t $ID"
$Body = "<h2>Respaldo de $t en $Env:Computername COMPLETADO.</h2><br>"
# $Body += "IP = $ip"
# $Body += "Sistema respaldado: $t<br>"
$Body += "$sha $hash"
$SMTPServer = "mail.sysmti.com.mx"
$SMTPPort = "587"
    
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHtml $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $smtp_credential -Attachments $Attachment -DeliveryNotificationOption OnSuccess


