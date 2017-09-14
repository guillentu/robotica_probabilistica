%%%% punto 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scan = load('-ascii', 'laserscan.dat');
plot(scan);

%% Transformación de las medidas de intensidad en posiciones en el espacio %
theta=-pi/2:pi/360:pi/2;
med=ones(length(theta),2);
for i=1:length(theta)
  med(i,:)=scan(i)*[sin(theta(i)) cos(theta(i))];
endfor
plot(med(:,1),med(:,2));

%%%% Punto 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% EXPLICACION: los datos del LIDAR son mediciones tomadas en un pasillo,
%              a la derecha del robot pararentemente hay algo semiTransparente
%              como unas cortinas o algo por el estilo, que permite que algunos
%              haces pasen y otros nos. También pueden ser unas rejas.
%             El LIDAR apunta hacia ATRÁS

%%%% Punto 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% a)  posición del robot en la terna global
p_gbot=[1 0.5 pi/4]'; % NO hacen falta transformación

figure;hold on;
scatter(p_gbot(1),p_gbot(2),200,'r');

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
scatter(p_gLidar(1),p_gLidar(2),150,'b');
%%%% c) Mediciones en la terna global

% pose del Lidar respecto del robot 
theta=p_lLidar(3)-pi/2;
R_bot=[cos(theta) -sin(theta);
       sin(theta) cos(theta)];
T_bot = [  R_bot   p_lLidar(1:2);
      0 0       1      ]
% Transformación de las mediciones respecto de las coordenadas globales
med_g = T*T_bot*[med ones(length(scan),1)]';
plot(med_g(1,:),med_g(2,:));
axis('equal')



