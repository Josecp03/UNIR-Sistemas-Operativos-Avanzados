$u = Read-Host "Usuario"
$info = Get-LocalUser -Name $u -ErrorAction SilentlyContinue
if ($info) {
    "Existe"
    "SID: $($info.SID)"
} else {
    "No existe"
}

