# Manejo de archivos en PowerShell

# Escribir en archivo
"Primera línea" | Out-File -FilePath "archivo.txt" -Encoding UTF8
"Segunda línea" | Add-Content -Path "archivo.txt"
"Tercera línea" | Add-Content -Path "archivo.txt"

Write-Host "Archivo escrito correctamente"

# Leer archivo
Write-Host "`nLeyendo archivo:"
Get-Content -Path "archivo.txt"

# Contar líneas
$lineas = @(Get-Content -Path "archivo.txt")
$num_lineas = $lineas.Count
Write-Host "`nNúmero de líneas: $num_lineas"

# Agregar al archivo
"Línea agregada" | Add-Content -Path "archivo.txt"
Write-Host "Línea agregada correctamente"

# Leer archivo línea por línea
Write-Host "`nLeyendo línea por línea:"
$contenido = Get-Content -Path "archivo.txt"
foreach ($linea in $contenido) {
    Write-Host "Línea: $linea"
}

# Buscar texto en archivo
Write-Host "`nBuscando 'Segunda' en archivo:"
Select-String -Path "archivo.txt" -Pattern "Segunda"

# Información del archivo
Write-Host "`nInformación del archivo:"
Get-Item -Path "archivo.txt" | Format-List LastWriteTime, Length

# Eliminar archivo
# Remove-Item -Path "archivo.txt"
# Write-Host "Archivo eliminado"
