#!/bin/bash
# Recorrer directorios de conexión de usuarios desde /etc/passwd
# Leer cada línea del archivo /etc/passwd
while IFS=: read -r username password uid gid user_info home_dir shell; do
 # Verificar si el directorio de conexión existe
 if [ -d "$home_dir" ]; then
 # Calcular el tamaño del directorio en megabytes
 user_size=$(du -sm "$home_dir" | cut -f1)
 # Si el tamaño es mayor a 500MB, bloquear al usuario
 if [ "$user_size" -gt 500 ]; then
 usermod -L "$username"
 echo "El usuario $username ha sido bloqueado por exceder 500MB."
 # Si el tamaño es mayor a 300MB, enviar un correo a root
 elif [ "$user_size" -gt 300 ]; then
 echo "El usuario $username tiene más de 300MB en su directorio." |
 mail -s "Usuario con más de 300MB" root
 # Si el tamaño es mayor a 100MB, enviar un correo al usuario
 elif [ "$user_size" -gt 100 ]; then
 echo "Hay más de 100MB en tu directorio. Por favor, libera espacio."
|
 mail -s "Exceso de espacio en el directorio" "$username"
 fi
 fi
# Leer el archivo /etc/passwd línea por línea
done < /etc/passwd
