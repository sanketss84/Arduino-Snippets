int sensorPin = 1; //analog pin 0
//int sensorPin2 = 0;

void setup(){
  Serial.begin(9600);
}

void loop(){
  int val = analogRead(sensorPin);
  //int val2 = digitalRead(sensorPin2);
  Serial.println(val);

  //just to slow down the output - remove if trying to catch an object passing by
  delay(1000);

}
