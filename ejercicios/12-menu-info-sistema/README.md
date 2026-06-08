# 01 - Menu de informacion del sistema

## Objetivo

Crear un menu interactivo que permita consultar informacion basica del sistema:

- Espacio libre en disco.
- Tamano ocupado por un directorio.
- Uso del procesador.
- Usuarios conectados.
- Diferencia de usuarios respecto a la ultima consulta.
- Ultimas cinco lineas de un fichero.
- Copia de archivos `.sh` y `.c`.

## Desglose de comandos

- `df -h`: muestra discos y espacio en formato legible.
- `du -ah ruta`: muestra el tamano de un directorio y de sus elementos.
- `top -bn1`: toma una captura no interactiva del estado del sistema.
- `grep "Cpu(s)"`: filtra la linea de CPU.
- `who`: lista sesiones de usuario abiertas.
- `wc -l`: cuenta lineas; aplicado a `who`, cuenta usuarios/sesiones.
- `tail -n 5 fichero`: muestra las ultimas cinco lineas.
- `find origen -maxdepth 1`: busca solo en el directorio indicado, sin entrar en subdirectorios.
- `cp`: copia archivos.
- `mkdir -p`: crea un directorio si no existe.

## Como practicar

Primero estudia `scripts-tal-cual`, que conserva la solucion completa. Despues intenta escribir de memoria la version de `scripts-sencillos`, que reduce la logica a lo esencial.

