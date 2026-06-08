#include <stdio.h>
#include <stdlib.h>
#include <pwd.h>
#include <unistd.h>
#include <string.h>

int main() {
    struct passwd *pwd;
    char command[512];
    FILE *fp;
    int size;
    
    // Recorrer todos los usuarios del sistema
    while ((pwd = getpwent()) != NULL) {
        // Construir comando para obtener tamaño del directorio
        snprintf(command, sizeof(command), "du -sm %s 2>/dev/null | cut -f1", pwd->pw_dir);
        
        // Ejecutar comando y leer resultado
        fp = popen(command, "r");
        if (fp != NULL) {
            fscanf(fp, "%d", &size);
            pclose(fp);
            
            // Verificar umbrales
            if (size > 500) {
                printf("BLOQUEAR: %s (%d MB)\n", pwd->pw_name, size);
            } else if (size > 300) {
                printf("ALERTAR ADMIN: %s (%d MB)\n", pwd->pw_name, size);
            } else if (size > 100) {
                printf("AVISAR USUARIO: %s (%d MB)\n", pwd->pw_name, size);
            }
        }
    }
    
    endpwent();
    return 0;
}
