$directorio = Read-Host "Introduce el directorio"
$salida = "listado_ficheros.txt"

if (-not (Test-Path $directorio -PathType Container)) {
    Write-Host "El directorio no existe"
    exit 1
}

"Listado de ficheros del directorio: $directorio" | Set-Content $salida
"Nombre`tTamano(bytes)`tUltima modificacion" | Add-Content $salida

Get-ChildItem $directorio -File | ForEach-Object {
    "$($_.Name)`t$($_.Length)`t$($_.LastWriteTime)" | Add-Content $salida
}

Write-Host "Archivo $salida creado correctamente"

