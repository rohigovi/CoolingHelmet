// Libraries
#include <DHT.h>
#include <Servo.h>  //add '<' and '>' before and after servo.h
//Read data from 9 sensors
// Initialize DHT sensor for normal 16mhz Arduino
// For later on, add 7 more sensor objects.
DHT dht1(4, DHT22);
DHT dht2(8, DHT22);
int servoPin = 12; 
int const stopPin = 6;
char a;
Servo servo;  
 

int stopFlag = 0;

void setup()
{
  pinMode(stopPin, INPUT);
  Serial.begin(9600);
  dht1.begin();
  dht2.begin();
  servo.attach(servoPin);

}

float temp1=0;
float temp2=0;

void loop()
{
    delay(2000);
    // Read temperatures from the 2 dht22 sensors
    temp1 = dht1.readTemperature();    
      
    // Check stop condition
    stopFlag = digitalRead(stopPin);
      if (stopFlag == LOW){
    Serial.println(String(temp1));
      }
      else{
   Serial.println(String(temp1));
   Serial.println(":999");
      }
   if(Serial.available()>0)
   {
   int a=Serial.parseInt(); //Read Command from MATLAB. 1-close valve, 2-open valve.
                            
   if(a==1){
     
    servo.write(45); //Open one valve, closes other valve
    delay(5000);
   }
   if(a==2){
    servo.write(150); //Vice versa
   }

   }


   
//Demo 1 Code
//    if (temp1>20 && temp1>temp2){
//   servo.write(60);      // Turn SG90 servo Left to 45 degrees
//   Serial.println("Temp1: "+String(temp1)+" Temp2: "+String(temp2));
//   Serial.println("Servo turned to 60 degrees:closed channel 1");
//
//   delay(1000);  
//    }
//    if (temp2>20 && temp2>temp1){
//      servo.write(150);
//      Serial.println("Servo turned to 90 degrees: closed channel 2");
//      delay(1000);
//    }
//    
      
    
}
