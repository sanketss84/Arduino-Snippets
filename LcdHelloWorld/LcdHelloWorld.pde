/*
  LiquidCrystal Library - Hello World
 
 Demonstrates the use a 16x2 LCD display.  The LiquidCrystal
 library works with all LCD displays that are compatible with the 
 Hitachi HD44780 driver. There are many of them out there, and you
 can usually tell them by the 16-pin interface.
 
 This sketch prints "Hello World!" to the LCD
 and shows the time.
 
  The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * LCD R/W pin to ground
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 
 Library originally added 18 Apr 2008
 by David A. Mellis
 library modified 5 Jul 2009
 by Limor Fried (http://www.ladyada.net)
 example added 9 Jul 2009
 by Tom Igoe
 modified 22 Nov 2010
 by Tom Igoe
 
 This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/LiquidCrystal
 */

// include the library code:
#include <LiquidCrystal.h>

const int lcdRows = 2;
const int lcdCols = 16;

String lcdDisplay = "Sanket's LCDTest!";

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(lcdCols, lcdRows);
  // Print a message to the LCD.
  lcd.print(lcdDisplay);
}

void loop() {
  lcd.setCursor(0, 0);
  lcd.print(lcdDisplay);
  //delay(2000);
  //marquee("This message is just too long for 16x2 LCD Row");
  
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(millis()/1000);
  
  
  //Blink Start
  //lcd.setCursor(9, 1);
  //lcd.print("BLINK!");
  //lcd.setCursor(9, 1);
  //lcd.blink();
  //delay(2000);
  //Blink End
  
  //LCD Clear
  //lcd.setCursor(0, 0);
  //lcd.print("Display CLR in 2s");
  //delay(2000);
  //lcd.clear();
  
  //Display Blink or Flash
  //lcd.setCursor(9, 1);
  //lcd.print("FLASH!");
  //displayBlink(2,250);
  //displayBlink(2,500);

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
