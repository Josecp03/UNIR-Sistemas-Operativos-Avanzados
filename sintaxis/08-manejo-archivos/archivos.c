#include <stdio.h>
#include <stdlib.h>

int main() {
    // Escribir en archivo
    FILE *archivo = fopen("archivo.txt", "w");
    if (archivo == NULL) {
        printf("Error al abrir archivo\n");
        return 1;
    }

    fprintf(archivo, "Primera línea\n");
    fprintf(archivo, "Segunda línea\n");
    fprintf(archivo, "Tercera línea\n");
    fclose(archivo);

    printf("Archivo escrito correctamente\n");

    // Leer archivo
    archivo = fopen("archivo.txt", "r");
    if (archivo == NULL) {
        printf("Error al abrir archivo\n");
        return 1;
    }

    char linea[100];
    printf("\nLeyendo archivo:\n");
    while (fgets(linea, sizeof(linea), archivo) != NULL) {
        printf("%s", linea);
    }
    fclose(archivo);

    // Agregar al archivo
    archivo = fopen("archivo.txt", "a");
    if (archivo == NULL) {
        printf("Error al abrir archivo\n");
        return 1;
    }

    fprintf(archivo, "Línea agregada\n");
    fclose(archivo);

    printf("\n\nLínea agregada correctamente\n");

    return 0;
}
