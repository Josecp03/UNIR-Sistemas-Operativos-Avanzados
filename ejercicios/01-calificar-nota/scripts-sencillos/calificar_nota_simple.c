#include <stdio.h>

int main(void) {
    double n;
    scanf("%lf", &n);

    if (n >= 16) puts("Muy bueno");
    else if (n >= 14) puts("Bueno");
    else if (n >= 12) puts("Lo suficientemente bueno");
    else if (n >= 10) puts("Medio");
    else puts("Insuficiente");

    return 0;
}

