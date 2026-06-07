$nota = [double](Read-Host "Introduce la nota")

if ($nota -lt 0 -or $nota -gt 20) {
    Write-Host "Nota no valida"
} elseif ($nota -ge 16) {
    Write-Host "Muy bueno"
} elseif ($nota -ge 14) {
    Write-Host "Bueno"
} elseif ($nota -ge 12) {
    Write-Host "Lo suficientemente bueno"
} elseif ($nota -ge 10) {
    Write-Host "Medio"
} else {
    Write-Host "Insuficiente"
}

