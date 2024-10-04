#include <iostream>
#include <string>
using namespace std;

struct Plc{
    string marca;
    string IP;
    string MAC;
    int entradas;
    int salidas;
};

int main(){
    Plc plc1;
    plc1.marca = "SIEMENS";
    plc1.IP = "192.168.1.100";
    plc1.MAC = "A01ABCDEA409";
    plc1.entradas = 3;
    plc1.salidas = 3;
    
    Plc plc2;
    plc2.marca = "SIEMENS";
    plc2.IP = "192.168.1.200";
    plc2.MAC = "A01AB5689A40";
    plc2.entradas = 4;
    plc2.salidas = 2;
    
    cout<<"========PLC01========"<<endl;
    cout<<"La marca es: "<<plc1.marca<<endl;
    cout<<"La IP es: "<<plc1.IP<<endl;
    cout<<"La MAC es: "<<plc1.MAC<<endl;
    cout<<"Las entradas son: "<<plc1.entradas<<endl;
    cout<<"Las salidas son: "<<plc1.salidas<<endl;
    
    cout<<"========PLC02========"<<endl;
    cout<<"La marca es: "<<plc2.marca<<endl;
    cout<<"La IP es: "<<plc2.IP<<endl;
    cout<<"La MAC es: "<<plc2.MAC<<endl;
    cout<<"Las entradas son: "<<plc2.entradas<<endl;
    cout<<"Las salidas son: "<<plc2.salidas<<endl;
    
    return 0;
}