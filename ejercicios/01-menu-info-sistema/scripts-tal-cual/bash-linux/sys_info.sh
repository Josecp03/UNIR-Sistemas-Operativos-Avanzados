#!/bin/bash

USUARIOS_FILE="/tmp/.last_users_count"

espacio_disco() {
    echo "===== ESPACIO LIBRE DEL DISCO ====="
    df -h
    echo ""
}

tamano_directorio() {
    read -rp "Introduce la ruta del directorio: " dir
    if [ -d "$dir" ]; then
        echo "===== TAMANO DE $dir ====="
        du -ah "$dir"
    else
        echo "El directorio '$dir' no existe."
    fi
    echo ""
}

uso_procesador() {
    echo "===== USO DEL PROCESADOR ====="
    top -bn1 | grep "Cpu(s)"
    echo ""
}

usuarios_conectados() {
    num=$(who | wc -l)
    echo "===== USUARIOS CONECTADOS ====="
    who
    echo "Total: $num usuarios"
    echo ""
}

usuarios_desde_ultima_vez() {
    actual=$(who | wc -l)
    echo "===== USUARIOS DESDE LA ULTIMA CONSULTA ====="
    if [ -f "$USUARIOS_FILE" ]; then
        anterior=$(cat "$USUARIOS_FILE")
        echo "Usuarios actuales: $actual"
        echo "Usuarios en la ultima consulta: $anterior"
        echo "Diferencia: $((actual - anterior))"
    else
        echo "No hay registro previo. Usuarios actuales: $actual"
    fi
    echo "$actual" > "$USUARIOS_FILE"
    echo ""
}

ultimas_lineas() {
    read -rp "Introduce la ruta del fichero: " fichero
    if [ -f "$fichero" ]; then
        tail -n 5 "$fichero"
    else
        echo "El fichero '$fichero' no existe."
    fi
    echo ""
}

copiar_archivos() {
    read -rp "Directorio origen: " origen
    read -rp "Directorio destino: " destino

    if [ ! -d "$origen" ]; then
        echo "El directorio origen no existe."
        return
    fi

    mkdir -p "$destino"
    find "$origen" -maxdepth 1 -type f \( -name "*.sh" -o -name "*.c" \) -exec cp {} "$destino" \;
    echo "Copia finalizada en $destino"
    echo ""
}

opcion=""
until [ "$opcion" = "0" ]; do
    echo "1) Espacio libre del disco"
    echo "2) Tamano de un directorio"
    echo "3) Uso del procesador"
    echo "4) Usuarios conectados"
    echo "5) Usuarios desde la ultima consulta"
    echo "6) Ultimas 5 lineas de un fichero"
    echo "7) Copiar archivos .sh y .c"
    echo "0) Salir"
    read -rp "Selecciona una opcion: " opcion

    case "$opcion" in
        1) espacio_disco ;;
        2) tamano_directorio ;;
        3) uso_procesador ;;
        4) usuarios_conectados ;;
        5) usuarios_desde_ultima_vez ;;
        6) ultimas_lineas ;;
        7) copiar_archivos ;;
        0) echo "Saliendo..." ;;
        *) echo "Opcion no valida." ;;
    esac
done

