# Define los tamaños umbral en MB
$thresholdUser = 100 * 1MB
$thresholdRoot = 300 * 1MB
$thresholdBlock = 500 * 1MB

# Función para enviar correos electrónicos
function Send-Email {
 param (
 [string]$to, # Dirección de correo del destinatario
 [string]$subject, # Asunto del correo
 [string]$body # Cuerpo del correo
 )
 # Configura los detalles del servidor SMTP y el remitente
 $smtpServer = "smtp.tuservidor.com"
 $smtpFrom = "admin@tudominio.com"
 $smtp = New-Object Net.Mail.SmtpClient($smtpServer)
 # Envía el correo
 $smtp.Send($smtpFrom, $to, $subject, $body)
}

# Función para bloquear a un usuario
function Block-User {
 param (
 [string]$username # Nombre del usuario a bloquear
 )
 # Bloquea al usuario
 Disable-LocalUser -Name $username
}

# Recorre los directorios de los usuarios en C:\Users
Get-ChildItem -Directory -Path "C:\Users" | ForEach-Object {
 # Obtiene la ruta completa del directorio del usuario
 $userDir = $_.FullName
 $username = $_.Name # Obtiene el nombre del usuario
 # Calcula el tamaño total del directorio del usuario
 $dirSize = (Get-ChildItem -Recurse -Force -ErrorAction SilentlyContinue
 $userDir | Measure-Object -Property Length -Sum).Sum
 # Si el tamaño del directorio es mayor que el umbral para bloquear
 if ($dirSize -gt $thresholdBlock) {
 # Bloquea al usuario
 Block-User -username $username
 # Envía un correo a root informando del bloqueo
 Send-Email -to "root@tudominio.com" -subject "Usuario bloqueado"
 -body "El usuario $username ha sido bloqueado por tener
 más de 500MB en su directorio."
 }
 # Si el tamaño del directorio es mayor que el umbral notifica a admin
 elseif ($dirSize -gt $thresholdRoot) {
 # Envía un correo a admin informando del tamaño del directorio
 Send-Email -to "admin@tudominio.com"
 -subject "Usuario con más de 300MB"
 -body "El usuario $username tiene más de 300MB
 en su directorio."
 }
 # Si el tamaño del directorio es mayor que el umbral notifica al usuario
 elseif ($dirSize -gt $thresholdUser) {
 # Envía un correo al usuario solicitando liberar espacio
 Send-Email -to "$username@tudominio.com" -subject "Espacio en disco"
 -body "Tu directorio tiene más de 100MB.
 Por favor, libera espacio."
 }
}
