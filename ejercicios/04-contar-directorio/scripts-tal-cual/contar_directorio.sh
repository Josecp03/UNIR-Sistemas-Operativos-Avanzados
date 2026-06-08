#!/bin/bash

dir="${1:-}"
if [ -z "$dir" ]; then
    read -rp "Introduce el directorio: " dir
fi

if [ ! -d "$dir" ]; then
    echo "El directorio no existe"
    exit 1
fi

ficheros=$(find "$dir" -maxdepth 1 -type f | wc -l)
directorios=$(find "$dir" -mindepth 1 -maxdepth 1 -type d | wc -l)
ejecutables=$(find "$dir" -maxdepth 1 -type f -perm -111 | wc -l)

echo "Ficheros normales: $ficheros"
echo "Subdirectorios: $directorios"
echo "Ejecutables: $ejecutables"

