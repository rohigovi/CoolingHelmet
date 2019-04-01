
close all
instrreset
clc
function main(stop)
% Desired temperature matrix, Should come from user input.
desiredtempmat=25*ones(3,3);

%Loop condition should be changed.
while ~stop

temp_mat=readTemperatureIdeal(0.1,false);
%Tells you which of the three control systems need to be activated.
activate=ChooseTube(temp_mat,desiredtempmat);

LinearControl(temp_mat,desiredtempmat,false);

end
end
