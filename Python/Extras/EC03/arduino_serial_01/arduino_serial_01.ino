char dato;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(7, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()>0){
    dato = Serial.read();
    if(dato == 'a'){
      digitalWrite(7, HIGH);
    }
    if(dato == 'b'){
      digitalWrite(7, LOW);
    }
  }

}
