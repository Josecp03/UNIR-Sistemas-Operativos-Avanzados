# Arrays en PowerShell

# Declaración de array
$numeros = @(10, 20, 30, 40, 50)

# Acceder a elemento por índice
Write-Host "Primer elemento: $($numeros[0])"
Write-Host "Último elemento: $($numeros[4])"

# Modificar elemento
$numeros[2] = 35
Write-Host "Elemento modificado: $($numeros[2])"

# Obtener longitud del array
Write-Host "Longitud del array: $($numeros.Count)"

# Iterar sobre array
Write-Host "`nTodos los elementos:"
for ($i = 0; $i -lt $numeros.Count; $i++) {
    Write-Host "numeros[$i] = $($numeros[$i])"
}

# Array de cadenas
$frutas = @("Manzana", "Plátano", "Naranja")
Write-Host "`nFrutas:"
for ($i = 0; $i -lt $frutas.Count; $i++) {
    Write-Host "frutas[$i] = $($frutas[$i])"
}

# Usar el array en un foreach directo
Write-Host "`nIterar directamente sobre valores:"
foreach ($fruta in $frutas) {
    Write-Host "Fruta: $fruta"
}

# Hashtables (mapas/diccionarios)
$persona = @{
    "nombre" = "Juan"
    "edad" = 30
    "ciudad" = "Madrid"
}

Write-Host "`nPersona:"
foreach ($clave in $persona.Keys) {
    Write-Host "$clave : $($persona[$clave])"
}

# Array bidimensional (arreglo de arrays)
$matriz = @(
    @(1, 2, 3),
    @(4, 5, 6)
)
Write-Host "`nMatriz:"
for ($i = 0; $i -lt $matriz.Count; $i++) {
    for ($j = 0; $j -lt $matriz[$i].Count; $j++) {
        Write-Host "matriz[$i][$j] = $($matriz[$i][$j])"
    }
}
