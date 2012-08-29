//http://www.youtube.com/watch?v=DnW_D16r5Hg&feature=related
//http://www.arduinoprojects.com/node/10
//http://tycoontalk.freelancer.com/php-forum/199411-serial-port-access-with-php.html

/*
PHP Code
$fp=fopen('COM6','rw');
//write to serial port
fwrite($fp,'light');

//read from serial port - not on windows
$str=fread($fp);

//close stream
fclose($fp);  
*/

int ledPin = 13;
int usbnumber = 0;

void setup() {
    pinMode(ledPin, OUTPUT);
    Serial.begin(9600);
}

void loop() {
    if (Serial.available() > 0) 
    {
        usbnumber = Serial.read();
    }

//    if (usbnumber > 0) {
//        if (usbnumber % 2 == 0){
//            digitalWrite(ledPin, HIGH);
//            delay(300);
//            digitalWrite(ledPin, LOW);
//            delay(300);
//        }else{
//            digitalWrite(ledPin, HIGH);
//            delay(300);
//            digitalWrite(ledPin, LOW);
//            delay(300);
//            digitalWrite(ledPin, HIGH);
//            delay(300);
//            digitalWrite(ledPin, LOW);
//            delay(300);
//        }

      if (usbnumber > 1)
      {
        digitalWrite(ledPin, HIGH);
        
      }
     // delay(100);
      if (usbnumber > 2)
      {
        digitalWrite(ledPin, LOW);
        
      }
  //    delay(100);
//        usbnumber = 0;
 //   }
}
