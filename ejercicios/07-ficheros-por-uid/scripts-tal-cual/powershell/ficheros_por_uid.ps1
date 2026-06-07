$directorio = Read-Host "Directorio"
$propietario = Read-Host "Propietario o parte del SID"

if (-not (Test-Path $directorio -PathType Container)) {
    Write-Host "El directorio no existe"
    exit 1
}

Get-ChildItem $directorio -File | ForEach-Object {
    $acl = Get-Acl $_.FullName
    if ($acl.Owner -like "*$propietario*") {
        [pscustomobject]@{
            Nombre = $_.Name
            Propietario = $acl.Owner
        }
    }
}

