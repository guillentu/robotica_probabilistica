function x=ej1_2_muestreoRechazo(mu,sigma2)
% Muestreo por rechazo ...
sigma=sqrt(sigma2);
do
  x=2*(rand-0.5)*(4*sigma);
  y=rand*normpdf(mu,mu,sigma);
until(y< normpdf(x,mu,sigma))
endfunction

%y=
%f_x=normpdf(x);%1/(tau*sqrt(2*pi))*exp(-(x-mu)/tau)^2;
%plot(f_x)