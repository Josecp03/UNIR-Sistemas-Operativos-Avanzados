$UsuariosFile = Join-Path $env:TEMP "last_users_count.txt"

function Espacio-Disco {
    Write-Host "===== ESPACIO LIBRE DEL DISCO ====="
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free
}

function Tamano-Directorio {
    $dir = Read-Host "Introduce la ruta del directorio"
    if (Test-Path $dir -PathType Container) {
        Get-ChildItem $dir -Recurse -Force | Measure-Object Length -Sum
    } else {
        Write-Host "El directorio no existe."
    }
}

function Uso-Procesador {
    Write-Host "===== USO DEL PROCESADOR ====="
    Get-CimInstance Win32_Processor | Select-Object Name, LoadPercentage
}

function Usuarios-Conectados {
    $usuarios = (query user 2>$null)
    $total = @($usuarios | Select-Object -Skip 1).Count
    $usuarios
    Write-Host "Total: $total usuarios"
}

function Usuarios-Desde-UltimaVez {
    $usuarios = (query user 2>$null)
    $actual = @($usuarios | Select-Object -Skip 1).Count
    if (Test-Path $UsuariosFile) {
        $anterior = [int](Get-Content $UsuariosFile)
        Write-Host "Usuarios actuales: $actual"
        Write-Host "Usuarios en la ultima consulta: $anterior"
        Write-Host "Diferencia: $($actual - $anterior)"
    } else {
        Write-Host "No hay registro previo. Usuarios actuales: $actual"
    }
    Set-Content $UsuariosFile $actual
}

function Ultimas-Lineas {
    $fichero = Read-Host "Introduce la ruta del fichero"
    if (Test-Path $fichero -PathType Leaf) {
        Get-Content $fichero -Tail 5
    } else {
        Write-Host "El fichero no existe."
    }
}

function Copiar-Archivos {
    $origen = Read-Host "Directorio origen"
    $destino = Read-Host "Directorio destino"
    if (-not (Test-Path $origen -PathType Container)) {
        Write-Host "El directorio origen no existe."
        return
    }
    New-Item -ItemType Directory -Force -Path $destino | Out-Null
    Get-ChildItem $origen -File | Where-Object { $_.Extension -in ".sh", ".c" } | Copy-Item -Destination $destino
}

do {
    Write-Host "1) Espacio libre del disco"
    Write-Host "2) Tamano de un directorio"
    Write-Host "3) Uso del procesador"
    Write-Host "4) Usuarios conectados"
    Write-Host "5) Usuarios desde la ultima consulta"
    Write-Host "6) Ultimas 5 lineas de un fichero"
    Write-Host "7) Copiar archivos .sh y .c"
    Write-Host "0) Salir"
    $opcion = Read-Host "Selecciona una opcion"

    switch ($opcion) {
        "1" { Espacio-Disco }
        "2" { Tamano-Directorio }
        "3" { Uso-Procesador }
        "4" { Usuarios-Conectados }
        "5" { Usuarios-Desde-UltimaVez }
        "6" { Ultimas-Lineas }
        "7" { Copiar-Archivos }
        "0" { Write-Host "Saliendo..." }
        default { Write-Host "Opcion no valida." }
    }
} while ($opcion -ne "0")

