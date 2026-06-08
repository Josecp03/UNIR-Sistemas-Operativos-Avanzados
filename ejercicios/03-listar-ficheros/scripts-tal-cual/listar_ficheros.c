#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>
#include <time.h>

int main(void) {
    char ruta[500], completa[1000], fecha[100];
    DIR *dir;
    struct dirent *entrada;
    struct stat info;
    FILE *salida;

    printf("Introduce el directorio: ");
    fgets(ruta, sizeof(ruta), stdin);
    ruta[strcspn(ruta, "\n")] = '\0';

    dir = opendir(ruta);
    if (!dir) {
        perror("Error al abrir el directorio");
        return 1;
    }

    salida = fopen("listado_ficheros.txt", "w");
    if (!salida) {
        perror("Error al crear el fichero");
        closedir(dir);
        return 1;
    }

    fprintf(salida, "Nombre\tTamano(bytes)\tUltima modificacion\n");
    while ((entrada = readdir(dir)) != NULL) {
        if (!strcmp(entrada->d_name, ".") || !strcmp(entrada->d_name, "..")) continue;
        snprintf(completa, sizeof(completa), "%s/%s", ruta, entrada->d_name);
        if (stat(completa, &info) == -1 || !S_ISREG(info.st_mode)) continue;

        strftime(fecha, sizeof(fecha), "%d/%m/%Y %H:%M:%S", localtime(&info.st_mtime));
        fprintf(salida, "%s\t%lld\t%s\n", entrada->d_name, (long long)info.st_size, fecha);
    }

    fclose(salida);
    closedir(dir);
    printf("Archivo listado_ficheros.txt creado correctamente\n");
    return 0;
}

