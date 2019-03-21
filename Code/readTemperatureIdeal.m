function temp_mat=readTemperatureIdeal(waitTime,stop)
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
temp_mat=zeros(1,9);%Temperature Matrix



while ~stop && t < waitTime
    
    % Read data from serial port
    fopen(s);
    idn = fscanf(s);
    fclose(s);
    tmp=strsplit(idn);
    for i=1:9
        temp_mat(i)=str2double(tmp{i});
          %Converting to 3X3 matrix
        temp_mat(i)=transpose(reshape(temp_mat,3,3));   
    end
  
    

end


end

