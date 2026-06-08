# Condicionales en PowerShell
$numero = 10

# if - else
if ($numero -gt 5) {
    Write-Host "El número es mayor que 5"
} else {
    Write-Host "El número es menor o igual a 5"
}

# if - elseif - else
if ($numero -lt 0) {
    Write-Host "Número negativo"
} elseif ($numero -eq 0) {
    Write-Host "Número cero"
} else {
    Write-Host "Número positivo"
}

# Operador ternario
$resultado = if ($numero -gt 5) { "Mayor" } else { "Menor o igual" }
Write-Host "Resultado ternario: $resultado"

# switch
$opcion = 2
switch ($opcion) {
    1 {
        Write-Host "Opción 1 seleccionada"
    }
    2 {
        Write-Host "Opción 2 seleccionada"
    }
    default {
        Write-Host "Opción no válida"
    }
}
