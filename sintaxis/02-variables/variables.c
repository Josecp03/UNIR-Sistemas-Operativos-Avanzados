#include <stdio.h>

int main() {
    // Tipos de datos y variables
    int numero = 42;              // Entero
    float decimal = 3.14;         // Número decimal
    char caracter = 'A';          // Un carácter
    char cadena[] = "Hola";       // Cadena de texto

    // Imprimir variables
    printf("Número: %d\n", numero);
    printf("Decimal: %.2f\n", decimal);
    printf("Carácter: %c\n", caracter);
    printf("Cadena: %s\n", cadena);

    // Modificar variables
    numero = 100;
    printf("Número modificado: %d\n", numero);

    return 0;
}
