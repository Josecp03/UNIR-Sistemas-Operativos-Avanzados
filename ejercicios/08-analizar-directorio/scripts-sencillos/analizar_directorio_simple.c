#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
    char directorio[256];
    struct stat st;
    
    if (argc > 1) {
        strcpy(directorio, argv[1]);
    } else {
        printf("Introduce el directorio: ");
        fgets(directorio, sizeof(directorio), stdin);
        directorio[strcspn(directorio, "\n")] = 0;
    }
    
    if (stat(directorio, &st) != 0 || !S_ISDIR(st.st_mode)) {
        printf("El directorio no existe\n");
        return 1;
    }
    
    DIR *dir = opendir(directorio);
    if (dir == NULL) return 1;
    
    int ficheros = 0, directorios = 0, ejecutables = 0;
    struct dirent *entry;
    
    while ((entry = readdir(dir)) != NULL) {
        if (entry->d_name[0] == '.') continue;
        
        char ruta[512];
        snprintf(ruta, sizeof(ruta), "%s/%s", directorio, entry->d_name);
        
        if (stat(ruta, &st) != 0) continue;
        
        if (S_ISDIR(st.st_mode)) {
            directorios++;
        } else if (S_ISREG(st.st_mode)) {
            ficheros++;
            if (st.st_mode & S_IXUSR) ejecutables++;
        }
    }
    
    closedir(dir);
    
    printf("Ficheros normales: %d\n", ficheros);
    printf("Subdirectorios: %d\n", directorios);
    printf("Ejecutables: %d\n", ejecutables);
    
    return 0;
}
