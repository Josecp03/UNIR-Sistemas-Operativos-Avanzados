# Guía de Sintaxis - C, Bash y PowerShell

Este directorio contiene ejemplos de práctica para los conceptos básicos de programación en tres lenguajes:
- **C**: Lenguaje compilado para sistemas operativos
- **Bash/Shell**: Scripting en Linux/Unix
- **PowerShell**: Scripting en Windows y sistemas Unix modernos

## Estructura

Cada sección está organizada en su propio directorio numerado con ejemplos en los tres lenguajes:

```
sintaxis/
├── 01-main/              → Punto de entrada y hello world
├── 02-variables/         → Declaración y tipos de variables
├── 03-condicionales/     → if, else, switch, operador ternario
├── 04-bucles/            → for, while, do-while, break, continue
├── 05-funciones/         → Definición, parámetros, retornos
├── 06-arrays/            → Arreglos, matrices, diccionarios
├── 07-lambdas/           → Funciones anónimas y callbacks
├── 08-manejo-archivos/   → Lectura, escritura y operaciones con archivos
└── 09-manejo-errores/    → Manejo de errores y códigos de salida
```

## Cómo compilar y ejecutar

### C (Linux)

```bash
# Compilar
gcc archivo.c -o programa

# Ejecutar
./programa
```

### Bash/Shell (Linux/Unix)

```bash
# Dar permisos de ejecución
chmod +x archivo.sh

# Ejecutar
./archivo.sh

# O ejecutar con bash directamente
bash archivo.sh
```

### PowerShell (Windows/Linux/macOS)

```powershell
# En Windows PowerShell moderno o pwsh:
pwsh ./archivo.ps1

# O en Windows PowerShell clásico:
powershell -ExecutionPolicy Bypass -File .\archivo.ps1
```

## Referencia rápida de sintaxis

### 1. Variables y tipos

| Concepto | C | Bash | PowerShell |
|----------|---|------|-----------|
| **Variable** | `int x = 5;` | `x=5` | `$x = 5` |
| **Cadena** | `char s[] = "Hola";` | `s="Hola"` | `$s = "Hola"` |
| **Imprimir** | `printf("%d\n", x);` | `echo $x` | `Write-Host $x` |

### 2. Condicionales

| Concepto | C | Bash | PowerShell |
|----------|---|------|-----------|
| **if-else** | `if (x > 5) { ... } else { ... }` | `if [ $x -gt 5 ]; then ... fi` | `if ($x -gt 5) { ... } else { ... }` |
| **Comparación igual** | `==` | `-eq` | `-eq` |
| **Comparación mayor** | `>` | `-gt` | `-gt` |
| **Comparación menor** | `<` | `-lt` | `-lt` |

### 3. Bucles

| Concepto | C | Bash | PowerShell |
|----------|---|------|-----------|
| **for** | `for (int i = 0; i < 5; i++)` | `for i in {0..4}; do ... done` | `for ($i = 0; $i -lt 5; $i++)` |
| **while** | `while (x < 10) { ... }` | `while [ $x -lt 10 ]; do ... done` | `while ($x -lt 10) { ... }` |
| **break** | `break;` | `break` | `break` |
| **continue** | `continue;` | `continue` | `continue` |

### 4. Funciones

| Concepto | C | Bash | PowerShell |
|----------|---|------|-----------|
| **Declaración** | `int suma(int a, int b) { ... }` | `suma() { ... }` | `function Suma { param($a, $b) ... }` |
| **Parámetros** | En paréntesis con tipo | Acceso con `$1, $2, ...` | `param()` |
| **Retorno** | `return valor;` | `echo valor` | `return valor` |
| **Llamada** | `suma(5, 3);` | `suma 5 3` | `Suma -a 5 -b 3` |

### 5. Arrays

| Concepto | C | Bash | PowerShell |
|----------|---|------|-----------|
| **Declaración** | `int arr[5] = {1,2,3,4,5};` | `arr=(1 2 3 4 5)` | `$arr = @(1,2,3,4,5)` |
| **Acceso** | `arr[0]` | `${arr[0]}` | `$arr[0]` |
| **Longitud** | No integrado | `${#arr[@]}` | `$arr.Count` |
| **Iteración** | `for (int i = 0; ...)` | `for i in "${arr[@]}"; do ... done` | `foreach ($item in $arr)` |

### 6. Manejo de archivos

| Operación | C | Bash | PowerShell |
|-----------|---|------|-----------|
| **Escribir** | `fopen(..., "w"); fprintf();` | `echo "texto" > file.txt` | `"texto" \| Out-File file.txt` |
| **Leer** | `fopen(..., "r"); fgets();` | `cat file.txt` | `Get-Content file.txt` |
| **Agregar** | `fopen(..., "a"); fprintf();` | `echo "texto" >> file.txt` | `"texto" \| Add-Content file.txt` |
| **Existencia** | `if (fopen(...))` | `if [ -f file.txt ]` | `if (Test-Path file.txt)` |

### 7. Manejo de errores

| Concepto | C | Bash | PowerShell |
|----------|---|------|-----------|
| **Verificación** | `if (x == NULL)` | `if [ $? -ne 0 ]` | `try { ... } catch { ... }` |
| **Código salida** | `return 1; / exit(1);` | `exit 1` | `exit 1` |
| **Error stderr** | `fprintf(stderr, "...")` | `echo "..." >&2` | `Write-Error "..."` |

## Notas importantes

### C
- Requiere compilación antes de ejecutar
- Manejo manual de memoria (malloc/free)
- Muy eficiente en sistemas con recursos limitados
- Ideal para programas críticos del sistema operativo

### Bash
- Se ejecuta directamente sin compilación
- Excelente para automatización de tareas del sistema
- Variables dinámicas (sin tipos estrictos)
- Ideal para administración de sistemas Linux/Unix

### PowerShell
- Se ejecuta directamente (aunque puede compilarse a módulos)
- Variables y objetos con notación `$`
- Muy potente para administración de sistemas Windows
- Cada vez más usado en entornos cross-platform (pwsh)

## Ejercicios de práctica

Algunos ejemplos de ejercicios que puedes hacer:

1. **Calculadora**: Implementa una calculadora simple que pida dos números y una operación
2. **Búsqueda en array**: Busca un valor en un array y devuelve su posición
3. **Contador de líneas**: Lee un archivo y cuenta el número de líneas
4. **Validador de entrada**: Valida que un número esté dentro de un rango
5. **Tabla de multiplicar**: Imprime la tabla de multiplicar de un número

## Recursos adicionales

- [GNU C Documentation](https://gcc.gnu.org/onlinedocs/)
- [Bash Manual](https://www.gnu.org/software/bash/manual/)
- [PowerShell Documentation](https://docs.microsoft.com/powershell/)
- [Linux Command Reference](https://linux.die.net/)

---

**Consejo**: Para aprender bien, prueba implementar los mismos algoritmos en los tres lenguajes. Esto te ayudará a entender las diferencias y similitudes entre ellos.
