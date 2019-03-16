function ControlTest(tdesired)
%Possibly a good way to test electronics before all sensors arrive.
%Doing a linear control on the amount of time the pump is turned on for
%Connect booster to pin D3
a=arduino()
waitTime=0;
while(abs(tdesired-currenttemp)>=1)    
currenttemp=ReadTemp(0.1);
error=tdesired-currenttemp;
startTime = datetime('now');
t = datetime('now') - startTime;
waitTime=waitTime-0.5*error;
waitTime = duration(0,waitTime,0);

while t<waitTime
configurePin(a,'D3','PWM')
pinMode=configurePin(a,'D3')
writePWMDutyCycle(a,'D3',0.5);
end

end