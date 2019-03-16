// Libraries
#include <DHT.h>

//Read data from 9 sensors
// Initialize DHT sensor for normal 16mhz Arduino
DHT dht1(2, DHT22);
DHT dht2(3, DHT22);
DHT dht3(4, DHT22);
DHT dht4(5, DHT22);
DHT dht5(6, DHT22);
DHT dht6(7, DHT22);
DHT dht7(8, DHT22);
DHT dht8(9, DHT22);
DHT dht9(10, DHT22);

int const stopPin = 6;
int stopFlag = 0;

void setup()
{
  pinMode(stopPin, INPUT);
  Serial.begin(9600);
  dht1.begin();
  dht2.begin();
  dht3.begin();
  dht4.begin();
  dht5.begin();
  dht6.begin();
  dht7.begin();
  dht8.begin();
  dht9.begin();
}

float temp1=0;
float temp2=0;
float temp3=0;
float temp4=0;
float temp5=0;
float temp6=0;
float temp7=0;
float temp8=0;
float temp9=0;

void loop()
{
    delay(2000);
    // Read temperatures from the 9 dht22 sensors
    temp1 = dht1.readTemperature();    
    temp2 = dht2.readTemperature();
    temp3 = dht3.readTemperature();    
    temp4 = dht4.readTemperature();
    temp5 = dht5.readTemperature();    
    temp6 = dht6.readTemperature();
    temp7 = dht7.readTemperature();    
    temp8 = dht8.readTemperature();
    temp9 = dht9.readTemperature();    
      
    // Check stop condition
    stopFlag = digitalRead(stopPin);
      if (stopFlag == LOW){
    Serial.println(String(temp1)+" "+String(temp2)+" "+String(temp3)+" "+String(temp4)+" "+String(temp5)+" "+String(temp6)+" "+String(temp7)+" "+String(temp8)+" "+String(temp9));
    
      }
      else{
    Serial.println(String(temp1)+" "+String(temp2)+" "+String(temp3)+" "+String(temp4)+" "+String(temp5)+" "+String(temp6)+" "+String(temp7)+" "+String(temp8)+" "+String(temp9));
    Serial.println(":999");
      }
    
      
    
}
