#!/bin/bash

read -rp "Directorio: " d
find "$d" -maxdepth 1 -type f | wc -l
find "$d" -mindepth 1 -maxdepth 1 -type d | wc -l
find "$d" -maxdepth 1 -type f -perm -111 | wc -l

