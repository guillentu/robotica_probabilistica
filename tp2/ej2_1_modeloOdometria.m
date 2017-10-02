function [err x_pos]=ej2_1_modeloOdometria(x,u,alpha)
  % Ej 2 Modelo de movimiento
  % entrada X(pose) u(datos de odometria) alpha(error de medicion)
  
  u_pos=[];
  u_pos(1)=u(1) + boxMuller(0,alpha(1)*abs(u(1))+alpha(2)*abs(u(3)));
  u_pos(2)=u(2) + boxMuller(0,alpha(1)*abs(u(2))+alpha(2)*abs(u(3)));
  u_pos(3)=u(3) + boxMuller(alpha(3)*abs(u(3))+alpha(4)*(abs(u(1))+abs(u(2))),.01);
  
  x_pos=[];
  x_pos(1)=x(1)+u_pos(3)*cos(x(3)+u_pos(1));
  x_pos(2)=x(2)+u_pos(3)*sin(x(3)+u_pos(1));
  x_pos(3)=x(3)+ u_pos(1)+ u_pos(2);  
  x_pos=x_pos';
  err=[];
  err=abs(x'-x_pos);
endfunction

function z=boxMuller(mu,sigma2)
% Metodo de Box-Muller
sigma=sqrt(sigma2);
u1=rand(1);u2=rand(1);
z=cos(2*pi*u1).*sqrt(-2*log(u2));
z=sigma*(z)+mu;
endfunction