function temp1array=readTemperatureIdeal(waitTime,stop)
%Function that reads temperature data from 9 dht22 sensors
close all
instrreset
clc

% waitTime:Acquisition time (min). Insert inf to disable time limit.
%% Acquire and display live data

% Open serial communication
s = serial('COM9','BAUD',9600);
 
waitTime = duration(0,waitTime,0);
startTime = datetime('now');
t = datetime('now') - startTime;
temp_mat=zeros(1,2);%Temperature Matrix

temp1array=[];
count=0;
while (count<300)
    % Read data from serial port
    fopen(s);
    idn = fscanf(s);
    fclose(s);
  
        temp1array(end+1)=str2double(idn);
   
        disp(str2double(idn));
     
     if (temp_mat(1)>20 && temp_mat(1)>temp_mat(2))
    
    fprintf("1");
     disp("Servo turned to 60 degrees:closed channel 1");
     pause(1);
     fclose(s);
     end
     if (temp_mat(2)>20 && temp_mat(2)>temp_mat(1))
     fprintf("2");
     disp("Servo turned to 150 degrees:closed channel 2");
 
     pause(1);
     fclose(s);
     end
    count=count+1;
end

