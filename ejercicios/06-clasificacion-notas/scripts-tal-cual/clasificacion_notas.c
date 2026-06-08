#include <stdio.h>
#include <stdlib.h>

int main() {
    double nota;
    
    printf("Introduce tu nota (0-20): ");
    if (scanf("%lf", &nota) != 1) {
        fprintf(stderr, "Error: Debes introducir un número válido\n");
        return 1;
    }
    
    if (nota >= 16 && nota <= 20) {
        printf("\033[32mMuy bueno\033[0m\n");  // Verde
    } else if (nota >= 14 && nota < 16) {
        printf("\033[36mBueno\033[0m\n");  // Cyan
    } else if (nota >= 12 && nota < 14) {
        printf("\033[33mLo suficientemente bueno\033[0m\n");  // Amarillo
    } else if (nota >= 10 && nota < 12) {
        printf("\033[33mMedio\033[0m\n");  // Amarillo oscuro
    } else if (nota < 10) {
        printf("\033[31mInsuficiente\033[0m\n");  // Rojo
    } else {
        printf("\033[35mNota fuera de rango (debe ser entre 0 y 20)\033[0m\n");  // Magenta
    }
    
    return 0;
}
