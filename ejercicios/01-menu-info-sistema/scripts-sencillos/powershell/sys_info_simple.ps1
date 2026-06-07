Write-Host "1) Disco"
Write-Host "2) Tamano directorio"
Write-Host "3) CPU"
Write-Host "4) Usuarios"
Write-Host "5) Ultimas 5 lineas"
$op = Read-Host "Opcion"

switch ($op) {
    "1" { Get-PSDrive -PSProvider FileSystem }
    "2" { $d = Read-Host "Directorio"; Get-ChildItem $d -Recurse | Measure-Object Length -Sum }
    "3" { Get-CimInstance Win32_Processor | Select-Object Name, LoadPercentage }
    "4" { query user }
    "5" { $f = Read-Host "Fichero"; Get-Content $f -Tail 5 }
    default { Write-Host "Opcion no valida" }
}

