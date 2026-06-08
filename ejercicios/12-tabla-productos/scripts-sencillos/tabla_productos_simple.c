#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINEA 256
#define MAX_COLUMNAS 20

int main() {
    FILE *entrada, *salida;
    char linea[MAX_LINEA];
    char campos[MAX_COLUMNAS][MAX_LINEA];
    int totales_columnas[MAX_COLUMNAS];
    int total_global = 0;
    int fila_total, num_campos, i;
    int linea_num = 0;
    
    entrada = fopen("entrada.tabla", "r");
    salida = fopen("salida.tabla", "w");
    
    if (!entrada || !salida) {
        perror("Error al abrir archivos");
        return 1;
    }
    
    // Inicializar totales de columnas
    memset(totales_columnas, 0, sizeof(totales_columnas));
    
    while (fgets(linea, MAX_LINEA, entrada)) {
        // Quitar salto de línea
        linea[strcspn(linea, "\n")] = 0;
        linea_num++;
        
        // Primera línea: copiar encabezados con Total
        if (linea_num == 1) {
            fprintf(salida, "%s Total\n", linea);
            continue;
        }
        
        // Separar campos
        num_campos = 0;
        char *token = strtok(linea, " ");
        while (token && num_campos < MAX_COLUMNAS) {
            strcpy(campos[num_campos], token);
            num_campos++;
            token = strtok(NULL, " ");
        }
        
        // Calcular total de fila
        fila_total = 0;
        for (i = 1; i < num_campos; i++) {
            fila_total += atoi(campos[i]);
            totales_columnas[i] += atoi(campos[i]);
        }
        
        // Escribir línea con total
        fprintf(salida, "%s %d\n", linea, fila_total);
        total_global += fila_total;
    }
    
    // Escribir fila de totales
    fprintf(salida, "Total");
    for (i = 1; i < num_campos; i++) {
        fprintf(salida, " %d", totales_columnas[i]);
    }
    fprintf(salida, " %d\n", total_global);
    
    fclose(entrada);
    fclose(salida);
    return 0;
}
