$d = Read-Host "Directorio"
$min = [double](Read-Host "Min MB")
$max = [double](Read-Host "Max MB")
Get-ChildItem $d -File | Where-Object { $_.Length -ge $min*1MB -and $_.Length -le $max*1MB }

