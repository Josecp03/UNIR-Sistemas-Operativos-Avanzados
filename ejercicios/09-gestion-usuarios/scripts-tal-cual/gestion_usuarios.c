#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pwd.h>

int main() {
    char opcion[10];
    char usuario[256];
    struct passwd *pwd;
    
    while (1) {
        printf("\n");
        printf("============================\n");
        printf("  MENU DE GESTION DE USUARIOS\n");
        printf("============================\n");
        printf("1. Verificar la existencia de un usuario\n");
        printf("2. Conocer el UID de un usuario\n");
        printf("3. Salir\n");
        printf("\n");
        printf("Selecciona una opcion (1-3): ");
        fgets(opcion, sizeof(opcion), stdin);
        
        if (strcmp(opcion, "1\n") == 0) {
            printf("Introduce el nombre de usuario: ");
            fgets(usuario, sizeof(usuario), stdin);
            usuario[strcspn(usuario, "\n")] = 0;  // Eliminar newline
            
            pwd = getpwnam(usuario);
            if (pwd != NULL) {
                printf("El usuario '%s' SI existe en el sistema.\n", usuario);
            } else {
                printf("El usuario '%s' NO existe en el sistema.\n", usuario);
            }
        } else if (strcmp(opcion, "2\n") == 0) {
            printf("Introduce el nombre de usuario: ");
            fgets(usuario, sizeof(usuario), stdin);
            usuario[strcspn(usuario, "\n")] = 0;  // Eliminar newline
            
            pwd = getpwnam(usuario);
            if (pwd != NULL) {
                printf("El UID del usuario '%s' es: %d\n", usuario, pwd->pw_uid);
            } else {
                printf("El usuario '%s' no existe. No se puede obtener el UID.\n", usuario);
            }
        } else if (strcmp(opcion, "3\n") == 0) {
            printf("Saliendo...\n");
            break;
        } else {
            printf("Opcion no valida. Introduce 1, 2 o 3.\n");
        }
    }
    
    return 0;
}
