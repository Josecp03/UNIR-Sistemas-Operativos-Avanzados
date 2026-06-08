# 05 - Listar ficheros

## Objetivo

Crear un fichero `listado_ficheros.txt` con nombre, tamano y fecha de ultima modificacion de los ficheros de un directorio. No se entra en subdirectorios.

## Lineas clave

- `opendir` / `Get-ChildItem` / `find`: abre o recorre el directorio.
- `stat`: obtiene tamano y fecha en C.
- `LastWriteTime`: fecha de modificacion en PowerShell.
- `-printf`: permite formatear la salida de `find`.
- `>` o `Set-Content`: escriben la salida en un fichero.

