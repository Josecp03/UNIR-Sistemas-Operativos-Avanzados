#include <iostream>
#include <vector>

int main() {
    // Declaración de array
    int numeros[5] = {10, 20, 30, 40, 50};

    // Acceder a elementos
    std::cout << "Primer elemento: " << numeros[0] << std::endl;
    std::cout << "Último elemento: " << numeros[4] << std::endl;

    // Modificar elemento
    numeros[2] = 35;
    std::cout << "Elemento modificado: " << numeros[2] << std::endl;

    // Iterar sobre array
    std::cout << "\nTodos los elementos:" << std::endl;
    for (int i = 0; i < 5; i++) {
        std::cout << "numeros[" << i << "] = " << numeros[i] << std::endl;
    }

    // Array de cadenas (vector de strings)
    std::vector<std::string> frutas = {"Manzana", "Plátano", "Naranja"};
    std::cout << "\nFrutas:" << std::endl;
    for (int i = 0; i < frutas.size(); i++) {
        std::cout << "frutas[" << i << "] = " << frutas[i] << std::endl;
    }

    // Array bidimensional (matriz)
    int matriz[2][3] = {
        {1, 2, 3},
        {4, 5, 6}
    };
    std::cout << "\nMatriz:" << std::endl;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            std::cout << "matriz[" << i << "][" << j << "] = " << matriz[i][j] << std::endl;
        }
    }

    return 0;
}
