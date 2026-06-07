# 06 - Ficheros por intervalo de tamano

## Objetivo

Buscar en un directorio los ficheros cuyo tamano este entre un minimo y un maximo indicados por el usuario.

## Lineas clave

- La ruta del directorio se lee por teclado o por parametro.
- El minimo y el maximo se introducen en MB.
- Multiplicar por `1024 * 1024` convierte MB a bytes.
- `stat().st_size`, `Length` o `%s` devuelven el tamano en bytes.
- La condicion central es: `tamano >= minimo && tamano <= maximo`.

