<#
.Synopsis
    Programa para probar el servicio de correo desde servidores MTI
	  
.Description
	IT WORKS!
#>

$SFile = Get-Content -Path "C:\scripts\mail_settings.json" | ConvertFrom-Json
$From = new-object System.Net.Mail.MailAddress($SFile.From, $SFile.Name)
$Secret = ConvertTo-SecureString $SFile.Secret -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($SFile.From, $Secret)
Send-MailMessage -From $From -to $SFile.To -Cc $SFile.Cc -Subject $Sfile.Subject -BodyAsHtml $Sfile.Body -SmtpServer $Sfile.SMTP -port $SFile.Port -UseSsl -Credential $Credential -DeliveryNotificationOption OnSuccess
