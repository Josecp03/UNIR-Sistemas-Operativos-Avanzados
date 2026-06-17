$usuariosAnteriores=$null

function Espacio {
    Get-PSDrive -PSProvider FileSystem
}

function Tamanio {
    param(
        [string]$directorio
    )

    if((Test-Path $directorio) -eq $false) {
        Write-Host "Error. El directorio indicado no existe."
    } else {
        Get-ChildItem $directorio -Recurse | Measure-Object Length -Sum
    }

}

function UsoProcesador {
    (Get-CimInstance Win32_Processor)
}

function numeroUsuarios {
    (quser | Measure-Object).Count - 1
}

function lastNumeroUsuarios {
    
    $usuariosActuales=(quser | Measure-Object).Count - 1

    if ($usuariosAnteriores -eq $null) {
        Write-Host "Actualmente hay $usuariosActuales usuarios conectados. No hay datos anteriores para comparar"
    } else {
        $diferenciaUsuarios=$usuariosActuales-$usuariosAnteriores
        Write-Host "Diferencia respecto a la ultima vez: $diferenciaUsuarios usuarios"
    }

    $script:usuariosAnteriores=$usuariosActuales
}

function TailFile {
    param(
        [string]$fichero
    )

    if((Test-Path $fichero) -eq $false){
        Write-Host "Error. El fichero indicado no existe."
    } else {
        Get-Content $fichero -Tail 5
    }

}

function CopyFiles {
    param(
        [string]$origen,
        [string]$destino
    )

    if ((Test-Path $origen) -eq $false){
        Write-Host "Error. El directorio origen no existe."
    } else {
        if ((Test-Path $destino) -eq $false){
            New-Item -ItemType Directory -Path $destino
        }
        Copy-Item "$origen\*.sh", "$origen\*.c" -Destination $destino
    }

}

do{
    Write-Host "1) Obtener el espacio libre de disco"
    Write-Host "2) Obtener el tamanio ocupado de un directorio"
    Write-Host "3) Obtener el uso del procesador"
    Write-Host "4) Obtener el numero de usuarios conectados"
    Write-Host "5) Obtener el numero de usuarios conectados desde la ultima vez que se pregunto"
    Write-Host "6) Mostrar ultimas 5 lineas de un fichero"
    Write-Host "7) Copiar archivos .sh y .c de un directorio a otro"
    Write-Host "0) Salir"
    $opcion=Read-Host "Introduzca la opcion"
    Write-Host "Se ha escogido la opcion numero $opcion"    

    switch ($opcion){

        0{
            Write-Host "Saliendo..."
        }

        1{
            Espacio
        }

        2{
            $directorio=Read-Host "Introduzca el nombre del directorio: "
            Tamanio -directorio $directorio
        }

        3{
            UsoProcesador
        }

        4{
            numeroUsuarios
        }

        5{
            lastNumeroUsuarios
        }

        6{
            $fichero=Read-Host "Introduzca la ruta del fichero: "
            TailFile -fichero $fichero
        }

        7{
            $origen=Read-Host "Introduzca el directorio origen: "
            $destino=Read-Host "Introduzca el directorio destino: "
            CopyFiles -origen $origen -destino $destino
        }

        default{
            Write-Host "Error. Introduzca una opcion correcta"
        }
    }

}while($opcion -ne 0)

Write-Host "Programa finalizado con exito"
