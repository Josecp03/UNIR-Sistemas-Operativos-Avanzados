#!/bin/bash

read -rp "Directorio: " dir
read -rp "UID: " uid

if [ ! -d "$dir" ]; then
    echo "El directorio no existe"
    exit 1
fi

find "$dir" -maxdepth 1 -type f -uid "$uid" -printf "%f - UID %U\n"

