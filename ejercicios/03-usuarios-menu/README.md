# 03 - Menu de usuarios

## Objetivo

Crear un menu con tres opciones:

1. Verificar si existe un usuario.
2. Consultar el UID de un usuario.
3. Salir.

## Lineas clave

- En Linux, `getent passwd usuario` busca el usuario en la base del sistema.
- En Bash, `${linea%%:*}` obtiene el primer campo antes de `:`.
- En C, `getpwnam()` devuelve informacion del usuario si existe.
- En PowerShell, `Get-LocalUser` consulta usuarios locales de Windows.
- Separar `Pedir-Usuario` y `Existe-Usuario` permite cumplir la pauta de usar funciones diferentes.

