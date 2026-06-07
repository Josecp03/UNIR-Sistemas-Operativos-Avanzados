# 04 - Contar elementos de un directorio

## Objetivo

Calcular cuantos elementos de un directorio son:

- Ficheros normales.
- Subdirectorios.
- Ejecutables.

## Lineas clave

- `Test-Path`, `[ -d "$dir" ]` o `opendir`: comprueban que el directorio existe.
- `Get-ChildItem`, `find` o `readdir`: recorren el contenido.
- `-type f` / `S_ISREG`: detectan ficheros normales.
- `-type d` / `S_ISDIR`: detectan directorios.
- `-perm -111` / `access(ruta, X_OK)`: detectan permiso de ejecucion.

