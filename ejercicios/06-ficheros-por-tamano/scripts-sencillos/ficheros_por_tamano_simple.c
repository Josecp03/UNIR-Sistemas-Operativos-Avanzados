#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char d[300], cmd[800];
    double min, max;

    scanf("%299s %lf %lf", d, &min, &max);
    snprintf(cmd, sizeof(cmd),
             "find \"%s\" -maxdepth 1 -type f -size +%.0fk -size -%.0fk -print",
             d, min * 1024, max * 1024);
    system(cmd);

    return 0;
}

