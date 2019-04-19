
%% Create Model
thermalModel_ss = createpde('thermal','steadystate')
thermalModel_tr = createpde('thermal','transient')

%% Create Geometry (or Import .STL)
%gm = importGeometry(thermalmodel,'HelmetShape.STL');

% Use simple shape for now that takes 3 data points
importGeometry(thermalModel_tr,'HelmetGeometry2.stl');
pdegplot(thermalModel_tr,'FaceLabels','on','FaceAlpha',0.5)
axis equal

%% Define Thermal Constants
%Change Constants
thermalProperties(thermalModel_tr,'ThermalConductivity',1,'MassDensity',1,'SpecificHeat',1)
%% Boundary Conditions
%Temperature of Head
thermalBC(thermalModel_tr,'Face',3,'Temperature',36.5)
%% Initial Conditions
%Input Initial Temp
T0 = 25;
%Input Sensor Values
Sensor1val = 10;
Sensor2val = 20;
Sensor3val = 15;

thermalIC(thermalModel_tr,T0)
thermalIC(thermalModel_tr,Sensor1val,'Face',4)
thermalIC(thermalModel_tr,Sensor1val,'Face',5)
thermalIC(thermalModel_tr,Sensor1val,'Face',6)
thermalIC(thermalModel_tr,Sensor1val,'Face',7)
thermalIC(thermalModel_tr,Sensor1val,'Face',8)
thermalIC(thermalModel_tr,Sensor2val,'Face',9)
thermalIC(thermalModel_tr,Sensor2val,'Face',10)
thermalIC(thermalModel_tr,Sensor2val,'Face',11)
thermalIC(thermalModel_tr,Sensor2val,'Face',12)
thermalIC(thermalModel_tr,Sensor2val,'Face',13)
thermalIC(thermalModel_tr,Sensor3val,'Face',14)
thermalIC(thermalModel_tr,Sensor3val,'Face',15)
thermalIC(thermalModel_tr,Sensor3val,'Face',16)
thermalIC(thermalModel_tr,Sensor3val,'Face',17)
thermalIC(thermalModel_tr,Sensor3val,'Face',18)


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

