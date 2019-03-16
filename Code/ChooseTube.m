function activate= ChooseTube(heat_mat,ideal_heat_mat)
%Based on the error matrix, it chooses which of the three tube-based
%control systems need to be activated.
%Output is 3-element boolean array
close all
instrreset
clc
error=ideal_heat_mat-heat_mat;
%I'm just finding the rms of each column of the error matrix and comparing
%it to a threshold value. Feel free to experiment with other conditions.
threshold1=0.5; %Default threshold for control system 1
threshold2=0.5; %Default threshold for control system 2
threshold3=0.5; %Default threshold for control system 3
activate=[false false false];

if (rms(error(1:3,1))>threshold2)
    activate(1)=true;
end


if (rms(error(1:3,2))>threshold2)
    activate(2)=true;
end

if (rms(error(1:3,3))>threshold3)
    activate(3)=true;
end

end

