# 12 - Tabla de productos con totales

## Objetivo

Crear un programa que procese una tabla de ventas donde las columnas representan productos y las filas representan meses. El programa debe:

- Calcular el total de ventas por mes (suma de fila).
- Calcular el total de ventas por producto (suma de columna).
- Calcular el total general de ventas.
- Generar una tabla de salida con estas sumas incluidas.

## Ejemplo de entrada

```
Zanahorias Espinacas Tomates Calabacines
Enero 50 30 80 40
Febrero 60 35 90 45
Marzo 55 28 85 42
Abril 58 32 88 48
Mayo 52 29 82 44
```

## Ejemplo de salida

```
Zanahorias Espinacas Tomates Calabacines Total
Enero 50 30 80 40 200
Febrero 60 35 90 45 230
Marzo 55 28 85 42 210
Abril 58 32 88 48 226
Mayo 52 29 82 44 207
Total 275 154 425 219 1073
```

## Desglose de comandos

### Bash
- `while IFS= read -r linea`: lee línea por línea del archivo.
- `campos=($linea)`: divide la línea en campos (array).
- `declare -a array`: declara un array asociativo.
- `${#array[@]}`: obtiene la longitud del array.
- `echo ... > archivo`: escribe en un archivo (sobrescribe).
- `echo ... >> archivo`: añade contenido a un archivo.
- `for ((i = 1; i < ${#campos[@]}; i++))`: bucle con índices numéricos.

### PowerShell
- `Get-Content archivo`: lee el contenido de un archivo.
- `$linea -split '\s+'`: divide una línea por espacios.
- `Add-Content`: añade contenido a un archivo.
- `[int]`: convierte a entero.
- `foreach`: itera sobre elementos.
- `-match '^\d+$'`: verifica si es un número.

### C
- `fgets()`: lee una línea del archivo.
- `strtok()`: divide una cadena en tokens.
- `sscanf()`: lee datos formateados de una cadena.
- `FILE *fp`: manejo de archivos.
- `fprintf()`: escribe formateado en un archivo.
- `atoi()`: convierte cadena a entero.

## Como practicar

Primero estudia `scripts-tal-cual`, que conserva la solución completa. Después intenta escribir de memoria la versión de `scripts-sencillos`, que reduce la lógica a lo esencial.

