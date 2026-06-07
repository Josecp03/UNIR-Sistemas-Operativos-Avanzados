#include <stdio.h>

int main(void) {
    double nota;

    printf("Introduce la nota: ");
    scanf("%lf", &nota);

    if (nota < 0 || nota > 20) {
        printf("Nota no valida\n");
    } else if (nota >= 16) {
        printf("Muy bueno\n");
    } else if (nota >= 14) {
        printf("Bueno\n");
    } else if (nota >= 12) {
        printf("Lo suficientemente bueno\n");
    } else if (nota >= 10) {
        printf("Medio\n");
    } else {
        printf("Insuficiente\n");
    }

    return 0;
}

