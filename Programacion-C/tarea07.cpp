#include <iostream>
using namespace std;

struct Alumno{
    char nombre[20];
    int DNI;
    float nota_prom;

};

int main()
{   Alumno Juan;
    cout<<"Ingrese nombres: ";
    cin>> Juan.nombre;

    cout<<"Ingrese DNI: ";
    cin>> Juan.DNI;

    cout<<"Ingrese Nota Promedio: ";
    cin>> Juan.nota_prom;

    cout<<"==============RESUMEN============== "<<endl;
    cout<<"El nombre del alumno es: "<< Juan.nombre<<endl;
    cout<<"El DNI del alumno es: "<< Juan.DNI<<endl;
    cout<<"La Nota Promedio del alumno es: "<< Juan.nota_prom;
    return 0;
}