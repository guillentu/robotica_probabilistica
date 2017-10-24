% Modelos inverso de lsensor
resolucion=10; % resolucion 10cm
m=0.5*ones(1,21);
c=0:10:200; % coordenada de la celda
mediciones = [101, 82, 91, 112, 99, 151, 96, 85, 99, 105];
chance=log(m./(1-m));
figure;hold on;
plot(c,m,'r');
%for x=c([1 2 3 4 5 6 7 8])
x=c(1);
    for z=mediciones
        chance= occupancy_grid_mapping(chance,c(1),z,resolucion);
        %plot(c,chance);
        m=1-1./(1+exp(chance));
        %plot(c,m);
    end
    plot(c,chance,'b');
    plot(c,m,'r');
%end
