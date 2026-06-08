#!/bin/bash

# Función sin parámetros
saludar() {
    echo "¡Hola!"
}

# Función con parámetros
suma() {
    local a=$1
    local b=$2
    echo $((a + b))
}

# Función con retorno de valor
dividir() {
    local dividendo=$1
    local divisor=$2
    
    if [ $divisor -eq 0 ]; then
        echo "Error: División por cero"
        return 1
    fi
    
    echo "scale=2; $dividendo / $divisor" | bc
    return 0
}

# Función que modifica variables globales
incrementar() {
    numero=$((numero + 1))
}

# Llamar función sin parámetros
saludar

# Llamar función y usar el retorno
resultado=$(suma 5 3)
echo "Suma: $resultado"

# Llamar función con retorno
division=$(dividir 10 2)
echo "División: $division"

# Variable global
numero=10
incrementar
echo "Número incrementado: $numero"
