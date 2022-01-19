<#
.Synopsis
    Programa para probar el servicio de correo desde servidores MTI
	  
.Description
	IT WORKS!
#>

#Leer archivo de configuración JSON
$SFile = Get-Content -Path "C:\scripts\mail_settings.json" | ConvertFrom-Json

$Subject = "mail_test"
$Body = "Ahi vamooooo"
$From = new-object System.Net.Mail.MailAddress($SFile.From, $SFile.Name)
$Secret = ConvertTo-SecureString $SFile.Secret -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($SFile.From, $Secret)

#Enviar Correo
Send-MailMessage -From $From -to $SFile.To -Cc $SFile.Cc1, $SFile.Cc2, $SFile.Cc3 -Subject $Subject -BodyAsHtml $Body -SmtpServer $SFile.SMTP -port $SFile.Port -UseSsl -Credential $Credential -DeliveryNotificationOption OnSuccess
