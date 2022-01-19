<#
.Synopsis
    Notifica los usuarios actuales en el servidor
	  
.Description
	IT WORKS!
#>
param (
   
     [string]$t = ":"
     
 )

$quserqry = quser /server:DC1

Write-Output $quserqry


$smtp_password = ConvertTo-SecureString 'Y6P;fz[fCEdx' -AsPlainText -Force
$smtp_credential = New-Object System.Management.Automation.PSCredential ('bot@sysmti.com.mx', $smtp_password)
$From = new-object System.Net.Mail.MailAddress("bot@sysmti.com.mx", "BKP")
$To = "jfernandez@mtinter.com.mx"
$Cc = "mluna@mtinter.com.mx"
$Subject= "Usuarios en el servidor DC1"
$Body = "$quserqry"
$SMTPServer = "mail.sysmti.com.mx"
$SMTPPort = "587"

Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHtml $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $smtp_credential -DeliveryNotificationOption OnSuccess
