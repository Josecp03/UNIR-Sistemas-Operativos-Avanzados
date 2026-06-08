#include <stdio.h>

// Función sin parámetros y sin retorno
void saludar() {
    printf("¡Hola!\n");
}

// Función con parámetros
int suma(int a, int b) {
    return a + b;
}

// Función con parámetros y retorno
float dividir(float dividendo, float divisor) {
    if (divisor == 0) {
        printf("Error: División por cero\n");
        return 0;
    }
    return dividendo / divisor;
}

// Función con parámetros por referencia (puntero)
void incrementar(int *numero) {
    (*numero)++;
}

int main() {
    // Llamar función sin parámetros
    saludar();

    // Llamar función y usar el retorno
    int resultado = suma(5, 3);
    printf("Suma: %d\n", resultado);

    // Llamar función con retorno
    float division = dividir(10, 2);
    printf("División: %.2f\n", division);

    // Pasar por referencia
    int numero = 10;
    incrementar(&numero);
    printf("Número incrementado: %d\n", numero);

    return 0;
}
