# 07 - Ficheros por UID propietario

## Objetivo

Buscar en un directorio los ficheros que pertenecen a un usuario concreto, identificado por su UID.

## Lineas clave

- En C, `stat().st_uid` contiene el UID propietario.
- En Bash, `find -uid UID` filtra directamente por propietario.
- En PowerShell no existe UID Unix nativo en Windows; la version equivalente usa propietario/SID con `Get-Acl`.
- `S_ISREG` o `-type f` evita mostrar directorios.

