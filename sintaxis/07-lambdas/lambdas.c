#include <stdio.h>

// Puntero a función (similar a lambda)
typedef int (*Operacion)(int, int);

// Funciones que pueden usarse como callbacks
int sumar(int a, int b) {
    return a + b;
}

int multiplicar(int a, int b) {
    return a * b;
}

// Función que recibe un puntero a función
int aplicar(int x, int y, Operacion op) {
    return op(x, y);
}

int main() {
    // Usar punteros a funciones
    Operacion operaciones[2] = {sumar, multiplicar};

    printf("Usando función sumar como puntero:\n");
    int resultado1 = operaciones[0](5, 3);
    printf("5 + 3 = %d\n", resultado1);

    printf("\nUsando función multiplicar como puntero:\n");
    int resultado2 = operaciones[1](5, 3);
    printf("5 * 3 = %d\n", resultado2);

    printf("\nUsando callback con función:\n");
    int resultado3 = aplicar(10, 2, sumar);
    printf("Aplicar suma a 10, 2 = %d\n", resultado3);

    printf("\nUsando callback con función:\n");
    int resultado4 = aplicar(10, 2, multiplicar);
    printf("Aplicar multiplicación a 10, 2 = %d\n", resultado4);

    return 0;
}
