#include <Servo.h>

Servo myservo;

int dato;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  myservo.attach(10);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()==4){
    // Read the sign and the integer with two digits and null terminator
    char valueStr[4]; // 3 characters + null terminator
    Serial.readBytesUntil('\0', valueStr, 3);
    
    // Convert string to integer
    int value = atoi(valueStr);

    Serial.print("value:");    
    Serial.println(value);

    myservo.write(value);

    delay(50);

  }

}
