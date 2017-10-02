muestras=[];
err=[];
n=5000;
x=[0 0 0];
u=[pi/4 -pi/4 3]; % rot1 rot2 trans(traslacion en linea recta)
alpha=[.01 .01 .001 .001];
for i=1:n
  [err(:,i) muestras(:,i)]=ej2_1_modeloOdometria(x,u,alpha);
endfor
% Pose Siej2_1_modeloOdometria(x,u,alpha)n ruido
x_pos_teo=[];
x_pos_teo(1)=x(1)+u(3)*cos(x(3)+u(1));
x_pos_teo(2)=x(2)+u(3)*sin(x(3)+u(1));
figure;
hold on;
plot(x(1),x(2),'*r');
plot(muestras(1,:),muestras(2,:),'.k')
plot(x_pos_teo(1),x_pos_teo(2),'og');
mean(err,2)