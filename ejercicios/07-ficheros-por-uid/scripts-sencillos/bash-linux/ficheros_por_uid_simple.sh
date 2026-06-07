#!/bin/bash

read -rp "Directorio UID: " d uid
find "$d" -maxdepth 1 -type f -uid "$uid" -print

