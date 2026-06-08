#!/bin/bash

while true; do
    echo ""
    echo "============================"
    echo "  MENU DE GESTION DE USUARIOS"
    echo "============================"
    echo "1. Verificar la existencia de un usuario"
    echo "2. Conocer el UID de un usuario"
    echo "3. Salir"
    echo ""
    read -rp "Selecciona una opcion (1-3): " opcion
    
    case "$opcion" in
        1)
            read -rp "Introduce el nombre de usuario: " usuario
            if id "$usuario" &>/dev/null; then
                echo "El usuario '$usuario' SI existe en el sistema."
            else
                echo "El usuario '$usuario' NO existe en el sistema."
            fi
            ;;
        2)
            read -rp "Introduce el nombre de usuario: " usuario
            uid=$(id -u "$usuario" 2>/dev/null)
            if [ -n "$uid" ]; then
                echo "El UID del usuario '$usuario' es: $uid"
            else
                echo "El usuario '$usuario' no existe. No se puede obtener el UID."
            fi
            ;;
        3)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opcion no valida. Introduce 1, 2 o 3."
            ;;
    esac
done
