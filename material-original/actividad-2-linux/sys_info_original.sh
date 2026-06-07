#!/bin/bash

# Archivo para guardar el número de usuarios de la última consulta
USUARIOS_FILE="/tmp/.last_users_count"

# Función: espacio libre del disco
espacio_disco() {
    echo "===== ESPACIO LIBRE DEL DISCO ====="
    df -h
    echo ""
}

# Función: tamaño ocupado por un directorio
tamano_directorio() {
    read -rp "Introduce la ruta del directorio: " dir
    if [ -d "$dir" ]; then
        echo "===== TAMAÑO DE $dir ====="
        du -ah "$dir"
        echo ""
    else
        echo "El directorio '$dir' no existe."
    fi
}

# Función: uso del procesador
uso_procesador() {
    echo "===== USO DEL PROCESADOR ====="
    top -bn1 | grep "Cpu(s)"
    echo ""
}

# Función: número de usuarios conectados
usuarios_conectados() {
    NUM=$(who | wc -l)
    echo "===== USUARIOS CONECTADOS ACTUALMENTE ====="
    who
    echo "Total: $NUM usuarios"
    echo ""
}

# Función: usuarios desde la última vez
usuarios_desde_ultima_vez() {
    echo "===== USUARIOS DESDE LA ÚLTIMA CONSULTA ====="
    NUM_ACTUAL=$(who | wc -l)
    if [ -f "$USUARIOS_FILE" ]; then
        NUM_ANTERIOR=$(cat "$USUARIOS_FILE")
        DIFF=$((NUM_ACTUAL - NUM_ANTERIOR))
        echo "Usuarios actuales: $NUM_ACTUAL"
        echo "Usuarios en la última consulta: $NUM_ANTERIOR"
        echo "Diferencia: $DIFF"
    else
        echo "No hay registro previo. Usuarios actuales: $NUM_ACTUAL"
    fi
    echo "$NUM_ACTUAL" > "$USUARIOS_FILE"
    echo ""
}

# Función: últimas 5 líneas de un fichero
ultimas_lineas() {
    read -rp "Introduce la ruta completa del fichero de texto: " fichero
    if [ -f "$fichero" ]; then
        echo "===== ÚLTIMAS 5 LÍNEAS DE $fichero ====="
        tail -n 5 "$fichero"
        echo ""
    else
        echo "El fichero '$fichero' no existe."
    fi
}

# Función: copiar archivos .sh y .c entre directorios
copiar_archivos() {
    read -rp "Introduce el directorio ORIGEN: " origen
    read -rp "Introduce el directorio DESTINO: " destino

    if [ ! -d "$origen" ]; then
        echo "El directorio origen '$origen' no existe."
        return
    fi

    if [ ! -d "$destino" ]; then
        echo "El directorio destino no existe. Creándolo..."
        mkdir -p "$destino"
    fi

    ENCONTRADOS=$(find "$origen" -maxdepth 1 \( -name "*.sh" -o -name "*.c" \) 2>/dev/null)

    if [ -z "$ENCONTRADOS" ]; then
        echo "No se encontraron archivos .sh o .c en '$origen'."
    else
        cp "$origen"/*.sh "$destino"/ 2>/dev/null
        cp "$origen"/*.c "$destino"/ 2>/dev/null
        echo "Archivos copiados a '$destino':"
        ls "$destino"
    fi
    echo ""
}

# Menú principal con bucle until
INTERVALO=30  # segundos entre cada muestra del menú
opcion=""

until [ "$opcion" = "0" ]; do
    clear
    echo "========================================"
    echo "     MENU DE INFORMACION DEL SISTEMA    "
    echo "========================================"
    echo "1) Espacio libre del disco"
    echo "2) Tamaño de un directorio"
    echo "3) Uso del procesador"
    echo "4) Número de usuarios conectados"
    echo "5) Usuarios desde la última consulta"
    echo "6) Últimas 5 líneas de un fichero"
    echo "7) Copiar archivos .sh y .c"
    echo "0) Salir"
    echo ""
    read -rp "Selecciona una opción [0-7]: " opcion
    echo ""

    case $opcion in
        1) espacio_disco ;;
        2) tamano_directorio ;;
        3) uso_procesador ;;
        4) usuarios_conectados ;;
        5) usuarios_desde_ultima_vez ;;
        6) ultimas_lineas ;;
        7) copiar_archivos ;;
        0) echo "Saliendo..." ;;
        *) echo "Opción no válida. Intenta de nuevo." ;;
    esac

    if [ "$opcion" != "0" ]; then
        echo "El menú se volverá a mostrar en $INTERVALO segundos. Pulsa ENTER para adelantar."
        read -rt "$INTERVALO" || true
    fi

done
