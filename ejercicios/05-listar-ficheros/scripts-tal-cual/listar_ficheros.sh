#!/bin/bash

read -rp "Introduce el directorio: " dir
salida="listado_ficheros.txt"

if [ ! -d "$dir" ]; then
    echo "El directorio no existe"
    exit 1
fi

{
    echo "Listado de ficheros del directorio: $dir"
    echo "Nombre Tamano(bytes) Ultima_modificacion"
    find "$dir" -maxdepth 1 -type f -printf "%f %s %TY-%Tm-%Td_%TH:%TM:%TS\n"
} > "$salida"

echo "Archivo $salida creado correctamente"

