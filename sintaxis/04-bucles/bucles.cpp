#include <iostream>

int main() {
    // Bucle for
    std::cout << "Bucle for:" << std::endl;
    for (int i = 0; i < 5; i++) {
        std::cout << "i = " << i << std::endl;
    }

    // Bucle while
    std::cout << "\nBucle while:" << std::endl;
    int contador = 0;
    while (contador < 3) {
        std::cout << "contador = " << contador << std::endl;
        contador++;
    }

    // Bucle do-while (ejecuta al menos una vez)
    std::cout << "\nBucle do-while:" << std::endl;
    int valor = 0;
    do {
        std::cout << "valor = " << valor << std::endl;
        valor++;
    } while (valor < 3);

    // break y continue
    std::cout << "\nBucle con break y continue:" << std::endl;
    for (int j = 0; j < 10; j++) {
        if (j == 3) {
            continue;  // Salta a la siguiente iteración
        }
        if (j == 7) {
            break;     // Sale del bucle
        }
        std::cout << "j = " << j << std::endl;
    }

    return 0;
}
