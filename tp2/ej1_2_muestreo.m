z=zeros(1,100000);
mu=0;
sigma2=1;
tic
for i=1:length(z)
  z(i)=ej1_2_muestreoRechazo(mu,sigma2);
endfor
toc
hist(z,[(mu-4*sqrt(sigma2)):0.1:(mu+4*sqrt(sigma2))])
