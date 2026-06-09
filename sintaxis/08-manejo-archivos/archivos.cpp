#include <iostream>
#include <fstream>
#include <string>

int main() {
    // Escribir en archivo
    std::ofstream archivo("archivo.txt");
    if (!archivo.is_open()) {
        std::cout << "Error al abrir archivo" << std::endl;
        return 1;
    }

    archivo << "Primera línea" << std::endl;
    archivo << "Segunda línea" << std::endl;
    archivo << "Tercera línea" << std::endl;
    archivo.close();

    std::cout << "Archivo escrito correctamente" << std::endl;

    // Leer archivo
    std::ifstream archivoLectura("archivo.txt");
    if (!archivoLectura.is_open()) {
        std::cout << "Error al abrir archivo" << std::endl;
        return 1;
    }

    std::string linea;
    std::cout << "\nLeyendo archivo:" << std::endl;
    while (std::getline(archivoLectura, linea)) {
        std::cout << linea << std::endl;
    }
    archivoLectura.close();

    // Agregar al archivo
    std::ofstream archivoAgregar("archivo.txt", std::ios::app);
    if (!archivoAgregar.is_open()) {
        std::cout << "Error al abrir archivo" << std::endl;
        return 1;
    }

    archivoAgregar << "Línea agregada" << std::endl;
    archivoAgregar.close();

    std::cout << "\nLínea agregada correctamente" << std::endl;

    return 0;
}
