<#
.Synopsis
    Programa para probar el servicio de correo desde servidores MTI
	  
.Description
	IT WORKS!
#>

# Variables Mail 
$smtp_password = ConvertTo-SecureString 'csgcvyvfpqrfwqhn' -AsPlainText -Force
$smtp_credential = New-Object System.Management.Automation.PSCredential ('facturas@mtinter.com.mx', $smtp_password)
$From = new-object System.Net.Mail.MailAddress("facturas@mtinter.com.mx", "facturas@mtinter.com.mx")
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$To = "jfernandez@mtinter.com.mx"
$Cc = "nhernandez@mtinter.com.mx"
$Subject = Get-Date
$Body = "$SMTPServer $SMTPPort $Subject desde $env:computername"

Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHtml $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $smtp_credential -DeliveryNotificationOption OnSuccess
#20:47