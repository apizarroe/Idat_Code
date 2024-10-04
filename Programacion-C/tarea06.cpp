#include <iostream>
using namespace std;

float fuerza=40, cte_elastica=5, deformacion=5, resultado=0;

void muestraDatos(){
    cout<<"Nombre: Aldo Pizarro Espinoza"<<endl;
    cout<<"Codigo: A17202187"<<endl;
}

float realizarCalculo(float fuerza, float cte_elastica, float deformacion){
    float y;
    y=fuerza-cte_elastica*deformacion;
    return y;
}

int main(){
    muestraDatos();
    resultado=realizarCalculo(fuerza, cte_elastica, deformacion);
    cout<<"El resultado del calculo es: "<<resultado;
}