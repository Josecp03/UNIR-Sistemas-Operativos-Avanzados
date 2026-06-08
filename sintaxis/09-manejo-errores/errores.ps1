# Manejo de errores en PowerShell

# Verificar si un archivo existe
$archivo = "archivo_inexistente.txt"
if (-not (Test-Path -Path $archivo)) {
    Write-Host "Error: El archivo $archivo no existe" -ForegroundColor Red
    exit 1
}

# Verificar si un directorio existe
$directorio = "C:\directorio_inexistente"
if (-not (Test-Path -Path $directorio)) {
    Write-Host "Error: El directorio no existe" -ForegroundColor Red
    exit 1
}

# Usar try-catch para manejar excepciones
try {
    $resultado = 10 / 0  # Esto causará un error
} catch {
    Write-Host "Error: División por cero" -ForegroundColor Red
    Write-Host "Detalles: $_"
    exit 1
}

# Función con manejo de errores
function Dividir {
    param(
        [int]$dividendo,
        [int]$divisor
    )
    
    if ($divisor -eq 0) {
        Write-Error "Error: División por cero"
        return $null
    }
    
    return $dividendo / $divisor
}

# Usar función con manejo de errores
$resultado = Dividir -dividendo 10 -divisor 2
if ($resultado -ne $null) {
    Write-Host "División exitosa: $resultado"
} else {
    Write-Host "La división falló"
}

# Usar $LASTEXITCODE para verificar el código de salida
# if ($LASTEXITCODE -ne 0) {
#     Write-Host "Error en comando anterior"
#     exit $LASTEXITCODE
# }

Write-Host "Script finalizado correctamente"
exit 0
