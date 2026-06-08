#!/bin/bash

numero=10

# if - else
if [ $numero -gt 5 ]; then
    echo "El número es mayor que 5"
else
    echo "El número es menor o igual a 5"
fi

# if - elif - else
if [ $numero -lt 0 ]; then
    echo "Número negativo"
elif [ $numero -eq 0 ]; then
    echo "Número cero"
else
    echo "Número positivo"
fi

# Operador ternario (con condicional ternario)
resultado=$([ $numero -gt 5 ] && echo "Mayor" || echo "Menor o igual")
echo "Resultado ternario: $resultado"

# case (equivalente a switch)
opcion=2
case $opcion in
    1)
        echo "Opción 1 seleccionada"
        ;;
    2)
        echo "Opción 2 seleccionada"
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
