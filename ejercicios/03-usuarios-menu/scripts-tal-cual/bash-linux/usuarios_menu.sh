#!/bin/bash

pedir_usuario() {
    read -rp "Introduce el nombre de usuario: " usuario
}

existe_usuario() {
    getent passwd "$1" > /dev/null
}

opcion=""
until [ "$opcion" = "0" ]; do
    echo "1) Verificar existencia de usuario"
    echo "2) Conocer UID de usuario"
    echo "0) Salir"
    read -rp "Opcion: " opcion

    case "$opcion" in
        1)
            pedir_usuario
            if existe_usuario "$usuario"; then echo "El usuario existe"; else echo "No existe"; fi
            ;;
        2)
            pedir_usuario
            linea=$(getent passwd "$usuario")
            if [ -n "$linea" ]; then echo "$linea" | cut -d: -f3; else echo "No existe"; fi
            ;;
        0) echo "Saliendo..." ;;
        *) echo "Opcion no valida" ;;
    esac
done

