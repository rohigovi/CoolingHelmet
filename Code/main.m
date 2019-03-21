close all
instrreset
clc
function main(stop)
desiredtempmat=25*ones(3,3);

while ~stop    
temp_mat=readTemperatureIdeal(0.1,false);
LinearControl(temp_mat,desiredtempmat,false);
end
end