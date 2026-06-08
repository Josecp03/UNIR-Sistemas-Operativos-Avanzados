#!/bin/bash

# Bucle for
echo "Bucle for:"
for i in {0..4}; do
    echo "i = $i"
done

# Bucle for con C-style
echo -e "\nBucle for (C-style):"
for ((i = 0; i < 5; i++)); do
    echo "i = $i"
done

# Bucle while
echo -e "\nBucle while:"
contador=0
while [ $contador -lt 3 ]; do
    echo "contador = $contador"
    contador=$((contador + 1))
done

# Bucle until (opuesto a while)
echo -e "\nBucle until:"
valor=0
until [ $valor -ge 3 ]; do
    echo "valor = $valor"
    valor=$((valor + 1))
done

# break y continue
echo -e "\nBucle con break y continue:"
for j in {0..9}; do
    if [ $j -eq 3 ]; then
        continue  # Salta a la siguiente iteración
    fi
    if [ $j -eq 7 ]; then
        break     # Sale del bucle
    fi
    echo "j = $j"
done
