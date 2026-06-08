$n = [double](Read-Host "Nota")
if ($n -ge 16) { "Muy bueno" }
elseif ($n -ge 14) { "Bueno" }
elseif ($n -ge 12) { "Lo suficientemente bueno" }
elseif ($n -ge 10) { "Medio" }
else { "Insuficiente" }

