#!/bin/bash

# Bash no tiene lambdas nativas, pero se puede simular con funciones anónimas

# Función que recibe otra función como parámetro
aplicar_operacion() {
    local x=$1
    local y=$2
    local operacion=$3
    
    eval $operacion "$x" "$y"
}

# Definir funciones que se pasarán como parámetros
sumar() {
    echo $(($1 + $2))
}

multiplicar() {
    echo $(($1 * $2))
}

# Usar funciones como parámetros
echo "Usando función sumar:"
resultado=$(aplicar_operacion 5 3 sumar)
echo "5 + 3 = $resultado"

echo -e "\nUsando función multiplicar:"
resultado=$(aplicar_operacion 5 3 multiplicar)
echo "5 * 3 = $resultado"

# Usar arrays de funciones
operaciones=(sumar multiplicar)
echo -e "\nUsando array de funciones:"
resultado=${operaciones[0]} 5 3 | bash
echo "Operación sumar: $(sumar 10 2)"
echo "Operación multiplicar: $(multiplicar 10 2)"

# Usar comando en subshell como función
echo -e "\nUsando comando directo:"
resultado=$((5 + 3))
echo "5 + 3 = $resultado"
