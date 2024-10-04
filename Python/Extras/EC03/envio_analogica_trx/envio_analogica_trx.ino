const int analogPin = A0; // Analog input pin

void setup() {
  Serial.begin(9600); // Start serial communication
}

void loop() {
  int sensorValue = analogRead(analogPin); // Read analog value
  Serial.println(sensorValue); // Print the value to the serial monitor
  delay(1000); // Optional delay to control the data transmission rate
}