#!/bin/bash

read -rp "Nota: " nota

awk -v n="$nota" 'BEGIN {
    if (n >= 16) print "Muy bueno";
    else if (n >= 14) print "Bueno";
    else if (n >= 12) print "Lo suficientemente bueno";
    else if (n >= 10) print "Medio";
    else print "Insuficiente";
}'
