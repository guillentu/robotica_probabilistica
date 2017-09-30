function ej1_3_box_Muller(mu,sigma2)
% Metodo de Box-Muller
sigma=sqrt(sigma2);
u1=rand(1,100000);
u2=rand(1,100000);

muestras=cos(2*pi*u1).*sqrt(-2*log(u2));
muestras=sigma*(muestras)+mu;
hist(muestras,[(mu-4*sigma):0.1:(mu+4*sigma)])

endfunction