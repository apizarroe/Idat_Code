/******************************************************************************
Autor: Aldo Pizarro Espinoza
Evaluacion: Evaluacion Final
Codigo: a17202187
*******************************************************************************/
#include <iostream>
using namespace std;

//Creacion de la Clase PLC
class PLC{
    private:
        short anoFabricacion;
        string Marca;
        string MAC;
        
    public:
        string Nombre;
        string Estacion;
        string IP;
        
    public:
        PLC(short anof, string marca, string mac, string nomb, string est, string ip){
            anoFabricacion = anof;
            Marca = marca;
            MAC = mac;
            Nombre = nomb;
            Estacion = est;
            IP = ip;
        }
        
        PLC(short anof, string marca, string mac){
            anoFabricacion = anof;
            Marca = marca;
            MAC = mac;
        }
        
        short getanoFabricacion(void){
            return anoFabricacion;
        }
        
        void setanoFabricacion(short anio){
            anoFabricacion = anio;
        }
        
        string getMarca(void){
            return Marca;
        }
        
        void setMarca(string marca){
            Marca = marca;
        }
        
        string getMac(void){
            return MAC;
        }
        
        void setMac(string mac){
            MAC = mac;
        }
        
        ~PLC(){} //destructor
};

//Creacion de la Clase MOTOR
class MOTOR{
    private:
        short anoFabricacion;
        string Marca;
		string potenciaNominal;
		string torqueNominal;
		string corrienteNominal;
        
    public:
        string Nombre;
        string Estacion;
        string potenciaMedia;
        
    public:
        MOTOR(short anof, string marca, string potenciaNom, string torqueNom, string corrienteNom, string nomb, string est){
            anoFabricacion = anof;
            Marca = marca;
			potenciaNominal = potenciaNom;
			torqueNominal = torqueNom;
			corrienteNominal = corrienteNom;
            Nombre = nomb;
            Estacion = est;
        }
        
        MOTOR(short anof, string marca, string potenciaNom, string torqueNom, string corrienteNom){
            anoFabricacion = anof;
			Marca = marca;
			potenciaNominal = potenciaNom;
			torqueNominal = torqueNom;
			corrienteNominal = corrienteNom;
        }
        
        short getanoFabricacion(void){
            return anoFabricacion;
        }
        
        void setanoFabricacion(short anio){
            anoFabricacion = anio;
        }
		
		string getMarca(void){
            return Marca;
        }
        
        void setMarca(string marca){
            Marca = marca;
        }
        
        string getPotenciaNominal(void){
            return potenciaNominal;
        }
        
        void setPotenciaNominal(string potenciaNom){
            potenciaNominal = potenciaNom;
        }
        
        string getTorqueNominal(void){
            return torqueNominal;
        }
        
        void setTorqueNominal(string torqueNom){
            torqueNominal = torqueNom;
        }
		
		string getCorrienteNominal(void){
            return corrienteNominal;
        }
        
        void setCorrienteNominal(string corrienteNom){
            corrienteNominal = corrienteNom;
        }
        
        ~MOTOR(){} //destructor
};

//Creacion de la Clase SENSOR
class SENSOR{
    private:
        short anoFabricacion;
        string Marca;
        string rango;
		string unidad;
		string tipoVariable;
        
    public:
        string Nombre;
        string Estacion;
		string medidaSensor;
        
    public:
        SENSOR(short anof, string marca, string rang, string unid, string tipoVar, string nomb, string est){
            anoFabricacion = anof;
            Marca = marca;
			rango = rang;
			unidad = unid;
			tipoVariable = tipoVar;
            Nombre = nomb;
            Estacion = est;
        }
        
        SENSOR(short anof, string marca, string rang, string unid, string tipoVar){
            anoFabricacion = anof;
            Marca = marca;
			rango = rang;
			unidad = unid;
			tipoVariable = tipoVar;
        }
        
        short getanoFabricacion(void){
            return anoFabricacion;
        }
        
        void setanoFabricacion(short anio){
            anoFabricacion = anio;
        }
        
        string getMarca(void){
            return Marca;
        }
        
        void setMarca(string marca){
            Marca = marca;
        }
        
        string getRango(void){
            return rango;
        }
        
        void setRango(string rang){
            rango = rang;
        }
		
		string getUnidad(void){
            return unidad;
        }
        
        void setUnidad(string unid){
            unidad = unid;
        }
		
		string getTipoVariable(void){
            return tipoVariable;
        }
        
        void setTipoVariable(string tipoVar){
            tipoVariable = tipoVar;
        }
        
        ~SENSOR(){} //destructor
};

int main()
{
    
    PLC PLC_ST_1 = PLC(2013, "Siemens", "68:7F:74:12:34:56", "PLC1", "ST2001", "192.168.0.1");
    cout << "Se creo el objeto PLC PLC_ST_1" << endl;
    cout << "Nombre: " << PLC_ST_1.Nombre << endl;
	cout << "Año de Fabricacion: " << PLC_ST_1.getanoFabricacion() << endl;
	cout << "Marca: " << PLC_ST_1.getMarca() << endl;
	cout << "Estacion: " << PLC_ST_1.Estacion << endl;
	cout << "IP: " << PLC_ST_1.IP << endl;
	cout << "MAC: " << PLC_ST_1.getMac() << endl;
	cout << "***************" <<endl;
	
	MOTOR MOTOR1 = MOTOR(2011, "ABB", "2.5 HP", "20 N-m", "10 A", "MOTOR001", "ST2001");
    cout << "Se creo el objeto MOTOR MOTOR1" << endl;
    cout << "Nombre: " << MOTOR1.Nombre << endl;
	cout << "Año de Fabricacion: " << MOTOR1.getanoFabricacion() << endl;
	cout << "Marca: " << MOTOR1.getMarca() << endl;
	cout << "Estacion: " << MOTOR1.Estacion << endl;
	cout << "Potencia Nominal: " << MOTOR1.getPotenciaNominal() << endl;
	cout << "Torque Nominal: " << MOTOR1.getTorqueNominal() << endl;
	cout << "Corriente Nominal: " << MOTOR1.getCorrienteNominal() << endl;
	cout << "***************" <<endl;
		
	//OBS: En el documento dentro de los atributos se indica MAC pero en la definicion de la clase no se tiene MAC, ni IP
	SENSOR SENSOR1 = SENSOR(2015, "Siemens", "-2 a 115", "Celsius", "Temperatura", "SENSOR001", "ST2001");
    cout << "Se creo el objeto SENSOR SENSOR1" << endl;
    cout << "Nombre: " << SENSOR1.Nombre << endl;
	cout << "Año de Fabricacion: " << SENSOR1.getanoFabricacion() << endl;
	cout << "Marca: " << SENSOR1.getMarca() << endl;
	cout << "Estacion: " << SENSOR1.Estacion << endl;
	cout << "Rango: " << SENSOR1.getRango() << endl;
	cout << "Unidad: " << SENSOR1.getUnidad() << endl;
	cout << "Tipo de Variable: " << SENSOR1.getTipoVariable() << endl;
	cout << "***************" <<endl;

    return 0;
}
