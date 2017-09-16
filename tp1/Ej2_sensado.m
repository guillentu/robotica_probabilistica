%%%% punto 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scan = load('-ascii', 'laserscan.dat');
plot(scan);

%% Transformación de las medidas de intensidad en posiciones en el espacio %
theta=-pi/2:pi/360:pi/2;
med=ones(length(theta),2);
for i=1:length(theta)
  med(i,:)=scan(i)*[sin(theta(i)) cos(theta(i))];
endfor
scatter(med(:,1),med(:,2),'*');
axis('equal');

%%%% Punto 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% EXPLICACION: los datos del LIDAR son mediciones tomadas en un pasillo,
%              donde el lidar esta en el 0,0. A la derechaa del robot aparentemente 
%              hay algo semiTransparente como una puerta con cortinas o algo por el estilo, que
%              permite que algunos haces pasen y otros nos. También puede ser una reja.
%              El LIDAR apunta hacia ATRÁS, por lo tanto la zona quie deja pasar algunos 
%              haces estas a la decrecha.

%%%% Punto 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% a)  posición del robot en la terna global
p_gbot=[1 0.5 pi/4]'; % NO hacen falta transformación

figure;hold on;
scatter(p_gbot(1),p_gbot(2),200,'ok','linewidth',2);

%% b) Posición del LIDAR
p_lLidar=[0.2 0.0 pi]';

% transformacion homogenea
theta=p_gbot(3);

R=[cos(theta) -sin(theta);
   sin(theta) cos(theta)];
T = [  R   p_gbot(1:2);
      0 0       1      ]
p_gLidar=T*[ p_lLidar(1:2); 1 ] % posición global del lidar
p_gLidar(3)= p_lLidar(3)+p_gbot(3)  % rotación global del lidar
scatter(p_gLidar(1),p_gLidar(2),50,'r','linewidth',2);

%%%% c) Mediciones en la terna global
% pose del Lidar respecto del robot 
theta=p_lLidar(3)-pi/2;
R_bot=[cos(theta) -sin(theta);
       sin(theta) cos(theta)];
T_bot = [  R_bot   p_lLidar(1:2); % transforma las mediciones a la terna del robot
      0 0       1      ]
% Transformación de las mediciones respecto de las coordenadas globales
med_g = T*T_bot*[med ones(length(scan),1)]'; % Transforma las mediciones a la terna del robot y luego a las globales
plot(med_g(1,:),med_g(2,:),'*b');            % Por lo tanto, se transforman las mediciones en la terna del lidar a las globales.
axis('equal')



