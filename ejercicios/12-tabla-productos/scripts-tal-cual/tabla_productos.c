#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINEA 256
#define MAX_COLUMNAS 20

// Función para procesar una línea y extraer campos
int procesar_linea(char *linea, char campos[][MAX_LINEA]) {
    int num_campos = 0;
    char linea_copia[MAX_LINEA];
    strcpy(linea_copia, linea);
    
    // Separar por espacios
    char *token = strtok(linea_copia, " ");
    while (token && num_campos < MAX_COLUMNAS) {
        strcpy(campos[num_campos], token);
        num_campos++;
        token = strtok(NULL, " ");
    }
    
    return num_campos;
}

// Función para calcular la suma de una fila (a partir del segundo campo)
int sumar_fila(char campos[][MAX_LINEA], int num_campos) {
    int suma = 0;
    for (int i = 1; i < num_campos; i++) {
        suma += atoi(campos[i]);
    }
    return suma;
}

int main() {
    FILE *entrada, *salida;
    char linea[MAX_LINEA];
    char campos[MAX_COLUMNAS][MAX_LINEA];
    int totales_columnas[MAX_COLUMNAS];
    int total_global = 0;
    int fila_total, num_campos;
    int linea_num = 0;
    
    // Abrir archivos
    entrada = fopen("entrada.tabla", "r");
    salida = fopen("salida.tabla", "w");
    
    if (!entrada || !salida) {
        perror("Error al abrir archivos");
        return 1;
    }
    
    // Inicializar totales de columnas
    memset(totales_columnas, 0, sizeof(totales_columnas));
    
    // Procesar línea por línea
    while (fgets(linea, MAX_LINEA, entrada)) {
        // Quitar salto de línea
        linea[strcspn(linea, "\n")] = 0;
        linea_num++;
        
        // Procesar campos
        num_campos = procesar_linea(linea, campos);
        
        // Si la línea está vacía, ignorar
        if (num_campos == 0) {
            continue;
        }
        
        // Si es la primera línea, copiar encabezados y añadir "Total"
        if (linea_num == 1) {
            fprintf(salida, "%s Total\n", linea);
            continue;
        }
        
        // Calcular total de fila
        fila_total = sumar_fila(campos, num_campos);
        
        // Actualizar totales de columnas
        for (int i = 1; i < num_campos; i++) {
            totales_columnas[i] += atoi(campos[i]);
        }
        
        // Escribir línea con su total
        fprintf(salida, "%s %d\n", linea, fila_total);
        
        // Actualizar total global
        total_global += fila_total;
    }
    
    // Escribir fila de totales
    fprintf(salida, "Total");
    for (int i = 1; i < num_campos; i++) {
        fprintf(salida, " %d", totales_columnas[i]);
    }
    fprintf(salida, " %d\n", total_global);
    
    // Cerrar archivos
    fclose(entrada);
    fclose(salida);
    
    return 0;
}
