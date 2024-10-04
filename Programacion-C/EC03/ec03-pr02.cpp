#include <iostream>
using namespace std;
float presion[5];

int main()
{
    for(int i=0; i<5; i++){
        cout<<"Ingresar medidad de presion "<<i+1<<endl;
        cin>>presion[i];
    }
    cout<<"La ubicación de la tercera medida es: "<<presion+2<<endl;
    cout<<"La ubicación de la quinta medida es: "<<presion+4<<endl;

    return 0;
}
