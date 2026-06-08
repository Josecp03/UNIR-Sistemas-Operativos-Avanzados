#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main() {
    // Verificar valor NULL
    int *puntero = NULL;
    if (puntero == NULL) {
        printf("Error: puntero NULL\n");
    }

    // Verificar valor de retorno de función
    FILE *archivo = fopen("archivo_inexistente.txt", "r");
    if (archivo == NULL) {
        perror("Error al abrir archivo");  // Imprime el error del sistema
        printf("Código de error (errno): %d\n", errno);
        return 1;  // Retornar con código de error
    }

    // Verificar división por cero
    int divisor = 0;
    if (divisor == 0) {
        fprintf(stderr, "Error: División por cero\n");
        exit(EXIT_FAILURE);  // Salir con código de error
    }

    int dividendo = 10;
    int resultado = dividendo / divisor;
    printf("Resultado: %d\n", resultado);

    // Manejo de salida
    printf("Programa finalizado correctamente\n");
    return 0;  // Código de salida: éxito
}
