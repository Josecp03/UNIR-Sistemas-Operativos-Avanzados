#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Debes proporcionar un directorio como parámetro"
    exit 1
fi

DIRECTORIO="$1"

if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: '$DIRECTORIO' no es un directorio válido o no existe."
    exit 1
fi

archivos_estandar=0
subdirectorios=0
ejecutables=0

while IFS= read -r -d '' item; do
    if [ -d "$item" ]; then
        ((subdirectorios++))
    elif [ -f "$item" ]; then
        ((archivos_estandar++))
        # Comprobar si es ejecutable
        if [ -x "$item" ]; then
            ((ejecutables++))
        fi
    fi
done < <(find "$DIRECTORIO" -maxdepth 1 -print0)

echo ""
echo "Análisis del directorio: $DIRECTORIO"
echo "-------------------------------------------"
echo "Archivos estándar : $archivos_estandar"
echo "Subdirectorios    : $subdirectorios"
echo "Archivos ejecutables: $ejecutables"
echo "-------------------------------------------"
