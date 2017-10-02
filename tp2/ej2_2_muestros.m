% Evalucion del modelo de moviemiento en ej2_1_modeloOdometria con 5000 muestras
muestras=[];
err=[];
n=5000;
x=[2 4 0];
u=[pi/4 0 1]; % rot1 rot2 trans(traslacion en linea recta)
alpha=[.1 .1 .001 .001];
% llamado a funci´on
for i=1:n
  [err(:,i) muestras(:,i)]=ej2_1_modeloOdometria(x,u,alpha);
endfor
% Pose sin ruido
x_pos_teo=[];
x_pos_teo(1)=x(1)+u(3)*cos(x(3)+u(1));
x_pos_teo(2)=x(2)+u(3)*sin(x(3)+u(1));
figure;
hold on;
plot(x(1),x(2),'*r','MarkerSize',10,'linewidth',3);
plot(muestras(1,:),muestras(2,:),'.k')
plot(x_pos_teo(1),x_pos_teo(2),'og','MarkerSize',10,'linewidth',3);
%error
mean(err,2)