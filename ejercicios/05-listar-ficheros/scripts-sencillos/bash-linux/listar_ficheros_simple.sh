#!/bin/bash

read -rp "Directorio: " d
find "$d" -maxdepth 1 -type f -printf "%f %s %TY-%Tm-%Td %TH:%TM\n" > listado_ficheros.txt

