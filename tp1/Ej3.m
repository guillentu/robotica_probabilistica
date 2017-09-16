%%%%%% punto 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
p_gbot=[]
p_gbot(1,:)=[1.5 2.0 pi/2] % Pose inicial del robot
l=0.5; % distancia entre ruedas
p_lfrente=[0.02 0.0 0.0]; % Posicion del frente del robot
p_lruedas=[0.0 l/2 0.0;0.0 -l/2 0.0];
p_gfrente=[];
p_gruedasl=[];
p_gruedasr=[];
theta=p_gbot(1,3);
R=[cos(theta) -sin(theta);
   sin(theta)  cos(theta)];
T = [  R   p_gbot(1,1:2)';
      0 0       1      ];
p_gfrente(:,1)=T*[ p_lfrente(1:2)'; 1 ]; % posición global del lidar
p_gruedasl(:,1)=T*[ p_lruedas(1,1:2)'; 1 ];
p_gruedasr(:,1)=T*[ p_lruedas(2,1:2)'; 1 ];
% Acciones de control
%acciones=[0.3  0.3 3.0;...
%          0.1 -0.1 1.0;...
%          0.2  0.0 2.0;
%          ]
acciones=[0.3  0.3 .3;...
          0.3  0.3 .3;...
          0.3  0.3 .3;...
          0.3  0.3 .3;...
          0.1 -0.1 .1;...
          0.1 -0.1 .1;...
          0.1 -0.1 .1;...
          0.1 -0.1 .1;...
          0.2  0.0 .2;...
          0.2  0.0 .2;...
          0.2  0.0 .2;...
          0.2  0.0 .2];

% secuencia de movimientos
for i=[1:size(acciones,1)]
  p_gbot(i+1,:)=diffdriver(p_gbot(i,1),...
                           p_gbot(i,2),...
                           p_gbot(i,3),...
                           acciones(i,1),...
                           acciones(i,2),...
                           acciones(i,3),...
                           l);
  % Pose de las ruedas y el frente
  phi=p_gbot(i+1,3);
  R=[cos(phi) -sin(phi);
   sin(phi) cos(phi)];
  T = [  R   p_gbot(i+1,1:2)';
        0 0       1      ];
  p_gfrente(:,i+1)=T*[ p_lfrente(1:2)'; 1 ]; % posición global del frente
  p_gruedasl(:,i+1)=T*[ p_lruedas(1,1:2)'; 1 ];
  p_gruedasr(:,i+1)=T*[ p_lruedas(2,1:2)'; 1 ];

endfor

figure;
hold on;
scatter(p_gbot(1,1), p_gbot(1,2),700,'r','linewidth',2);
scatter(p_gbot(:,1), p_gbot(:,2),500,'b','linewidth',2);
scatter(p_gfrente(1,:), p_gfrente(2,:),150,'k','linewidth',2);
scatter(p_gruedasl(1,:), p_gruedasl(2,:),250,'g','linewidth',2);
scatter(p_gruedasr(1,:), p_gruedasr(2,:),250,'g','linewidth',2);
axis('equal')

%%%%%%%%%%

