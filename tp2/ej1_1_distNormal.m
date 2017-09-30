function ej1_1_distNormal(u,b)
  % muestas  de una distribucion normal 
  %          desvio|                 Eza de va|   | media
  muestras=(rand(12,100000)-.5);
  muestras=sqrt(b).*sum(muestras,1)+u;
  %plot(mean(muestras,1))
  figure;
  hist(muestras,[(u-4*sqrt(b)):0.1:(u+4*sqrt(b))])
endfunction