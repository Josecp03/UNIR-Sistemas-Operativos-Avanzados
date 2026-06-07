#!/bin/bash

read -rp "Directorio minimoMB maximoMB: " d min max
find "$d" -maxdepth 1 -type f -size +"${min}"M -size -"${max}"M -print

