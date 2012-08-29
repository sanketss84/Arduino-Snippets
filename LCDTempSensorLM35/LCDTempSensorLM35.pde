#include <LiquidCrystal.h>

const int lcdRows = 2;
const int lcdCols = 16;

const int inPin = 0; //Analog 0 - Sense Pin
const int outPin = 13; //ledPin to light when above threshold

const int threshold = 25;

String lcdDisplay = "Room Temp : LM35";

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() 
{
  // set up the LCD's number of columns and rows: 
  lcd.begin(lcdCols, lcdRows);
  // Print a message to the LCD.
  lcd.print(lcdDisplay);
  
  //LM35 
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
    
    lcd.setCursor(0, 1);
    lcd.print("TEMP:");
    lcd.print(celcius);
    lcd.print(" C");
  }
  else
  {
    digitalWrite(outPin,LOW);
    Serial.println("Temp below threshold");
    
    lcd.setCursor(0, 1);
    lcd.print("TEMP:");
    lcd.print(celcius);
    lcd.print(" C");
  }
  delay(1000);
  
  //lcd.clear();
}

void displayBlink(int blinks, int duration)
{
  while (blinks --)
  {
    lcd.noDisplay();
    delay(duration);
    lcd.display();
    delay(duration);
  }

}

void marquee(char *text)
{
  
  int length = strlen(text);
  lcd.print(length);
  
  if (length < lcdCols)
  {
    lcd.print(text);
  }
  else
  {
    int pos;
    for (pos = 0; pos < lcdCols; pos++)  
    {
      lcd.print(text[pos]);
    }
    delay(1000);
    while (pos < length)
    {
      lcd.scrollDisplayLeft();
      lcd.print(text[pos]);
      pos = pos + 1;
      delay(300);
    }
  }
}
