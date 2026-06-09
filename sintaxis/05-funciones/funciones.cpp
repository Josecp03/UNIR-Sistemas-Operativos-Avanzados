#include <iostream>

// Función sin parámetros y sin retorno
void saludar() {
    std::cout << "¡Hola!" << std::endl;
}

// Función con parámetros
int suma(int a, int b) {
    return a + b;
}

// Función con parámetros y retorno
float dividir(float dividendo, float divisor) {
    if (divisor == 0) {
        std::cout << "Error: División por cero" << std::endl;
        return 0;
    }
    return dividendo / divisor;
}

// Función con parámetros por referencia
void incrementar(int &numero) {
    numero++;
}

int main() {
    // Llamar función sin parámetros
    saludar();

    // Llamar función y usar el retorno
    int resultado = suma(5, 3);
    std::cout << "Suma: " << resultado << std::endl;

    // Llamar función con retorno
    float division = dividir(10, 2);
    std::cout << "División: " << division << std::endl;

    // Pasar por referencia
    int numero = 10;
    incrementar(numero);
    std::cout << "Número incrementado: " << numero << std::endl;

    return 0;
}
