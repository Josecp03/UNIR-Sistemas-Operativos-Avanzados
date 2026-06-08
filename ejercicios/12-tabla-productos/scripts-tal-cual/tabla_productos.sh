#!/bin/bash
# Definimos los nombres de los archivos de entrada y salida
entrada="entrada.tabla"
salida="salida.tabla"
# Inicializamos un arreglo para almacenar los totales por columna
declare -a totales_columnas
# Inicializamos el total global
total_global=0
# Leemos la tabla de entrada línea por línea
while IFS= read -r linea
do
 # Separamos la línea en campos usando espacios como delimitador
 campos=($linea)

 # Si la línea está vacía, la ignoramos
 if [[ ${#campos[@]} -eq 0 ]]; then
 continue
 fi
 # Si es la primera línea, solo copiamos los encabezados
 # y añadimos una columna de Total
 if [[ ${#campos[@]} -eq 4 ]]; then
 echo "${linea} Total" > "$salida"
 continue
 fi
 # Ahora procesamos los datos de la tabla
 fila_total=0
 for ((i = 1; i < ${#campos[@]}; i++)); do
 # Calculamos el total de cada fila
 fila_total=$((fila_total + ${campos[$i]}))
 # Sumamos a los totales de columna
 totales_columnas[$i]=$((totales_columnas[$i] + ${campos[$i]}))
 done
 # Escribimos la línea con el total por fila
 echo "${linea} $fila_total" >> "$salida"
 # Añadimos el total de la fila al total global
 total_global=$((total_global + fila_total))
done < "$entrada"
# Finalmente, agregamos la fila con los totales por columna
# Creamos una línea con la palabra "Total" y los totales de cada columna
total_linea="Total"
for total in "${totales_columnas[@]}"; do
 total_linea="$total_linea $total"
done
# Añadimos el total global al final
echo "$total_linea $total_global" >> "$salida"
# Fin del script
