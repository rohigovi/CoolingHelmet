/*
Arduino Code to run servo based on inputs from MATLAB's linearcontrol.m
*/
 
#include <Servo.h>  //add '<' and '>' before and after servo.h
int a = 0;
int servoPin = 9;
 
Servo servo;  
 
int servoAngle = 0;   // servo position in degrees
 
void setup()
{
  Serial.begin(9600);  
  servo.attach(servoPin);
}
 
 
void loop()
{ 
//control the servo's direction and the position of the motor
   
   a=Serial.read();   
   if(a==1){
   servo.write(45);      // Turn SG90 servo Left to 45 degrees
   delay(1000);          // Wait 1 second
   }
   if(a==2){
   servo.write(90);      // Turn SG90 servo Left to 45 degrees
   delay(1000);          // Wait 1 second
   }
   if(a==3){
   servo.write(45);      // Turn SG90 servo Left to 45 degrees
   delay(1000);          // Wait 1 second
   }
}
