#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Error: Debes proporcionar un directorio como parámetro\n");
        return 1;
    }
    
    char *directorio = argv[1];
    struct stat st;
    
    if (stat(directorio, &st) != 0 || !S_ISDIR(st.st_mode)) {
        fprintf(stderr, "Error: '%s' no es un directorio válido o no existe.\n", directorio);
        return 1;
    }
    
    DIR *dir = opendir(directorio);
    if (dir == NULL) {
        fprintf(stderr, "Error: No se puede abrir el directorio '%s'\n", directorio);
        return 1;
    }
    
    int archivos_estandar = 0;
    int subdirectorios = 0;
    int ejecutables = 0;
    
    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        // Ignorar . y ..
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }
        
        char ruta[1024];
        snprintf(ruta, sizeof(ruta), "%s/%s", directorio, entry->d_name);
        
        struct stat file_st;
        if (stat(ruta, &file_st) != 0) {
            continue;
        }
        
        if (S_ISDIR(file_st.st_mode)) {
            subdirectorios++;
        } else if (S_ISREG(file_st.st_mode)) {
            archivos_estandar++;
            // Comprobar si es ejecutable
            if (file_st.st_mode & S_IXUSR) {
                ejecutables++;
            }
        }
    }
    
    closedir(dir);
    
    printf("\n");
    printf("Análisis del directorio: %s\n", directorio);
    printf("-------------------------------------------\n");
    printf("Archivos estándar : %d\n", archivos_estandar);
    printf("Subdirectorios    : %d\n", subdirectorios);
    printf("Archivos ejecutables: %d\n", ejecutables);
    printf("-------------------------------------------\n");
    
    return 0;
}
