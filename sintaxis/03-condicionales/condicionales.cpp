#include <iostream>
#include <string>

int main() {
    int numero = 10;

    // if - else
    if (numero > 5) {
        std::cout << "El número es mayor que 5" << std::endl;
    } else {
        std::cout << "El número es menor o igual a 5" << std::endl;
    }

    // if - else if - else
    if (numero < 0) {
        std::cout << "Número negativo" << std::endl;
    } else if (numero == 0) {
        std::cout << "Número cero" << std::endl;
    } else {
        std::cout << "Número positivo" << std::endl;
    }

    // Operador ternario
    std::string resultado = (numero > 5) ? "Mayor" : "Menor o igual";
    std::cout << "Resultado ternario: " << resultado << std::endl;

    // switch
    int opcion = 2;
    switch (opcion) {
        case 1:
            std::cout << "Opción 1 seleccionada" << std::endl;
            break;
        case 2:
            std::cout << "Opción 2 seleccionada" << std::endl;
            break;
        default:
            std::cout << "Opción no válida" << std::endl;
    }

    return 0;
}
