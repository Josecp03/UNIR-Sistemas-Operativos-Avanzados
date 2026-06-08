#include <stdio.h>
#include <stdlib.h>
#include <pwd.h>
#include <unistd.h>
#include <string.h>

// Función para obtener el tamaño de un directorio en MB
int get_dir_size(const char *dir) {
    char command[512];
    FILE *fp;
    int size = 0;
    
    snprintf(command, sizeof(command), "du -sm %s 2>/dev/null | cut -f1", dir);
    fp = popen(command, "r");
    
    if (fp != NULL) {
        fscanf(fp, "%d", &size);
        pclose(fp);
    }
    
    return size;
}

// Función para bloquear un usuario
void block_user(const char *username) {
    char command[256];
    snprintf(command, sizeof(command), "usermod -L %s", username);
    system(command);
    printf("El usuario %s ha sido bloqueado por exceder 500MB.\n", username);
}

// Función para enviar correo
void send_email(const char *to, const char *subject, const char *body) {
    char command[512];
    snprintf(command, sizeof(command), "echo '%s' | mail -s '%s' %s", body, subject, to);
    system(command);
}

int main() {
    struct passwd *pwd;
    int user_size;
    
    // Recorrer directorios de conexión de usuarios desde /etc/passwd
    while ((pwd = getpwent()) != NULL) {
        // Verificar si el directorio existe y es accesible
        if (access(pwd->pw_dir, F_OK) == 0) {
            // Calcular el tamaño del directorio en megabytes
            user_size = get_dir_size(pwd->pw_dir);
            
            // Si el tamaño es mayor a 500MB, bloquear al usuario
            if (user_size > 500) {
                block_user(pwd->pw_name);
            }
            // Si el tamaño es mayor a 300MB, enviar correo a root
            else if (user_size > 300) {
                char body[256];
                snprintf(body, sizeof(body), "El usuario %s tiene más de 300MB en su directorio.", pwd->pw_name);
                send_email("root", "Usuario con más de 300MB", body);
            }
            // Si el tamaño es mayor a 100MB, enviar correo al usuario
            else if (user_size > 100) {
                send_email(pwd->pw_name, "Exceso de espacio en el directorio", 
                          "Hay más de 100MB en tu directorio. Por favor, libera espacio.");
            }
        }
    }
    
    endpwent();
    return 0;
}
