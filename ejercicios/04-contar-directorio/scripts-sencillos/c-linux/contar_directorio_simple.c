#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char d[300];
    char cmd[700];

    printf("Directorio: ");
    scanf("%299s", d);

    snprintf(cmd, sizeof(cmd), "find \"%s\" -maxdepth 1 -type f | wc -l", d);
    system(cmd);
    snprintf(cmd, sizeof(cmd), "find \"%s\" -mindepth 1 -maxdepth 1 -type d | wc -l", d);
    system(cmd);
    snprintf(cmd, sizeof(cmd), "find \"%s\" -maxdepth 1 -type f -perm -111 | wc -l", d);
    system(cmd);

    return 0;
}

