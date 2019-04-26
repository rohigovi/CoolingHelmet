
%% Create Model

close all
instrreset
clc

% waitTime:Acquisition time (min). Insert inf to disable time limit.
%% Acquire and display live data

% Open serial communication
s = serial('COM9','BAUD',9600);
%waitTime = duration(0,waitTime,0);
%startTime = datetime('now');
%t = datetime('now') - startTime;
temp=[];
T0=25;
count=0;
timebegin=0;
timeend=1;
h = figure;

while count<100
    
    % Read data from serial port
    fopen(s);
    idn = fscanf(s);
    fclose(s);
    tmp=strsplit(idn);
    temp=str2double(tmp);
    temp=temp(1:9);
    hold on;
    
    
    
    
    %% Initial Conditions
    %Input Initial Temp
    %Input Sensor Values
    if(~isnan((temp(1)))&&~isnan((temp(2)))&&~isnan((temp(3))))&&~isnan((temp(4)))&&~isnan((temp(5)))&&~isnan((temp(6)))&&~isnan((temp(7)))&&~isnan((temp(8)))&&~isnan((temp(9)))
        Sensor1val = temp(1);
        Sensor2val = temp(2);
        Sensor3val = temp(3);
        Sensor4val = temp(4);
        Sensor5val = temp(5);
        Sensor6val = temp(6);
        Sensor7val = temp(7);
        Sensor8val = temp(8);
        Sensor9val = temp(9);
        T0=mean(temp(1:9));
    end
    disp(temp);
    %% Create Geometry (or Import .STL)
    %gm = importGeometry(thermalmodel,'HelmetShape.STL');
    
    % Use simple shape for now that takes 3 data points
    thermalModel_ss = createpde('thermal','steadystate');
    thermalModel_tr = createpde('thermal','transient');
    importGeometry(thermalModel_tr,'Helmetshape.stl');
    %To plot faces:
    %pdegplot(thermalModel_tr,'FaceLabel','on','FaceAlpha',0.5)
    
    %% Define Thermal Constants
    %Change Constants
    thermalProperties(thermalModel_tr,'ThermalConductivity',100,'MassDensity',1,'SpecificHeat',1);
    %% Boundary Conditions
    %Temperature of Head
    thermalBC(thermalModel_tr,'Face',3,'Temperature',T0);
    %% Initial Conditions
    %We need to assign correct sensor values to relavant face
    thermalIC(thermalModel_tr,T0,"Cell",1);
    thermalIC(thermalModel_tr,Sensor1val,'Face',4);
    thermalIC(thermalModel_tr,Sensor2val,'Face',5);
    thermalIC(thermalModel_tr,Sensor3val,'Face',6);
    thermalIC(thermalModel_tr,Sensor4val,'Face',7);
    thermalIC(thermalModel_tr,Sensor5val,'Face',8);
    thermalIC(thermalModel_tr,Sensor6val,'Face',9);
    thermalIC(thermalModel_tr,Sensor7val,'Face',10);
    thermalIC(thermalModel_tr,Sensor8val,'Face',11);
    thermalIC(thermalModel_tr,Sensor9val,'Face',12);

    
    
    %% Generate Mesh and Plot
    
    generateMesh(thermalModel_tr);
    tlist = [timebegin,timeend];
    thermalresults = solve(thermalModel_tr,tlist);
    T = thermalresults.Temperature;
    
    Tmin = 0;
    Tmax = max(T(:,end));
    
    % for i = 1:numel(tlist)
    %     pdeplot3D(thermalModel_tr,'ColorMapData',T(:,i));
    %     hold on;
    %     caxis([Tmin,Tmax])
    %     view(130,10)
    %     title(['Temperature at Time ' num2str(tlist(i))]);
    %     M(i) = getframe;
    %
    % end
    pdeplot3D(thermalModel_tr,'ColorMapData',T(:,end))
    title(['Temperature at Time ' num2str(tlist(end))]);
    
    view(130,10)
    M(1) = getframe;
    hold on;
    timebegin=timebegin+1;
    timeend=timeend+1;
end
