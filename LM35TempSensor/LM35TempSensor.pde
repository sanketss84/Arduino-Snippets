//LM35 Temp Sensor

const int inPin = 0; //Analog 0 - Sense Pin
const int outPin = 13; //ledPin to light when above threshold

const int threshold = 25;

void setup()
{
  Serial.begin(9600);
  pinMode(outPin,OUTPUT);
}

void loop()
{
  int tempValue = analogRead(inPin);
  long celcius = (tempValue * 500L)/1024;
  
  
  Serial.print("Degree Celcius: ");
  Serial.println(celcius);
  
  if (celcius > threshold)
  {
    digitalWrite(outPin,HIGH);
    Serial.println("Temp above threshold");
  }
  else
  {
    digitalWrite(outPin,LOW);
    Serial.println("Temp below threshold");
  }
  delay(1000);
}
