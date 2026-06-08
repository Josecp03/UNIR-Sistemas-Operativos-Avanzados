# Definimos los nombres de los archivos de entrada y salida
$entrada = "entrada.tabla"
$salida = "salida.tabla"
# Leemos la tabla de entrada línea por línea
$lineas = Get-Content $entrada
# Inicializamos una lista para almacenar los totales por columna (sin incluir
la primera columna que tiene los meses)
$totalesColumnas = @()
# Inicializamos el total global
$totalGlobal = 0
$n = 0
# Procesamos las líneas
foreach ($linea in $lineas) {
 # Separamos la línea en campos usando espacios como delimitador
 $campos = $linea -split '\s+'

 # Si la línea está vacía, la ignoramos
 if ($campos.Count -eq 0) {
 continue
 }
 $n ++
 # Si es la primera línea (cabecera), copiamos los encabezados
 # y añadimos la columna 'Total'
 if ($n -eq 1) {
 $encabezados = "$linea Total"
 Add-Content -Path $salida -Value $encabezados
 # Inicializamos los totales de las columnas
 # (solo en la primera línea de datos, después del encabezado)
 $totalesColumnas = @([int]0) * ($campos.Count - 1)
 continue
 }
 # Inicializamos el total de la fila en 0
 $filaTotal = 0
 for ($i = 1; $i -lt $campos.Count; $i++) {
 # Verificamos si el campo es un número válido
 if ($campos[$i] -match '^\d+$') {
 # Sumamos el valor de la columna a la fila
 $filaTotal += [int]$campos[$i]
 # Sumamos a los totales de las columnas
 $totalesColumnas[$i - 1] += [int]$campos[$i]
 }
 }
 # Escribimos la línea con el total de la fila,
 # pero solo agregamos el número, no "Total"
 $lineaConTotal = "$linea $filaTotal"
 Add-Content -Path $salida -Value $lineaConTotal
 # Añadimos el total de la fila al total global
 $totalGlobal += $filaTotal
}
# Creamos la fila con los totales por columna (Total por cada columna)
$totalFila = "Total"
foreach ($total in $totalesColumnas) {
 $totalFila += " $total"
}
# Añadimos el total global al final
$totalFila += " $totalGlobal"
# Escribimos los totales al archivo de salida
Add-Content -Path $salida -Value $totalFila
# Fin del script
