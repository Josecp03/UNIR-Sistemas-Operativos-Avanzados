#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>

int main(void) {
    char ruta[500], completa[1000];
    int uid, encontrados = 0;

    printf("Introduce el directorio: ");
    fgets(ruta, sizeof(ruta), stdin);
    ruta[strcspn(ruta, "\n")] = '\0';

    printf("Introduce el UID: ");
    scanf("%d", &uid);

    DIR *dir = opendir(ruta);
    if (!dir) {
        perror("Error al abrir el directorio");
        return 1;
    }

    struct dirent *entrada;
    struct stat info;

    while ((entrada = readdir(dir)) != NULL) {
        if (!strcmp(entrada->d_name, ".") || !strcmp(entrada->d_name, "..")) continue;
        snprintf(completa, sizeof(completa), "%s/%s", ruta, entrada->d_name);
        if (stat(completa, &info) == -1 || !S_ISREG(info.st_mode)) continue;

        if (info.st_uid == uid) {
            printf("%s - UID %d\n", entrada->d_name, uid);
            encontrados++;
        }
    }

    if (encontrados == 0) printf("No se encontraron ficheros\n");
    closedir(dir);
    return 0;
}

