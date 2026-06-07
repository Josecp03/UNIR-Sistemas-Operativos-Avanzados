#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char d[300], cmd[600];
    int uid;

    scanf("%299s %d", d, &uid);
    snprintf(cmd, sizeof(cmd), "find \"%s\" -maxdepth 1 -type f -uid %d -print", d, uid);
    system(cmd);
    return 0;
}

