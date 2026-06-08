#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>

int main(void) {
    char ruta[500], completa[1000];
    double min_mb, max_mb;
    long long min_bytes, max_bytes;
    int encontrados = 0;

    printf("Introduce el directorio: ");
    fgets(ruta, sizeof(ruta), stdin);
    ruta[strcspn(ruta, "\n")] = '\0';

    printf("Tamano minimo en MB: ");
    scanf("%lf", &min_mb);
    printf("Tamano maximo en MB: ");
    scanf("%lf", &max_mb);

    if (min_mb < 0 || max_mb < 0 || min_mb > max_mb) {
        printf("Intervalo no valido\n");
        return 1;
    }

    min_bytes = (long long)(min_mb * 1024 * 1024);
    max_bytes = (long long)(max_mb * 1024 * 1024);

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

        if (info.st_size >= min_bytes && info.st_size <= max_bytes) {
            printf("%s - %lld bytes\n", entrada->d_name, (long long)info.st_size);
            encontrados++;
        }
    }

    if (encontrados == 0) printf("No se encontraron ficheros\n");
    closedir(dir);
    return 0;
}

