#include <iostream>
#include <fstream>
#include <cerrno>
#include <cstring>

int main() {
    // Verificar puntero NULL
    int *puntero = nullptr;
    if (puntero == nullptr) {
        std::cout << "Error: puntero NULL" << std::endl;
    }

    // Verificar apertura de archivo
    std::ifstream archivo("archivo_inexistente.txt");
    if (!archivo.is_open()) {
        std::cerr << "Error al abrir archivo: " << std::strerror(errno) << std::endl;
        std::cerr << "Código de error (errno): " << errno << std::endl;
        return 1;  // Retornar con código de error
    }

    // Verificar división por cero
    int divisor = 0;
    if (divisor == 0) {
        std::cerr << "Error: División por cero" << std::endl;
        exit(EXIT_FAILURE);  // Salir con código de error
    }

    int dividendo = 10;
    int resultado = dividendo / divisor;
    std::cout << "Resultado: " << resultado << std::endl;

    // Manejo de salida
    std::cout << "Programa finalizado correctamente" << std::endl;
    return 0;  // Código de salida: éxito
}
