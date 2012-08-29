//Arduino PHP Serial Code

String readString;

void setup() 
{
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() 
{
  while (Serial.available()) 
  {
    delay(10);
    char c = Serial.read();
    if (c == ',') 
    {
      break;
    }
  readString += c; 
  }
 
  if (readString == "light") 
  {
    if(digitalRead(13) == LOW)
    {
      digitalWrite(13, HIGH);
      delay(100);
      Serial.println(1);
    }
    else if(digitalRead(13) == HIGH)
    {
      digitalWrite(13, LOW);
      delay(100);
      Serial.println(0);
    }
  readString="";
  }
}
