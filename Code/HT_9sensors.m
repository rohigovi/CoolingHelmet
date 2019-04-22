
%% Create Model
thermalModel_ss = createpde('thermal','steadystate')
thermalModel_tr = createpde('thermal','transient')

%% Create Geometry (or Import .STL)
%gm = importGeometry(thermalmodel,'HelmetGeometry2.STL');

% Use simple shape for now that takes 3 data points
importGeometry(thermalModel_tr,'Helmetshape.STL');
pdegplot(thermalModel_tr,'FaceLabels','on','FaceAlpha',0.5,'CellLabels','on')
axis equal

%% Define Thermal Constants
%Change Constants
thermalProperties(thermalModel_tr,'ThermalConductivity',1,'MassDensity',1,'SpecificHeat',1)
%% Boundary Conditions
%Temperature of Head
thermalBC(thermalModel_tr,'Face',3,'Temperature',36.5)
%% Initial Conditions
%Input Sensor Values
Sensor1val = 10;
Sensor2val = 20;
Sensor3val = 15;
Sensor4val = 10;
Sensor5val = 15;
Sensor6val = 25;
Sensor7val = 15;
Sensor8val = 17;
Sensor9val = 21;

%Input Initial Temp
T0 = (Sensor1val+Sensor2val+Sensor3val+Sensor4val+Sensor5val+Sensor6val+Sensor7val+Sensor8val+Sensor9val)/9;

thermalIC(thermalModel_tr,T0,'Cell',1)
thermalIC(thermalModel_tr,Sensor1val,'Face',4)
thermalIC(thermalModel_tr,Sensor2val,'Face',5)
thermalIC(thermalModel_tr,Sensor3val,'Face',6)
thermalIC(thermalModel_tr,Sensor4val,'Face',7)
thermalIC(thermalModel_tr,Sensor5val,'Face',8)
thermalIC(thermalModel_tr,Sensor6val,'Face',9)
thermalIC(thermalModel_tr,Sensor7val,'Face',10)
thermalIC(thermalModel_tr,Sensor8val,'Face',11)
thermalIC(thermalModel_tr,Sensor9val,'Face',12)



%% Generate Mesh and Plot

generateMesh(thermalModel_tr);
tlist = [0,2,5:5:50];
thermalresults = solve(thermalModel_tr,tlist)
T = thermalresults.Temperature;

Tmin = 0;
Tmax = max(T(:,end));

h = figure;
for i = 1:numel(tlist)
    pdeplot3D(thermalModel_tr,'ColorMapData',T(:,i))
    caxis([Tmin,Tmax])
    view(130,10)
    title(['Temperature at Time ' num2str(tlist(i))]);
    M(i) = getframe;
   
end

