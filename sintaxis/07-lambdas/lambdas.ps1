# Lambdas/Funciones anónimas en PowerShell

# Bloques de script como lambdas
$sumar = { param($a, $b) $a + $b }
$multiplicar = { param($a, $b) $a * $b }

# Llamar lambdas
Write-Host "Usando lambda sumar:"
$resultado = & $sumar 5 3
Write-Host "5 + 3 = $resultado"

Write-Host "`nUsando lambda multiplicar:"
$resultado = & $multiplicar 5 3
Write-Host "5 * 3 = $resultado"

# Función que recibe un bloque de script (lambda) como parámetro
function AplicarOperacion {
    param(
        [int]$x,
        [int]$y,
        [scriptblock]$operacion
    )
    
    return & $operacion $x $y
}

Write-Host "`nUsando callback con lambda:"
$resultado = AplicarOperacion -x 10 -y 2 -operacion { param($a, $b) $a + $b }
Write-Host "Aplicar suma a 10, 2 = $resultado"

Write-Host "`nUsando callback con lambda:"
$resultado = AplicarOperacion -x 10 -y 2 -operacion { param($a, $b) $a * $b }
Write-Host "Aplicar multiplicación a 10, 2 = $resultado"

# Array de lambdas
$operaciones = @(
    { param($a, $b) $a + $b },
    { param($a, $b) $a * $b }
)

Write-Host "`nUsando array de lambdas:"
$resultado1 = & $operaciones[0] 10 2
Write-Host "10 + 2 = $resultado1"

$resultado2 = & $operaciones[1] 10 2
Write-Host "10 * 2 = $resultado2"
