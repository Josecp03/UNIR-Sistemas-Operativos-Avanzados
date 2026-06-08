#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    int op;
    char ruta[300];
    char comando[600];

    printf("1) Disco\n2) Tamano directorio\n3) CPU\n4) Usuarios\n5) Ultimas 5 lineas\n");
    printf("Opcion: ");
    scanf("%d", &op);
    getchar();

    if (op == 1) {
        system("df -h");
    } else if (op == 2) {
        printf("Directorio: ");
        fgets(ruta, sizeof(ruta), stdin);
        ruta[strcspn(ruta, "\n")] = '\0';
        snprintf(comando, sizeof(comando), "du -ah \"%s\"", ruta);
        system(comando);
    } else if (op == 3) {
        system("top -bn1 | grep 'Cpu(s)'");
    } else if (op == 4) {
        system("who; who | wc -l");
    } else if (op == 5) {
        printf("Fichero: ");
        fgets(ruta, sizeof(ruta), stdin);
        ruta[strcspn(ruta, "\n")] = '\0';
        snprintf(comando, sizeof(comando), "tail -n 5 \"%s\"", ruta);
        system(comando);
    } else {
        printf("Opcion no valida\n");
    }

    return 0;
}

