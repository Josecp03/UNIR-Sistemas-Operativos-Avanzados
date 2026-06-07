$d = Read-Host "Directorio"
Get-ChildItem $d -File | Select-Object Name, Length, LastWriteTime | Out-File listado_ficheros.txt

