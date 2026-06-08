#!/bin/bash

if [ -z "$1" ]; then
    read -rp "Introduce el directorio: " DIRECTORIO
else
    DIRECTORIO="$1"
fi

if [ ! -d "$DIRECTORIO" ]; then
    echo "El directorio no existe"
    exit 1
fi

ficheros=0
directorios=0
ejecutables=0

for item in "$DIRECTORIO"/*; do
    [ -e "$item" ] || continue
    
    if [ -d "$item" ]; then
        ((directorios++))
    elif [ -f "$item" ]; then
        ((ficheros++))
        [ -x "$item" ] && ((ejecutables++))
    fi
done

echo "Ficheros normales: $ficheros"
echo "Subdirectorios: $directorios"
echo "Ejecutables: $ejecutables"
