
const int A0pin = A0; // TMP36 #1 (6 inches)
const int A1pin = A1; // TMP36 #2 (36 inches)
const int A2pin = A2; // TMP36 #3 (72 inches)
const int A3pin = A3; // HTU21D
const int A4pin = A4; // photocell #1
const int A5pin = A5; // photocell #2

int A0val = 0;
int A1val = 0;
int A2val = 0;
int A3val = 0;
int A4val = 0;


void setup() {
  Serial.begin(1200); 
}

void loop() {

  A0val = analogRead(A0pin);   
  delay(50);  
  A1val = analogRead(A1pin);      
  delay(50);
  A2val = analogRead(A2pin);            
  delay(50);
  
  Serial.print("A0 = " );               
  Serial.print(tempInCelsius(analogReadToMillivolts(A0val, 0))); 
  Serial.print("C\t A1 = ");      
  Serial.print(tempInCelsius(analogReadToMillivolts(A1val, 0)));   
  Serial.print("C\t A2 = ");                               
  Serial.print(tempInCelsius(analogReadToMillivolts(A2val, .075))); 
  Serial.println("C");

  delay(2);                     
}

double analogReadToMillivolts(double aRead, double multiplier) {
    return (aRead/1023)*5000 * (1+multiplier);
}
double tempInCelsius(double mV) {
    return (mV - 500)/10;
}


