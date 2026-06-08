#include <stdio.h>
#include <string.h>

int main() {
    // Declaración de array
    int numeros[5] = {10, 20, 30, 40, 50};

    // Acceder a elementos
    printf("Primer elemento: %d\n", numeros[0]);
    printf("Último elemento: %d\n", numeros[4]);

    // Modificar elemento
    numeros[2] = 35;
    printf("Elemento modificado: %d\n", numeros[2]);

    // Iterar sobre array
    printf("\nTodos los elementos:\n");
    for (int i = 0; i < 5; i++) {
        printf("numeros[%d] = %d\n", i, numeros[i]);
    }

    // Array de cadenas
    char* frutas[3] = {"Manzana", "Plátano", "Naranja"};
    printf("\nFrutas:\n");
    for (int i = 0; i < 3; i++) {
        printf("frutas[%d] = %s\n", i, frutas[i]);
    }

    // Array bidimensional (matriz)
    int matriz[2][3] = {
        {1, 2, 3},
        {4, 5, 6}
    };
    printf("\nMatriz:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            printf("matriz[%d][%d] = %d\n", i, j, matriz[i][j]);
        }
    }

    return 0;
}
