# Variables Mail 
$smtp_password = ConvertTo-SecureString 'npgswxxpbompldlm' -AsPlainText -Force
$smtp_credential = New-Object System.Management.Automation.PSCredential ('facturas@mtinter.com.mx', $smtp_password)
$From = new-object System.Net.Mail.MailAddress("facturas@mtinter.com.mx", "GMAIL facturas")
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$To = "jfernandez@mtinter.com.mx"
$Cc = "geekmode0n@outlook.com"
$Subject = Get-Date
$Body = "Prueba, saludos.$From $SMTPServer $SMTPPort $Subject desde $env:computername"

Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHtml $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $smtp_credential -DeliveryNotificationOption OnSuccess
