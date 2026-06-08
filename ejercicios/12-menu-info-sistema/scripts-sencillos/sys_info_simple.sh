#!/bin/bash

echo "1) Disco"
echo "2) Tamano directorio"
echo "3) CPU"
echo "4) Usuarios"
echo "5) Ultimas 5 lineas"
read -rp "Opcion: " op

case "$op" in
    1) df -h ;;
    2) read -rp "Directorio: " d; du -ah "$d" ;;
    3) top -bn1 | grep "Cpu(s)" ;;
    4) who; who | wc -l ;;
    5) read -rp "Fichero: " f; tail -n 5 "$f" ;;
    *) echo "Opcion no valida" ;;
esac

