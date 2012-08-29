#include <Ethernet.h>
#include <SPI.h>
boolean reading = false;

////////////////////////////////////////////////////////////////////////
//CONFIGURE
////////////////////////////////////////////////////////////////////////
  byte ip[] = { 10, 44, 226, 107 };   //ip address to assign the arduino
  byte gateway[] = { 10, 44, 226, 1 }; //ip address of the gatewa or router

  //Rarly need to change this
  byte subnet[] = { 255, 255, 254, 0 };

  // if need to change the MAC address (Very Rare)
  byte mac[] = { 0x90, 0xA2, 0xDA, 0x00, 0x4D, 0x6D };

  Server server = Server(80); //port 80
////////////////////////////////////////////////////////////////////////

void setup(){
  //Pins 10,11,12 & 13 are used by the ethernet shield

  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);

  Ethernet.begin(mac, ip, gateway, subnet);
  server.begin();
}

void loop(){

  // listen for incoming clients, and process qequest.
  checkForClient();

}

void checkForClient(){

  Client client = server.available();

  if (client) {

    // an http request ends with a blank line
    boolean currentLineIsBlank = true;
    boolean sentHeader = false;

    while (client.connected()) {
      if (client.available()) {

        if(!sentHeader){
          // send a standard http response header
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println();
          sentHeader = true;
        }

        char c = client.read();

        if(reading && c == ' ') reading = false;
        if(c == '?') reading = true; //found the ?, begin reading the info

        if(reading){
          Serial.print(c);

           switch (c) {
            case '2':
              //add code here to trigger on 2
              triggerPin(2, client);
              break;
            case '3':
            //add code here to trigger on 3
              triggerPin(3, client);
              break;
            case '4':
            //add code here to trigger on 4
              triggerPin(4, client);
              break;
            case '5':
            //add code here to trigger on 5
              triggerPin(5, client);
              break;
            case '6':
            //add code here to trigger on 6
              triggerPin(6, client);
              break;
            case '7':
            //add code here to trigger on 7
              triggerPin(7, client);
              break;
            case '8':
            //add code here to trigger on 8
              triggerPin(8, client);
              break;
            case '9':
            //add code here to trigger on 9
              triggerPin(9, client);
              break;
          }

        }

        if (c == '\n' && currentLineIsBlank)  break;

        if (c == '\n') {
          currentLineIsBlank = true;
        }else if (c != '\r') {
          currentLineIsBlank = false;
        }

      }
    }

    delay(1); // give the web browser time to receive the data
    client.stop(); // close the connection:

  } 

}

void triggerPin(int pin, Client client){
//blink a pin - Client needed just for HTML output purposes.  
  client.print("Turning on pin ");
  client.println(pin);
  client.print("<br>");

  digitalWrite(pin, HIGH);
  delay(1000);
  digitalWrite(pin, LOW);
  delay(25);
}
