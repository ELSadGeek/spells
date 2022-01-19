$contador = Get-Content cuenta.txt
Write-Host $contador   
$contador = $contador.ToInt64($null)+1
Write-Output $contador > .\cuenta.txt

# Variables Mail 
$time = Get-Date
$smtp_password = ConvertTo-SecureString 'TtAmkYcd5x{F' -AsPlainText -Force
$smtp_credential = New-Object System.Management.Automation.PSCredential ('bot@sysmti.com.mx', $smtp_password)
$From = new-object System.Net.Mail.MailAddress("bot@sysmti.com.mx", "sysmti.com.mx")
$To = "jfernandez@mtinter.com.mx"
$Cc = 'Mayra<mluna@mtinter.com.mx>','Nayeli<njimenez@mtinter.com.mx>', 'facturas_ti<facturas_ti@mtinter.com.mx>'
# $Attachment = @(".\logs\$Env:Computername\$scp_name$snap_time.txt","E:\backup\dc1\$scp_name\$snap_time.txt")
$Attachment = '\\dc1\scripts\cat.png','\\dc1\scripts\cat2.jpg', '\\dc1\scripts\cats.pdf','\\dc1\scripts\chems.jpg','\\dc1\scripts\chems.docx','\\dc1\scripts\MALWARE.pdf','\\dc1\scripts\daft.wav'
$Subject = "$Env:Computername sysmti.com.mx"
$Body = "<h2>Funciona! $time #$contador</h2><br>"
$Body += "Prueba del correo sysmti.com.mx, se envia cada minuto de 2 equipos distintos.<br>"
# $Body += "$cuenta"
# $Body += "Sistema respaldado: $t<br>"
$SMTPServer = "mail.sysmti.com.mx"
$SMTPPort = "587"
    
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHtml $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $smtp_credential -Attachments $Attachment -DeliveryNotificationOption OnSuccess

$registro = "#$contador $Env:Computername $time"
Write-Output $registro >> registro_correos.txt
