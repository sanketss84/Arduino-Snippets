int audioIn = 0;
int val = 0;

void setup() {
Serial.begin(9600);
}

void loop() {
val = analogRead(audioIn);
//val = digitalRead(audioIn);
  if (val > 700){
  Serial.println(val);
  delay (100);
  }
} 
