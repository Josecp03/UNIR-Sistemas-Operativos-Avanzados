#include <iostream>
#include <functional>
#include <vector>

// Tipo de puntero a función
typedef int (*Operacion)(int, int);

// Funciones que pueden usarse como callbacks
int sumar(int a, int b) {
    return a + b;
}

int multiplicar(int a, int b) {
    return a * b;
}

// Función que recibe un puntero a función
int aplicar(int x, int y, Operacion op) {
    return op(x, y);
}

int main() {
    // Usar punteros a funciones
    std::vector<Operacion> operaciones = {sumar, multiplicar};

    std::cout << "Usando función sumar como puntero:" << std::endl;
    int resultado1 = operaciones[0](5, 3);
    std::cout << "5 + 3 = " << resultado1 << std::endl;

    std::cout << "\nUsando función multiplicar como puntero:" << std::endl;
    int resultado2 = operaciones[1](5, 3);
    std::cout << "5 * 3 = " << resultado2 << std::endl;

    std::cout << "\nUsando callback con función:" << std::endl;
    int resultado3 = aplicar(10, 2, sumar);
    std::cout << "Aplicar suma a 10, 2 = " << resultado3 << std::endl;

    std::cout << "\nUsando callback con función:" << std::endl;
    int resultado4 = aplicar(10, 2, multiplicar);
    std::cout << "Aplicar multiplicación a 10, 2 = " << resultado4 << std::endl;

    // Lambdas en C++11
    std::cout << "\nUsando lambdas:" << std::endl;
    auto restar = [](int a, int b) { return a - b; };
    std::cout << "10 - 2 = " << restar(10, 2) << std::endl;

    return 0;
}
