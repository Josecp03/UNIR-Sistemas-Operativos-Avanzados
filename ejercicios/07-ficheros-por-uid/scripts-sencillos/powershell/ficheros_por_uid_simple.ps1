$d = Read-Host "Directorio"
$owner = Read-Host "Propietario"
Get-ChildItem $d -File | Where-Object { (Get-Acl $_.FullName).Owner -like "*$owner*" }

