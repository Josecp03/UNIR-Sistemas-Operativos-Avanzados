# Repositorio de practica SOA

Este repositorio esta pensado para practicar los ejercicios de Sistemas Operativos Avanzados en tres modalidades:

- `c-linux`: programas en C pensados para compilar y ejecutar en Linux.
- `bash-linux`: scripts de Shell/Bash para Linux.
- `powershell`: scripts equivalentes en PowerShell.

## Estructura

- `material-original`: copia de los ficheros originales encontrados en la carpeta de la asignatura.
- `ejercicios`: ejercicios organizados por numero y tema.
- Dentro de cada ejercicio:
  - `scripts-tal-cual`: version completa o equivalente directa al planteamiento original.
  - `scripts-sencillos`: version mas corta y facil de memorizar.
  - `README.md`: explicacion del ejercicio, comandos y lineas clave.

## Ejercicios incluidos

Ordenados por nivel de dificultad (1 = más fácil, 12 = más difícil):

1. `01-calificar-nota`: clasificar una nota numerica (if-else simple).
2. `02-ficheros-por-uid`: buscar ficheros por UID propietario (find basico).
3. `03-listar-ficheros`: listar nombre, tamano y fecha de modificacion.
4. `04-contar-directorio`: contar ficheros, subdirectorios y ejecutables.
5. `05-ficheros-por-tamano`: buscar ficheros por intervalo de tamano.
6. `06-clasificacion-notas`: clasificar notas con multiples categorias.
7. `07-usuarios-menu`: menu interactivo para comprobar usuarios y UIDs.
8. `08-analizar-directorio`: analizar contenido de directorios (recursivo).
9. `09-gestion-usuarios`: menu avanzado de gestion de usuarios.
10. `10-monitorear-usuarios`: monitorear directorios con umbrales y acciones.
11. `11-tabla-productos`: procesar tabla de ventas con sumas y calculos.
12. `12-menu-info-sistema`: menu complejo de informacion del sistema Linux.

## Comandos utiles

Compilar C en Linux:

```bash
gcc programa.c -o programa
./programa
```

Ejecutar Bash:

```bash
chmod +x script.sh
./script.sh
```

Ejecutar PowerShell:

```powershell
pwsh ./script.ps1
```

En Windows PowerShell clasico tambien puedes probar muchos scripts con:

```powershell
powershell -ExecutionPolicy Bypass -File .\script.ps1
```

