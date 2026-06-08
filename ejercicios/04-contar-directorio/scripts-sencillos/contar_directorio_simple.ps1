$d = Read-Host "Directorio"
$items = Get-ChildItem $d
"Ficheros: " + @($items | Where-Object { -not $_.PSIsContainer }).Count
"Directorios: " + @($items | Where-Object { $_.PSIsContainer }).Count
"Ejecutables: " + @($items | Where-Object { $_.Extension -in ".exe", ".bat", ".cmd", ".ps1" }).Count

