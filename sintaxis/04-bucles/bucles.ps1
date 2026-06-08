# Bucles en PowerShell

# Bucle for (enumeración)
Write-Host "Bucle for:"
for ($i = 0; $i -lt 5; $i++) {
    Write-Host "i = $i"
}

# Bucle foreach (para cada elemento)
Write-Host "`nBucle foreach:"
foreach ($item in 0..4) {
    Write-Host "item = $item"
}

# Bucle while
Write-Host "`nBucle while:"
$contador = 0
while ($contador -lt 3) {
    Write-Host "contador = $contador"
    $contador++
}

# Bucle do-while (ejecuta al menos una vez)
Write-Host "`nBucle do-while:"
$valor = 0
do {
    Write-Host "valor = $valor"
    $valor++
} while ($valor -lt 3)

# break y continue
Write-Host "`nBucle con break y continue:"
for ($j = 0; $j -lt 10; $j++) {
    if ($j -eq 3) {
        continue  # Salta a la siguiente iteración
    }
    if ($j -eq 7) {
        break     # Sale del bucle
    }
    Write-Host "j = $j"
}
