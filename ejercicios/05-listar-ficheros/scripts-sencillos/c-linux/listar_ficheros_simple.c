#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char d[300], cmd[700];
    scanf("%299s", d);
    snprintf(cmd, sizeof(cmd), "find \"%s\" -maxdepth 1 -type f -printf '%%f %%s %%TY-%%Tm-%%Td %%TH:%%TM\\n' > listado_ficheros.txt", d);
    system(cmd);
    return 0;
}

