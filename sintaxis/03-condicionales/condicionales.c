#include <stdio.h>

int main() {
    int numero = 10;

    // if - else
    if (numero > 5) {
        printf("El número es mayor que 5\n");
    } else {
        printf("El número es menor o igual a 5\n");
    }

    // if - else if - else
    if (numero < 0) {
        printf("Número negativo\n");
    } else if (numero == 0) {
        printf("Número cero\n");
    } else {
        printf("Número positivo\n");
    }

    // Operador ternario
    char* resultado = (numero > 5) ? "Mayor" : "Menor o igual";
    printf("Resultado ternario: %s\n", resultado);

    // switch
    int opcion = 2;
    switch (opcion) {
        case 1:
            printf("Opción 1 seleccionada\n");
            break;
        case 2:
            printf("Opción 2 seleccionada\n");
            break;
        default:
            printf("Opción no válida\n");
    }

    return 0;
}
