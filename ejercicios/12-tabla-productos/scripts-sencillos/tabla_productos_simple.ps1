# Versión sencilla: procesa tabla y calcula totales

$entrada = "entrada.tabla"
$salida = "salida.tabla"

$lineas = Get-Content $entrada
$totalesColumnas = @()
$totalGlobal = 0
$n = 0

foreach ($linea in $lineas) {
    $campos = $linea -split '\s+'
    
    if ($campos.Count -eq 0) {
        continue
    }
    
    $n++
    
    # Primera línea: encabezados
    if ($n -eq 1) {
        "$linea Total" | Out-File -FilePath $salida
        $totalesColumnas = @([int]0) * ($campos.Count - 1)
        continue
    }
    
    # Calcular suma de la fila
    $filaTotal = 0
    for ($i = 1; $i -lt $campos.Count; $i++) {
        if ($campos[$i] -match '^\d+$') {
            $filaTotal += [int]$campos[$i]
            $totalesColumnas[$i - 1] += [int]$campos[$i]
        }
    }
    
    # Escribir línea con total
    "$linea $filaTotal" | Add-Content -Path $salida
    $totalGlobal += $filaTotal
}

# Escribir fila de totales
$totalFila = "Total"
foreach ($total in $totalesColumnas) {
    $totalFila += " $total"
}
$totalFila += " $totalGlobal"
Add-Content -Path $salida -Value $totalFila
