#include <iostream>
using namespace std;

/*Nombre: Aldo Pizarro Espinoza*/

float A=4.2,B=3.5,C=7.3,operacion_2,operacion_1;

int main()
{
    operacion_2=(A+B-C)*A;
    operacion_1=((A+B)-(C*A))/B;
    cout<<"El resultado de operacion_1 es: "<<operacion_1<<endl;
    cout<<"El resultado de operacion_2 es: "<<operacion_2<<endl;
}
