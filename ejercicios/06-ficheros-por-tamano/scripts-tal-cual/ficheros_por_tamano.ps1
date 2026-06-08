$directorio = Read-Host "Directorio"
$minMb = [double](Read-Host "Tamano minimo en MB")
$maxMb = [double](Read-Host "Tamano maximo en MB")

if (-not (Test-Path $directorio -PathType Container)) {
    Write-Host "El directorio no existe"
    exit 1
}

$minBytes = $minMb * 1024 * 1024
$maxBytes = $maxMb * 1024 * 1024

Get-ChildItem $directorio -File | Where-Object {
    $_.Length -ge $minBytes -and $_.Length -le $maxBytes
} | Select-Object Name, Length

