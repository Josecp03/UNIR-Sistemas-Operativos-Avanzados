#!/bin/bash

read -rp "Usuario: " u
if getent passwd "$u" > /dev/null; then
    echo "Existe"
    getent passwd "$u" | cut -d: -f3
else
    echo "No existe"
fi

