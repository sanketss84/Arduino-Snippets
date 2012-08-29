//Serial Print
const int ledPin = 13;
int count = 0;

void setup()
{
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
}

void loop()
{
  
  Serial.print("Hello Serial ");
  Serial.println(count);
  delay(1000);
  count = count + 1;
}
