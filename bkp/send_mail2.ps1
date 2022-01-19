PowerShell
$EmailDestinatario = "jfernandez@mtinter.com.mx"
$EmailEmisor = "test@sysmti.com.mx"
$Asunto = "Prueba envío mail GMail desde PowerShell"
$CuerpoEnHTML = "Esto es una <b>prueba</b> de envío de correo electrónico desde PowerShell a cuenta de GMail. Más información en <a href='https://proyectoa.com'>Proyecto A</a>"
$SMTPServidor = "mail.sysmti.com.mx"
$RutaNombreFicheroAdjunto = "D:\ProyectoA\documento.pdf"
$CodificacionCaracteres=[System.Text.Encoding]::UTF8
try
{
  $SMTPMensaje = New-Object System.Net.Mail.MailMessage($EmailEmisor, $EmailDestinatario, $Asunto, $CuerpoEnHTML)
  $SMTPAdjunto = New-Object System.Net.Mail.Attachment($RutaNombreFicheroAdjunto)
  $SMTPMensaje.Attachments.Add($SMTPAdjunto)
  $SMTPMensaje.IsBodyHtml = $true
  $SMTPMensaje.BodyEncoding = $CodificacionCaracteres
  $SMTPMensaje.SubjectEncoding = $CodificacionCaracteres
  $SMTPCliente = New-Object Net.Mail.SmtpClient($SMTPServidor, 587)
  $SMTPCliente.EnableSsl = $true
  $SMTPCliente.Credentials = New-Object System.Net.NetworkCredential($EmailEmisor, "contraseña");
  $SMTPCliente.Send($SMTPMensaje)
  Write-Output "Mensaje enviado correctamente"
}  
catch
{
  Write-Error -Message "Error al enviar correo electrónico"
}