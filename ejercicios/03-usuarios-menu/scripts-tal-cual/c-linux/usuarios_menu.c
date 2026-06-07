#include <stdio.h>
#include <pwd.h>
#include <string.h>

void pedir_usuario(char usuario[], int tamano) {
    printf("Introduce el nombre de usuario: ");
    fgets(usuario, tamano, stdin);
    usuario[strcspn(usuario, "\n")] = '\0';
}

struct passwd *buscar_usuario(char usuario[]) {
    return getpwnam(usuario);
}

int main(void) {
    int opcion = -1;
    char usuario[100];
    struct passwd *info;

    while (opcion != 0) {
        printf("1) Verificar existencia\n2) Conocer UID\n0) Salir\n");
        scanf("%d", &opcion);
        getchar();

        if (opcion == 1) {
            pedir_usuario(usuario, sizeof(usuario));
            info = buscar_usuario(usuario);
            printf(info ? "El usuario existe\n" : "El usuario no existe\n");
        } else if (opcion == 2) {
            pedir_usuario(usuario, sizeof(usuario));
            info = buscar_usuario(usuario);
            if (info) printf("UID: %d\n", info->pw_uid);
            else printf("El usuario no existe\n");
        }
    }

    return 0;
}

