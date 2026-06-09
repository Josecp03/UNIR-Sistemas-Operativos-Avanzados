#include <iostream>
#include <iomanip>

int main() {
    // Tipos de datos y variables
    int numero = 42;              // Entero
    float decimal = 3.14f;        // Número decimal
    char caracter = 'A';          // Un carácter
    std::string cadena = "Hola";  // Cadena de texto

    // Imprimir variables
    std::cout << "Número: " << numero << std::endl;
    std::cout << "Decimal: " << std::fixed << std::setprecision(2) << decimal << std::endl;
    std::cout << "Carácter: " << caracter << std::endl;
    std::cout << "Cadena: " << cadena << std::endl;

    // Modificar variables
    numero = 100;
    std::cout << "Número modificado: " << numero << std::endl;

    return 0;
}
