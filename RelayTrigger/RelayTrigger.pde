//Simple Labs Relay Board.
//Black : +5V
//Brown : Gnd
//Orange : Trigger Pin

int trigger = 12;

void setup()
{
  pinMode(trigger, OUTPUT);
}

void loop()
{
  digitalWrite(trigger, HIGH);   // set the LED on
  delay(1000);              // wait for a second
  digitalWrite(trigger, LOW);    // set the LED off
  delay(1000);              // wait for a second
}
