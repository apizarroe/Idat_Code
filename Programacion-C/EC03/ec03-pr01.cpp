#include <iostream>
using namespace std;
float res1, res2, res3, resEquivalenteFinal;

void mostrardatos(){
    cout<<"Nombre y Apellido: "<<"Aldo Pizarro Espinoza"<<endl;
    cout<<"Codigo de Estudiante: "<<"a17202187"<<endl;
}

float calculoResistencia(float r1, float r2, float r3){
    float resEquivalente=0.0;
    resEquivalente = (1/((1/r1)+(1/r2)+(1/r3)));
    return resEquivalente;
}

int main()
{
    mostrardatos();
    cout<<"Ingrese el valor de resistencia 1: ";
    cin>>res1;
    cout<<"Ingrese el valor de resistencia 2: ";
    cin>>res2;
    cout<<"Ingrese el valor de resistencia 3: ";
    cin>>res3;
    resEquivalenteFinal = calculoResistencia(res1, res2, res3);
    cout<<"El valor de la resistencia equivalente es: "<<resEquivalenteFinal;
    return 0;
}