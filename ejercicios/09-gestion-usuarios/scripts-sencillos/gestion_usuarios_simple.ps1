function Pedir-Usuario {
    return Read-Host "Introduce el nombre de usuario"
}

function Existe-Usuario($nombre) {
    return [bool](Get-LocalUser -Name $nombre -ErrorAction SilentlyContinue)
}

do {
    Write-Host "1) Verificar existencia de usuario"
    Write-Host "2) Conocer UID/SID de usuario"
    Write-Host "0) Salir"
    $opcion = Read-Host "Opcion"

    switch ($opcion) {
        "1" {
            $usuario = Pedir-Usuario
            if (Existe-Usuario $usuario) { Write-Host "El usuario existe" }
            else { Write-Host "El usuario no existe" }
        }
        "2" {
            $usuario = Pedir-Usuario
            $info = Get-LocalUser -Name $usuario -ErrorAction SilentlyContinue
            if ($info) { Write-Host "SID: $($info.SID)" }
            else { Write-Host "El usuario no existe" }
        }
        "0" { Write-Host "Saliendo..." }
        default { Write-Host "Opcion no valida" }
    }
} while ($opcion -ne "0")
