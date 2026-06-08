#include <stdio.h>

int main() {
    // Bucle for
    printf("Bucle for:\n");
    for (int i = 0; i < 5; i++) {
        printf("i = %d\n", i);
    }

    // Bucle while
    printf("\nBucle while:\n");
    int contador = 0;
    while (contador < 3) {
        printf("contador = %d\n", contador);
        contador++;
    }

    // Bucle do-while (ejecuta al menos una vez)
    printf("\nBucle do-while:\n");
    int valor = 0;
    do {
        printf("valor = %d\n", valor);
        valor++;
    } while (valor < 3);

    // break y continue
    printf("\nBucle con break y continue:\n");
    for (int j = 0; j < 10; j++) {
        if (j == 3) {
            continue;  // Salta a la siguiente iteración
        }
        if (j == 7) {
            break;     // Sale del bucle
        }
        printf("j = %d\n", j);
    }

    return 0;
}
