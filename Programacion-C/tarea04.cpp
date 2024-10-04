#include <iostream>
using namespace std;

int ladoA, ladoB, ladoC;
string tipotriangulo;

int main()
{
    cout<<"Programa para identificar el tipo de triángulo según la medida de sus lados"<<endl;
    cout<<"Ingrese la medida del lado A"<<endl;
    cin>>ladoA;
    cout<<"Ingrese la medida del lado B"<<endl;
    cin>>ladoB;
    cout<<"Ingrese la medida del lado C"<<endl;
    cin>>ladoC;

    if(ladoA==ladoB and ladoA==ladoC) {
        tipotriangulo = "equilatero";
    } else if(ladoA==ladoB or ladoA==ladoC or ladoB==ladoC) {
        tipotriangulo = "isoceles";
    } else {
        tipotriangulo = "irregular";
    }

    cout<<"El tipo de triangulo es: "<<tipotriangulo<<endl;
    cout<<"Aplicacion Desarrollada por: Aldo Pizarro Espinoza, Codigo: A17202187";

    /* code */
    return 0;
}


