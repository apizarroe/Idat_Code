#include <iostream>
using namespace std;
/*Nombre: Aldo Pizarro Espinoza*/
int valorA,valorB,valorC,valorD,R;

int main()
{
    cout<<"Ingrese valor A: ";
    cin>>valorA;
    cout<<"Ingrese valor B: ";
    cin>>valorB;
    cout<<"Ingrese valor C: ";
    cin>>valorC;
    cout<<"Ingrese valor D: ";
    cin>>valorD;
    
    R=(valorA&&valorB)||(!valorC&&valorD);
    cout<<"El resultado es: "<<R<<endl;
    
    cout<<"Nombre: Aldo Pizarro Espinoza";

    return 0;
}
