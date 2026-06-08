#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char ruta[500];
    char completa[1000];
    int ficheros = 0, directorios = 0, ejecutables = 0;

    if (argc >= 2) strcpy(ruta, argv[1]);
    else {
        printf("Introduce el directorio: ");
        fgets(ruta, sizeof(ruta), stdin);
        ruta[strcspn(ruta, "\n")] = '\0';
    }

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
        if (stat(completa, &info) == -1) continue;

        if (S_ISREG(info.st_mode)) {
            ficheros++;
            if (access(completa, X_OK) == 0) ejecutables++;
        } else if (S_ISDIR(info.st_mode)) {
            directorios++;
        }
    }

    closedir(dir);
    printf("Ficheros normales: %d\n", ficheros);
    printf("Subdirectorios: %d\n", directorios);
    printf("Ejecutables: %d\n", ejecutables);
    return 0;
}

