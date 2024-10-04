#include <iostream>
using namespace std;

int v[6] = {6,5,4,3,2,1};
float a = 5;
float *p;

int main()
{
    p = &a;
    
    v[3]=18;
    cout<<v[2]<<endl;
    cout<<v[3]<<endl;
    cout<<"Direccion de v[0]"<<v<<endl;
    cout<<"Direccion de v[1]"<<v+1<<endl;
    cout<<"Direccion de v[N]"<<v+2<<endl;
    cout<<"Direccion de a: "<<p;

    return 0;
}
