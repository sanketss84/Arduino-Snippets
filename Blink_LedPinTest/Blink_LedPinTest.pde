/*
  Blink MOD
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

const int ledPin = 2; //2 To 13
const int aledPin = 0; //0 To 5

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(ledPin, OUTPUT);  
  pinMode(aledPin, OUTPUT);     
}

void loop() {
  digitalWrite(ledPin, HIGH);   // set the LED on
  delay(1000);              // wait for a second
  digitalWrite(ledPin, LOW);    // set the LED off
  delay(1000);              // wait for a second
  
  analogWrite(aledPin, HIGH);   // set the LED on
  delay(1000);              // wait for a second
  analogWrite(aledPin, LOW);    // set the LED off
  delay(1000);              // wait for a second
}
