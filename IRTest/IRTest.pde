/*
 * IRremote: IRrecvDemo - demonstrates receiving IR codes with IRrecv
 * An IR detector/demodulator must be connected to the input RECV_PIN.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>

const int ledPin = 13;
const int RECV_PIN = 2;

const int numberOfKeys = 5;    //5 keys are learned
long irKeyCodes[numberOfKeys]; //holds keys for each code

IRrecv irrecv(RECV_PIN);
decode_results results;

void setup()
{
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
}

void loop() 
{
  long key;
  
  if (irrecv.decode(&results)) 
  {
    
    key = convertCodetoKey(results.value); //No use
     
    Serial.print("HEX Code: ");   
    Serial.println(results.value,HEX);
    Serial.print("NORMAL Code: ");  
    Serial.println(results.value);
    //Serial.println(key);
    
    
    if (results.value == 0x80BF3BC4)
    {
      Serial.println("Hathway Power HEX Code "); 
    }
    if (results.value == 2160016324)
    {
      digitalWrite(ledPin,HIGH);
      delay(1000);
      digitalWrite(ledPin,LOW);
      Serial.println("Hathway Power Button Pressed");
    }
    if (results.value == 21516)
    {
      digitalWrite(ledPin,HIGH);
      delay(1000);
      digitalWrite(ledPin,LOW);
      Serial.println("Sony HT Power Button Pressed");
    }
    Serial.println("----------------------------------");
    irrecv.resume(); // Receive the next value
  }
}

//No use
int convertCodetoKey(long code)
{
  for (int i = 0; i < numberOfKeys; i++)
  {
    if ( code == irKeyCodes[i])
    {
      return i; //found a key so return it
    }
  
  }
  return -1;
}
