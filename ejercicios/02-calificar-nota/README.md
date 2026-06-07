# 02 - Calificar nota

## Objetivo

Pedir una nota numerica y mostrar la categoria:

- `16` a `20`: Muy bueno.
- `14` a `15.99`: Bueno.
- `12` a `13.99`: Lo suficientemente bueno.
- `10` a `11.99`: Medio.
- Menor que `10`: Insuficiente.

## Lineas clave

- `Read-Host`, `read` o `scanf`: leen la nota introducida.
- La conversion a numero permite comparar rangos.
- `if / elif / else` o `switch`: decide el mensaje segun el valor.
- Primero se comprueba si la nota esta fuera de `0` a `20`; asi se evita clasificar entradas invalidas.

