function LinearControl(heat_mat,ideal_heat_mat,activate)
close all
instrreset
clc

error=heat_mat-ideal_heatmat;
%Doing a control by varying amount that the valve is compressed

k1=0.5;
k2=0.5;
k3=0.5;
servo1=0;
servo2=0;
servo3=0;
s = serial('COM9','BAUD',9600); %Conflicting with temperature reading?
if activate(1)
    while(rms(error(1:3,1))>threshold1)
    servo1=servo1+k1*mean(error(1:3,1));
    fopen(s)
    fprintf(s,'Servo1='+num2str(servo1))
    end
    
end
if activate(2)
    while(rms(error(1:3,2))>threshold2)
    servo2=servo2+k2*mean(error(1:3,2));
    fopen(s)
    fprintf(s,'Servo2='+num2str(servo2))
    end
    
end
if activate(3)
    while(rms(error(1:3,1))>threshold3)
    servo1=servo1+k3*mean(error(1:3,3));
    fopen(s)
    fprintf(s,'Servo2='+num2str(servo1))
    end
    
end



