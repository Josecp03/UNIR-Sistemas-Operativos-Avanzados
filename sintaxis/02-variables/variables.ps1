# Variables en PowerShell
$numero = 42
$decimal = 3.14
$caracter = "A"
$cadena = "Hola"

# Imprimir variables
Write-Host "Número: $numero"
Write-Host "Decimal: $decimal"
Write-Host "Carácter: $caracter"
Write-Host "Cadena: $cadena"

# Modificar variables
$numero = 100
Write-Host "Número modificado: $numero"

# Variables del sistema
$nombre_usuario = $env:USERNAME
Write-Host "Usuario actual: $nombre_usuario"
