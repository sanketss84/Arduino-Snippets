//Sense Light in a Room using LDR
//Pg 152,159,170 Ardiuno Cookbook

const int ldrPin = 0;
const int ledPin = 13;
int val = 0; // variable to store value from sensor

//Read Volts and output to serial port
const int referenceVolts = 5;
//const int batteryPin is same as ldrPin

void setup()
{
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
}

void loop()
{
  val = analogRead(ldrPin);
  digitalWrite(ledPin,HIGH);
  delay(val);
  digitalWrite(ledPin,LOW);
  delay(val);
  
  //Read Value from sensor 
  //val = analogRead(batteryPin);
  float volts = (val/1023) * referenceVolts; //Cal the Ratio
  Serial.println(volts);
}
