$nota = [double](Read-Host "Nota")

if ($nota -ge 16) { "Muy bueno" }
elseif ($nota -ge 14) { "Bueno" }
elseif ($nota -ge 12) { "Lo suficientemente bueno" }
elseif ($nota -ge 10) { "Medio" }
else { "Insuficiente" }
