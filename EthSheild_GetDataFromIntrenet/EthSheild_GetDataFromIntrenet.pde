//Getting Data From The Web – Arduino + Ethernet 
//http://bildr.org/2011/06/arduino-ethernet-client/

#include <Ethernet.h>
#include <SPI.h>

////////////////////////////////////////////////////////////////////////
//CONFIGURE
////////////////////////////////////////////////////////////////////////
  byte ip[] = { 10, 44, 226, 107 };   //ip address to assign the arduino
  byte server[] = { 10, 44, 226, 103 }; //ip Address of the server you will connect to

  //The location to go to on the server
  //make sure to keep HTTP/1.0 at the end, this is telling it what type of file it is
  String location = "/PHPBildrEthShld/ HTTP/1.0";

  //Rarly need to change this
  byte subnet[] = { 255, 255, 255, 0 };

  // if need to change the MAC address (Very Rare)
  byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };

  Client client(server, 8080); // port 80 is typical www page

////////////////////////////////////////////////////////////////////////

char inString[32]; // string for incoming serial data
int stringPos = 0; // string index counter
boolean startRead = false; // is reading?

void setup(){
  Ethernet.begin(mac, ip);
  Serial.begin(9600);
  pinMode(2, OUTPUT);
}

void loop(){
  String pageValue = connectAndRead(); //connect to the server and read the output

  Serial.println(pageValue); //print out the findings.

  delay(5000); //wait 5 seconds before connecting again
}

String connectAndRead(){
 //connect to the server

  Serial.println("Connecting...");

  if (client.connect()) {
    Serial.println("-- Connected --");
    client.print("GET ");
    client.println(location);
    client.println();

    //Connected - Read the page
    return readPage(); //go and read the output

  }else{
    return "Connection Failed !!!!";
  }

}

String readPage(){
//read the page, and capture & return everything between '<' and '>'

  stringPos = 0;
  memset( &inString, 0, 32 ); //clear inString memory

  while(true){

    if (client.available()) {
      char c = client.read();

      if (c == '<' ) { //'<' is our begining character
        startRead = true; //Ready to start reading the part 
      }else if(startRead){

        if(c != '>'){ //'>' is our ending character
          inString[stringPos] = c;
          stringPos ++;
        }else{
          //got what we need here! We can disconnect now
          startRead = false;
          client.stop();
          client.flush();
          Serial.println("-- Disconnecting --");
          Serial.print("Data Read From Page : ");
          
          String temp = inString;
          if (temp == "Sanket")
          {
              digitalWrite(2, HIGH);
              delay(1000);
              digitalWrite(2, LOW);
          }
          
          
          return inString;
          
          
        }

      }
    }

  }

}
