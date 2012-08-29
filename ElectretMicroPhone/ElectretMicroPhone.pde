const int ledPin = 13;      // led connected to digital pin 13
const int electret = 0;  // the amplifier output is connected to analog pin 0

// these variables will change:
int sensorReading = 0;      // variable to store the value read from the sensor pin
int sensorMax = 0;
int sensorMin = 1023;
int threshold;


void setup() {
  pinMode(ledPin, OUTPUT); // declare the ledPin as as OUTPUT
  Serial.begin(9600);       // use the serial port
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  while (millis() < 3000) {
    threshold = analogRead(electret);

    // record the maximum sensor value
    if (threshold > sensorMax) {
      sensorMax = threshold;
    }

  }

  // signal the end of the calibration period
  digitalWrite(13, LOW);
  threshold = sensorMax;

}

void loop() {
  // read the sensor and store it in the variable sensorReading:
  sensorReading = analogRead(electret);    

  // if the sensor reading is greater than the threshold:
  if ((sensorReading >= threshold)) {
    Serial.println( sensorReading - threshold ); //Will send only positive and absolute values of waveform         

   // digitalWrite(ledPin, HIGH);
  //  delay(500);
  //  digitalWrite(ledPin,LOW);
  }

  }

