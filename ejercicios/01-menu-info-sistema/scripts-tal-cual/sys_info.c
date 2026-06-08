#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void pausa(void) {
    printf("\nPulsa ENTER para continuar...");
    getchar();
}

int main(void) {
    int opcion = -1;
    char ruta[512];
    char comando[1024];

    while (opcion != 0) {
        printf("1) Espacio libre del disco\n");
        printf("2) Tamano de un directorio\n");
        printf("3) Uso del procesador\n");
        printf("4) Usuarios conectados\n");
        printf("5) Ultimas 5 lineas de un fichero\n");
        printf("0) Salir\n");
        printf("Selecciona una opcion: ");
        scanf("%d", &opcion);
        getchar();

        switch (opcion) {
            case 1:
                system("df -h");
                break;
            case 2:
                printf("Introduce la ruta del directorio: ");
                fgets(ruta, sizeof(ruta), stdin);
                ruta[strcspn(ruta, "\n")] = '\0';
                snprintf(comando, sizeof(comando), "du -ah \"%s\"", ruta);
                system(comando);
                break;
            case 3:
                system("top -bn1 | grep 'Cpu(s)'");
                break;
            case 4:
                system("who; echo Total: $(who | wc -l)");
                break;
            case 5:
                printf("Introduce la ruta del fichero: ");
                fgets(ruta, sizeof(ruta), stdin);
                ruta[strcspn(ruta, "\n")] = '\0';
                snprintf(comando, sizeof(comando), "tail -n 5 \"%s\"", ruta);
                system(comando);
                break;
            case 0:
                printf("Saliendo...\n");
                break;
            default:
                printf("Opcion no valida.\n");
        }
    }

    return 0;
}
