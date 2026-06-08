#!/bin/bash

read -rp "Introduce la nota: " nota

if ! [[ "$nota" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Nota no valida"
elif awk "BEGIN { exit !($nota < 0 || $nota > 20) }"; then
    echo "Nota no valida"
elif awk "BEGIN { exit !($nota >= 16) }"; then
    echo "Muy bueno"
elif awk "BEGIN { exit !($nota >= 14) }"; then
    echo "Bueno"
elif awk "BEGIN { exit !($nota >= 12) }"; then
    echo "Lo suficientemente bueno"
elif awk "BEGIN { exit !($nota >= 10) }"; then
    echo "Medio"
else
    echo "Insuficiente"
fi

