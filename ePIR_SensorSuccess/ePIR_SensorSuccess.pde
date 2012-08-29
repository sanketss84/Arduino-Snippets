int sensePin = 0;
int sensorValue = 0;
int LedBuzzPin = 12;

void setup()
{
  pinMode(LedBuzzPin, OUTPUT); 
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensePin);    
  Serial.print("Sense Value: ");
  Serial.println(sensorValue);      
  
  if (sensorValue == 0)
  {
    
      digitalWrite(LedBuzzPin, HIGH);  
      delay (200);
      digitalWrite(LedBuzzPin, LOW); 
    
  }
  
  delay (100);
}
