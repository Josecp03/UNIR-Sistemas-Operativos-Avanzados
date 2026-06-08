#!/bin/bash

while true; do
    echo "1) Verificar existencia de usuario"
    echo "2) Conocer UID de usuario"
    echo "0) Salir"
    read -rp "Opcion: " opcion

    case "$opcion" in
        1)
            read -rp "Introduce el nombre de usuario: " usuario
            if id "$usuario" &>/dev/null; then
                echo "El usuario existe"
            else
                echo "El usuario no existe"
            fi
            ;;
        2)
            read -rp "Introduce el nombre de usuario: " usuario
            uid=$(id -u "$usuario" 2>/dev/null)
            if [ -n "$uid" ]; then
                echo "UID: $uid"
            else
                echo "El usuario no existe"
            fi
            ;;
        0)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opcion no valida"
            ;;
    esac
done
