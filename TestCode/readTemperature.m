function currenttemp=readTemperature(waitTime,stop)
%Function that reads temperature data from 2 dht22 sensors
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
temp1=[];
temp2=[];



while ~stop && t < waitTime
    
    % Read data from serial port
    fopen(s);
    idn = fscanf(s);
    fclose(s);
    tmp=strsplit(idn);
    temp1(end+1)=str2double(tmp{1});
    temp2(end+1)=str2double(tmp{2});
disp('Temp1=:');
disp(temp1);
disp('Temp2=:');
disp(temp2);
end


end

