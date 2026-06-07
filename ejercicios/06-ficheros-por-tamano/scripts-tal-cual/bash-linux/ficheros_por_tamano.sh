#!/bin/bash

read -rp "Directorio: " dir
read -rp "Tamano minimo en MB: " min_mb
read -rp "Tamano maximo en MB: " max_mb

if [ ! -d "$dir" ]; then
    echo "El directorio no existe"
    exit 1
fi

min_bytes=$(awk -v n="$min_mb" 'BEGIN { printf "%.0f", n * 1024 * 1024 }')
max_bytes=$(awk -v n="$max_mb" 'BEGIN { printf "%.0f", n * 1024 * 1024 }')

find "$dir" -maxdepth 1 -type f -printf "%f %s\n" |
while read -r nombre tamano; do
    if [ "$tamano" -ge "$min_bytes" ] && [ "$tamano" -le "$max_bytes" ]; then
        echo "$nombre - $tamano bytes"
    fi
done

