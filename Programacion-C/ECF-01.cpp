/******************************************************************************
Autor: Aldo Pizarro Espinoza
Evaluacion: Evaluacion Final
Codigo: a17202187
*******************************************************************************/
#include <iostream>
using namespace std;

float temperatura[100], sumatotal = 0, promedio = 0, potencia = 0;
int valores;

int
main () {
  int i = 0;
  cout << "B?Cuantos valores desea ingresar? ";
  cin >> valores;
  if (valores <= 100) {
    for (i; i < valores; i++) {
      cout << "Ingrese el valor de la temperatura " << i + 1 << ":";
      cin >> temperatura[i];
      sumatotal = sumatotal + temperatura[i];
    }
    promedio = sumatotal / valores;
    cout << "La temperatura promedio es: " << promedio << endl;
    if (promedio < 19) {
      potencia = 100;
    } else if (promedio >= 19 & promedio < 21) {
      potencia = 75;
    } else if (promedio >= 21 & promedio < 26) {
      potencia = 50;
    } else if (promedio >= 26 & promedio < 28) {
      potencia = 25;
    } else if (promedio >= 28) {
      potencia = 0;
    }
  cout << "La potencia debe estar al " << potencia << "%" << endl;
  }
  else
    {
      cout << "Cantidad de valores fuera de rango (máximo 100)" << endl;
    }
  return 0;
}
