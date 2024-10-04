#include <iostream>
using namespace std;

char flag_itera='Y';
int n=1;
float temperatura=0.0, promedio=0.0, temperatura_final=0.0, promedio_celsius=0.0;

int main(){
    while(flag_itera=='Y'){
        cout<<"Ingrese el valor "<<n<<" de la temperatura en grados Kelvin: ";
        cin>>temperatura;
        temperatura_final=temperatura+temperatura_final;
        cout<<"Desea continuar con el proceso? (Y/N): ";
        cin>>flag_itera;
        if(flag_itera=='Y'){
            n++;
        }
    }
    promedio=temperatura_final/n;
    promedio_celsius=promedio-273.15;
    cout<<"Se ingresaron "<<n<<" valores de temperatura"<<endl;
    cout<<"El promedio de los valores es: "<<promedio_celsius<<" Grados Celsius";
}