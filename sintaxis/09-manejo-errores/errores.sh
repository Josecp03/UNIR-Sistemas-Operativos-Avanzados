#!/bin/bash

# Verificar si un archivo existe
archivo="archivo_inexistente.txt"
if [ ! -f "$archivo" ]; then
    echo "Error: El archivo $archivo no existe"
    exit 1  # Salir con código de error
fi

# Verificar el valor de salida de un comando
ls /directorio_inexistente 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: El directorio no existe"
    exit 1
fi

# Capturar salida de error
resultado=$(comando_inexistente 2>&1)
if [ $? -ne 0 ]; then
    echo "Error: Comando no válido"
    echo "Detalles: $resultado"
    exit 1
fi

# Usar set -e para salir si cualquier comando falla
# set -e

# Usar trap para manejar errores
trap 'echo "Error en línea $LINENO"; exit 1' ERR

# Función con manejo de errores
dividir() {
    local dividendo=$1
    local divisor=$2
    
    if [ $divisor -eq 0 ]; then
        echo "Error: División por cero" >&2  # Escribir en stderr
        return 1  # Retornar código de error
    fi
    
    echo $((dividendo / divisor))
    return 0  # Retornar código de éxito
}

# Usar función con manejo de errores
resultado=$(dividir 10 2)
if [ $? -eq 0 ]; then
    echo "División exitosa: $resultado"
else
    echo "La división falló"
fi

echo "Script finalizado correctamente"
