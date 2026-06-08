#!/bin/bash
# Versión sencilla: procesa tabla y calcula totales por fila y columna

entrada="entrada.tabla"
salida="salida.tabla"

# Inicializar variables
declare -a totales_columnas
total_global=0
linea_num=0

while IFS= read -r linea; do
    campos=($linea)
    ((linea_num++))
    
    # Primera línea: copiar encabezados con "Total"
    if [ $linea_num -eq 1 ]; then
        echo "${linea} Total" > "$salida"
        continue
    fi
    
    # Calcular suma de la fila
    fila_total=0
    for ((i = 1; i < ${#campos[@]}; i++)); do
        fila_total=$((fila_total + ${campos[$i]}))
        totales_columnas[$i]=$((${totales_columnas[$i]:-0} + ${campos[$i]}))
    done
    
    # Escribir fila con su total
    echo "${linea} $fila_total" >> "$salida"
    total_global=$((total_global + fila_total))
    
done < "$entrada"

# Escribir fila de totales
total_linea="Total"
for total in "${totales_columnas[@]}"; do
    total_linea="$total_linea $total"
done
echo "$total_linea $total_global" >> "$salida"
