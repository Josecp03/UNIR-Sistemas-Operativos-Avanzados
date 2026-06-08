#!/bin/bash

read -rp "Introduce tu nota (0-20): " nota

# Verificar que sea un número válido
if ! [[ "$nota" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Debes introducir un número válido"
    exit 1
fi

# Comparar usando bc para soportar decimales
if (( $(echo "$nota >= 16 && $nota <= 20" | bc -l) )); then
    echo -e "\033[32mMuy bueno\033[0m"  # Verde
elif (( $(echo "$nota >= 14 && $nota < 16" | bc -l) )); then
    echo -e "\033[36mBueno\033[0m"  # Cyan
elif (( $(echo "$nota >= 12 && $nota < 14" | bc -l) )); then
    echo -e "\033[33mLo suficientemente bueno\033[0m"  # Amarillo
elif (( $(echo "$nota >= 10 && $nota < 12" | bc -l) )); then
    echo -e "\033[33mMedio\033[0m"  # Amarillo oscuro
elif (( $(echo "$nota < 10" | bc -l) )); then
    echo -e "\033[31mInsuficiente\033[0m"  # Rojo
else
    echo -e "\033[35mNota fuera de rango (debe ser entre 0 y 20)\033[0m"  # Magenta
fi
