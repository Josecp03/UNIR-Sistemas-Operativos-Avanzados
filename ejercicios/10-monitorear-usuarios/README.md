# 11 - Monitorear directorios de usuarios

## Objetivo

Crear un programa que recorra los directorios de conexión de los usuarios del sistema, calcule el tamaño de cada uno y realice acciones específicas según umbrales definidos:

- Enviar un correo al usuario si su directorio excede **100MB**.
- Enviar un correo a root/admin si un usuario excede **300MB**.
- Bloquear al usuario si su directorio excede **500MB**.

## Desglose de comandos

### Bash
- `/etc/passwd`: archivo que contiene información de usuarios del sistema.
- `IFS=:`: establece el separador de campos en `:` para parsear `/etc/passwd`.
- `read -r`: lee una línea del archivo.
- `du -sm`: calcula el tamaño de un directorio en megabytes.
- `usermod -L`: bloquea un usuario.
- `mail`: envía correos electrónicos.
- `[ -d $var ]`: verifica si una ruta es un directorio.
- `[ $num -gt $num2 ]`: compara si un número es mayor que otro.

### PowerShell
- `Get-ChildItem -Directory -Path "C:\Users"`: lista directorios de usuarios en Windows.
- `Get-ChildItem -Recurse -Force`: obtiene todos los archivos recursivamente.
- `Measure-Object -Property Length -Sum`: calcula el tamaño total en bytes.
- `Disable-LocalUser`: bloquea un usuario en Windows.
- `New-Object Net.Mail.SmtpClient`: configura cliente SMTP para enviar correos.
- `-gt`: operador de comparación (mayor que).

### C
- `getpwent()`: obtiene información de usuarios del archivo `/etc/passwd`.
- `struct passwd`: estructura que contiene información de usuario.
- `system()`: ejecuta comandos del sistema.
- `du -sm`: calcula el tamaño de un directorio.
- `popen()`: abre un proceso pipe para ejecutar comandos.

## Como practicar

Primero estudia `scripts-tal-cual`, que conserva la solución completa. Después intenta escribir de memoria la versión de `scripts-sencillos`, que reduce la lógica a lo esencial.

