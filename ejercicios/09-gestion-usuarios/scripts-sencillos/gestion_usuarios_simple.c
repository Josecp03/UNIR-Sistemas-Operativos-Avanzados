#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pwd.h>

int main() {
    char opcion[10];
    char usuario[256];
    struct passwd *pwd;
    
    while (1) {
        printf("1) Verificar existencia de usuario\n");
        printf("2) Conocer UID de usuario\n");
        printf("0) Salir\n");
        printf("Opcion: ");
        fgets(opcion, sizeof(opcion), stdin);
        
        if (strcmp(opcion, "1\n") == 0) {
            printf("Introduce el nombre de usuario: ");
            fgets(usuario, sizeof(usuario), stdin);
            usuario[strcspn(usuario, "\n")] = 0;
            
            pwd = getpwnam(usuario);
            if (pwd != NULL) {
                printf("El usuario existe\n");
            } else {
                printf("El usuario no existe\n");
            }
        } else if (strcmp(opcion, "2\n") == 0) {
            printf("Introduce el nombre de usuario: ");
            fgets(usuario, sizeof(usuario), stdin);
            usuario[strcspn(usuario, "\n")] = 0;
            
            pwd = getpwnam(usuario);
            if (pwd != NULL) {
                printf("UID: %d\n", pwd->pw_uid);
            } else {
                printf("El usuario no existe\n");
            }
        } else if (strcmp(opcion, "0\n") == 0) {
            printf("Saliendo...\n");
            break;
        } else {
            printf("Opcion no valida\n");
        }
    }
    
    return 0;
}
