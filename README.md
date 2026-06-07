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

1. `01-menu-info-sistema`: menu de informacion del sistema Linux.
2. `02-calificar-nota`: clasificar una nota numerica.
3. `03-usuarios-menu`: comprobar existencia de usuario y consultar UID.
4. `04-contar-directorio`: contar ficheros, subdirectorios y ejecutables.
5. `05-listar-ficheros`: listar nombre, tamano y fecha de modificacion.
6. `06-ficheros-por-tamano`: buscar ficheros por intervalo de tamano.
7. `07-ficheros-por-uid`: buscar ficheros por UID propietario.

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

