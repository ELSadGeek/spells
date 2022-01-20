<#
.Synopsis
    Programa para probar el servicio de correo desde servidores MTI
	  
.Description
	IT WORKS!
#>

#Leer archivo de configuración JSON
$SFile = Get-Content -Path "C:\scripts\mail_settings.json" | ConvertFrom-Json

#Preparar datos de envio
$To = "jorge.fernandez.trueba@outlook.com"
$Cc = Get-Content -Path "C:\scripts\tmp\Cc.txt"
$Att = Get-Content -Path "C:\scripts\tmp\At.txt"  
$Cc.ToString()
$Att.ToString()
$Subject = "mail_test"
$Body = "Ahi vamooooo"
$From = new-object System.Net.Mail.MailAddress($SFile.From, $SFile.Name)
$Secret = ConvertTo-SecureString $SFile.Secret -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($SFile.From, $Secret)

#Enviar Correo
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHtml $Body -Attachments $Att -SmtpServer $SFile.SMTP -port $SFile.Port -UseSsl -Credential $Credential -DeliveryNotificationOption OnSuccess
