#include <stdio.h>
#include <pwd.h>

int main(void) {
    char u[100];
    scanf("%99s", u);
    struct passwd *p = getpwnam(u);

    if (p) printf("Existe\nUID: %d\n", p->pw_uid);
    else printf("No existe\n");

    return 0;
}

