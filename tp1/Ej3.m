%%%%%% punto 2
p_gbot=[]
p_gbot(1,:)=[1.5 2.0 pi/2] % Pose inicial del robot
l=0.5; % distancia entre ruedas
% Acciones de control
acciones=[0.3  0.3 3.0;...
          0.1 -0.1 1.0;...
          0.2  0.0 2.0;
          ]
% secuencia de movimientos
for i=[1:size(acciones,1)]
  p_gbot(i+1,:)=diffdriver(p_gbot(i,1),...
                           p_gbot(i,2),...
                           p_gbot(i,3),...
                           acciones(i,1),...
                           acciones(i,2),...
                           acciones(i,3),...
                           l)
endfor

figure;
hold on;
scatter(p_gbot(1,1), p_gbot(1,2),250,'r')
scatter(p_gbot(:,1), p_gbot(:,2),200,'b')
hold off;

%%%%%%%%%%

