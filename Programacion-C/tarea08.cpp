#include <iostream>
using namespace std;

struct dispositivo{
    char marca[20];
    float potencia;
    float horas_uso_dia;
};

int main()
{   dispositivo laptop,refrigeradora,foco_1,foco_2;

    cout<<"===================================="<<endl;
    cout<<"Ingrese la marca de la laptop: ";
    cin>>laptop.marca;
    cout<<"Ingrese la potencia de la laptop: ";
    cin>>laptop.potencia;
    cout<<"Ingrese las horas por dia que usa la laptop: ";
    cin>>laptop.horas_uso_dia;    
    cout<<"===================================="<<endl;  
    cout<<"Ingrese la marca de la refrigeradora: ";
    cin>>refrigeradora.marca;
    cout<<"Ingrese la potencia de la refrigeradora: ";
    cin>>refrigeradora.potencia;
    cout<<"Ingrese las horas por dia que usa la refrigeradora: ";
    cin>>refrigeradora.horas_uso_dia; 
    cout<<"===================================="<<endl; 

    float pot= laptop.potencia*laptop.horas_uso_dia+refrigeradora.potencia*refrigeradora.horas_uso_dia;
    cout<<"La Potencia total del consumo por dia es: "<<pot;

    return 0;
}