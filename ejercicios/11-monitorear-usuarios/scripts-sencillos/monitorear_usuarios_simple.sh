#!/bin/bash
# Versión sencilla: recorre usuarios y verifica tamaño de directorio home

while IFS=: read -r username password uid gid user_info home_dir shell; do
    if [ -d "$home_dir" ]; then
        # Obtener tamaño en MB
        user_size=$(du -sm "$home_dir" 2>/dev/null | cut -f1)
        
        # Verificar umbral
        if [ "$user_size" -gt 500 ]; then
            echo "BLOQUEAR: $username ($user_size MB)"
        elif [ "$user_size" -gt 300 ]; then
            echo "ALERTAR ADMIN: $username ($user_size MB)"
        elif [ "$user_size" -gt 100 ]; then
            echo "AVISAR USUARIO: $username ($user_size MB)"
        fi
    fi
done < /etc/passwd
