#include <stdio.h>

int main() {
    double nota;
    
    printf("Nota: ");
    scanf("%lf", &nota);
    
    if (nota >= 16) printf("Muy bueno\n");
    else if (nota >= 14) printf("Bueno\n");
    else if (nota >= 12) printf("Lo suficientemente bueno\n");
    else if (nota >= 10) printf("Medio\n");
    else printf("Insuficiente\n");
    
    return 0;
}
