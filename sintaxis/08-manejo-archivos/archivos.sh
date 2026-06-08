#!/bin/bash

# Escribir en archivo
echo "Primera línea" > archivo.txt
echo "Segunda línea" >> archivo.txt
echo "Tercera línea" >> archivo.txt

echo "Archivo escrito correctamente"

# Leer archivo
echo -e "\nLeyendo archivo:"
cat archivo.txt

# Contar líneas
num_lineas=$(wc -l < archivo.txt)
echo -e "\nNúmero de líneas: $num_lineas"

# Agregar al archivo
echo "Línea agregada" >> archivo.txt
echo "Línea agregada correctamente"

# Leer archivo línea por línea
echo -e "\nLeyendo línea por línea:"
while IFS= read -r linea; do
    echo "Línea: $linea"
done < archivo.txt

# Buscar texto en archivo
echo -e "\nBuscando 'Segunda' en archivo:"
grep "Segunda" archivo.txt

# Eliminar archivo
# rm archivo.txt
# echo "Archivo eliminado"
