#include <iostream>
using namespace std;
#define PI 3.141592 //constante simbolica

/*Nombre: Aldo Pizarro Espinoza*/

const float pi=3.141592; //constante implicita
float area, radio;

int main()
{
    cout<<"Ingrese radio: ";
    cin>>radio;
    area=radio*radio*pi;
    
    cout<<"Area: "<<area;
    return 0;
}
