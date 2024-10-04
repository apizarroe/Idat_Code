#include <iostream>
using namespace std;

//Linea de Comnentario
/*Comentario
Multilinea*/

float x,y,S,R,M,D;
bool var1,var2;

int main()
{
    x=5;
    y=4.2;
    S=x+y;
    R=x-y;
    M=x*y;
    D=x/y;
    
    cout<<"Suma: "<<S<<endl;
    cout<<"Resta: "<<R<<endl;
    cout<<"Multiplicacion: "<<M<<endl;
    cout<<"Division: "<<D<<endl;
    
    var1=true;
    var2=false;
    
    cout<<"Logica AND: "<<(var1&&var2)<<endl;
    cout<<"Logica OR: "<<(var1||var2)<<endl;
    
    return 0;
}
