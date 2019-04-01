// Libraries
#include <DHT.h>
#include <Servo.h>  //add '<' and '>' before and after servo.h
//Read data from 9 sensors
// Initialize DHT sensor for normal 16mhz Arduino
DHT dht1(4, DHT22);
int servoPin = 12; 
int const stopPin = 6;
float temp1=0;
int delaytime=0;
float error=0;
float tempdes=19.5;
Servo servo;

//Linear Temp control by varying amount of time valve remains open.ie. Higher error=Higher delay.
//Control input-temperature error
//Control output-delay time implemented after the servo.write function.

void setup()
{  
  dht1.begin();
  Serial.begin(9600);
  servo.attach(servoPin);
  pinMode(stopPin, INPUT);   
}
void loop()
{  
   
    // Read temperatures from a single DHT22 sensor. MATLAB var
    temp1 = dht1.readTemperature();  // MATLAB reads this.
    Serial.println(temp1);

    error=temp1-tempdes;
    int k=2500;
    delaytime=error*k;
    
    servo.write(45);//Opens valve.
   delay(delaytime);
   servo.write(150);//Closes valve.
   delay(2000);
   
}
    
 
    
