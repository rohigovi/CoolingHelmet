// Libraries
#include <DHT.h>


// Initialize DHT sensor for normal 16mhz Arduino
DHT dht1(2, DHT22);
DHT dht2(4, DHT22);
int const stopPin = 6;
int stopFlag = 0;

void setup()
{
  pinMode(stopPin, INPUT);
  Serial.begin(9600);
  dht1.begin();
  dht2.begin();
}

float temp1=0;
float temp2=0;
void loop()
{
    delay(2000);
    // Read temperature from the dht22 sensor
    temp1 = dht1.readTemperature();    
    temp2 = dht2.readTemperature();
  
 
      
    // Check stop condition
    stopFlag = digitalRead(stopPin);
      if (stopFlag == LOW){
    Serial.println(String(temp1)+" "+String(temp2));
    
      }
      else{
    Serial.println(String(temp1)+" "+String(temp2));
    Serial.println(":999");
      }
    
      
    
}
