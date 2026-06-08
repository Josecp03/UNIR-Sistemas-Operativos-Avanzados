#!/bin/bash

# Declaración de array
numeros=(10 20 30 40 50)

# Acceder a elemento por índice
echo "Primer elemento: ${numeros[0]}"
echo "Último elemento: ${numeros[4]}"

# Modificar elemento
numeros[2]=35
echo "Elemento modificado: ${numeros[2]}"

# Obtener longitud del array
echo "Longitud del array: ${#numeros[@]}"

# Iterar sobre array
echo -e "\nTodos los elementos:"
for i in "${!numeros[@]}"; do
    echo "numeros[$i] = ${numeros[$i]}"
done

# Array de cadenas
frutas=("Manzana" "Plátano" "Naranja")
echo -e "\nFrutas:"
for i in "${!frutas[@]}"; do
    echo "frutas[$i] = ${frutas[$i]}"
done

# Usar el array en un for directo
echo -e "\nIterar directamente sobre valores:"
for fruta in "${frutas[@]}"; do
    echo "Fruta: $fruta"
done

# Arrays asociativos (mapas/diccionarios)
declare -A persona
persona[nombre]="Juan"
persona[edad]="30"
persona[ciudad]="Madrid"

echo -e "\nPersona:"
for clave in "${!persona[@]}"; do
    echo "$clave: ${persona[$clave]}"
done
