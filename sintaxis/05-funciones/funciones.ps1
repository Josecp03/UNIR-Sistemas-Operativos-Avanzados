# Funciones en PowerShell

# Función sin parámetros
function Saludar {
    Write-Host "¡Hola!"
}

# Función con parámetros
function Suma {
    param(
        [int]$a,
        [int]$b
    )
    return $a + $b
}

# Función con parámetros nombrados
function Dividir {
    param(
        [float]$dividendo,
        [float]$divisor
    )
    
    if ($divisor -eq 0) {
        Write-Host "Error: División por cero"
        return $null
    }
    
    return $dividendo / $divisor
}

# Función que modifica una variable pasada por referencia
function Incrementar {
    param(
        [ref]$numero
    )
    $numero.Value = $numero.Value + 1
}

# Llamar función sin parámetros
Saludar

# Llamar función y usar el retorno
$resultado = Suma -a 5 -b 3
Write-Host "Suma: $resultado"

# Llamar función con retorno
$division = Dividir -dividendo 10 -divisor 2
Write-Host "División: $division"

# Variable por referencia
[int]$numero = 10
Incrementar -numero ([ref]$numero)
Write-Host "Número incrementado: $numero"
