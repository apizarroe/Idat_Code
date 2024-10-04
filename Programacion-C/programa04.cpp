#include <iostream>
using namespace std;

//Nombre: Aldo Pizarro Espinoza
//Codigo: a17202187
float ph;

int main()
{
    
    cout << "Ingrese el PH " << endl;
    cin >> ph;
    
    if (ph>=0 and ph<7){
        cout << "PH Acido" << endl;
    } else if(ph==7) {
        cout << "PH Neutro" << endl;
    } else if(ph>7 and ph<=14) {
        cout << "PH Básico" << endl;
    } else {
        cout << "PH Incorrecto" << endl;
    }

    return 0;
}