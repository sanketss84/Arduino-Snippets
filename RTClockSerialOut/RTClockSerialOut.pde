#include "Wire.h"
#define DS1307_ADDRESS 0x68

int alarmPin = 12;

void setup(){
  Wire.begin();
  Serial.begin(9600);
  pinMode(alarmPin, OUTPUT); //alarmPin
}

void loop(){
  printDate();
  delay(1000);
}

byte bcdToDec(byte val)  {
// Convert binary coded decimal to normal decimal numbers
  return ( (val/16*10) + (val%16) );
}

void printDate(){

  // Reset the register pointer
  Wire.beginTransmission(DS1307_ADDRESS);
  Wire.send(0);
  Wire.endTransmission();

  Wire.requestFrom(DS1307_ADDRESS, 7);

  int second = bcdToDec(Wire.receive());
  int minute = bcdToDec(Wire.receive());
  int hour = bcdToDec(Wire.receive() & 0b111111); //24 hour time
  int weekDay = bcdToDec(Wire.receive()); //0-6 -> sunday - Saturday
  int monthDay = bcdToDec(Wire.receive());
  int month = bcdToDec(Wire.receive());
  int year = bcdToDec(Wire.receive());

  //print the date EG   3/1/11 23:59:59
  Serial.print(monthDay);
  Serial.print("/");
  Serial.print(month);  
  Serial.print("/20");
  Serial.print(year);
  Serial.print(" ");
  Serial.print(hour);
  Serial.print(":");
  Serial.print(minute);
  Serial.print(":");
  Serial.print(second);
  Serial.print(" ");
  Serial.print(weekDay);
  
  if (weekDay == 1) Serial.println(" Sunday");
  if (weekDay == 2) Serial.println(" Monday");
  if (weekDay == 3) Serial.println(" Tuesday");
  if (weekDay == 4) Serial.println(" Wednesday");
  if (weekDay == 5) Serial.println(" Thursday");
  if (weekDay == 6) Serial.println(" Friday");
  if (weekDay == 7) Serial.println(" Saturday");
  
  //Alarm 1
  if (hour == 20 && minute == 3 && second == 0)
  {
    for (int i = 0; i <= 25; i++)
    {
      digitalWrite(alarmPin, HIGH);   
      delay(200);              
      digitalWrite(alarmPin, LOW);    
      delay(100); 
    }
  }

  
}
