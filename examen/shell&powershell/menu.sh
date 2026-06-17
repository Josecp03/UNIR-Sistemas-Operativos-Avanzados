#!/bin/bash
usuariosAnteriores=""

Espacio() {
    df -h
}

Tamanio() {
    directorio="$1"

    if [ ! -d "$directorio" ]; then
        echo "Error. El directorio indicado no existe."
    else
        du -sh "$directorio"
    fi
}

UsoProcesador() {
    top -bn1 | grep "Cpu"
}

numeroUsuarios() {
    who | wc -l
}

lastNumeroUsuarios() {
    usuariosActuales=$(who | wc -l)

    if [ -z "$usuariosAnteriores" ]; then
        echo "Actualmente hay $usuariosActuales usuarios conectados. No hay datos anteriores para comparar"
    else
        diferenciaUsuarios=$((usuariosActuales - usuariosAnteriores))
        echo "Diferencia respecto a la ultima vez: $diferenciaUsuarios usuarios"
    fi

    usuariosAnteriores=$usuariosActuales
}

TailFile() {
    fichero="$1"

    if [ ! -f "$fichero" ]; then
        echo "Error. El fichero indicado no existe."
    else
        tail -n 5 "$fichero"
    fi
}

CopyFiles() {
    origen="$1"
    destino="$2"

    if [ ! -d "$origen" ]; then
        echo "Error. El directorio origen no existe."
    else
        if [ ! -d "$destino" ]; then
            mkdir "$destino"
        fi

        cp "$origen"/*.sh "$origen"/*.c "$destino"
    fi
}

opcion=-1

while [ "$opcion" != "0" ]; do
    echo "1) Obtener el espacio libre de disco"
    echo "2) Obtener el tamanio ocupado de un directorio"
    echo "3) Obtener el uso del procesador"
    echo "4) Obtener el numero de usuarios conectados"
    echo "5) Obtener el numero de usuarios conectados desde la ultima vez que se pregunto"
    echo "6) Mostrar ultimas 5 lineas de un fichero"
    echo "7) Copiar archivos .sh y .c de un directorio a otro"
    echo "0) Salir"

    read -p "Introduzca la opcion: " opcion
    echo "Se ha escogido la opcion numero $opcion"

    case "$opcion" in
        0)
            echo "Saliendo..."
            ;;

        1)
            Espacio
            ;;

        2)
            read -p "Introduzca el nombre del directorio: " directorio
            Tamanio "$directorio"
            ;;

        3)
            UsoProcesador
            ;;

        4)
            numeroUsuarios
            ;;

        5)
            lastNumeroUsuarios
            ;;

        6)
            read -p "Introduzca la ruta del fichero: " fichero
            TailFile "$fichero"
            ;;

        7)
            read -p "Introduzca el directorio origen: " origen
            read -p "Introduzca el directorio destino: " destino
            CopyFiles "$origen" "$destino"
            ;;

        *)
            echo "Error. Introduzca una opcion correcta"
            ;;
    esac

done

echo "Programa finalizado con exito"
