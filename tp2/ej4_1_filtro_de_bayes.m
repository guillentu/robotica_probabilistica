% Filtro discreto de Bayes
clear all;
belif=[zeros(10, 1);1; zeros(9,1)];

aux=0;
x=2;


% Matriz de desplazamiento o Probabilidad de transici´on dada una celda a cualquier otra. 
aux=[.25 .5 .25 zeros(1,length(belif)-3)];
u=[];
for i=1:length(belif)-2
  u=[u;shift(aux,i-1)]; % Simplemente  se desplaza la probabilidad local.
endfor
u=[u;[zeros(1,length(belif)-2) .25 .75]];
u=[u;[zeros(1,length(belif)-1) 1]];

figure;hold on;
plot(belif,'*r');
for i=1:10
  belif=sum(u.*belif,1)'; % Se aplica un comando de accion
  plot(belif);
endfor
figure;hold on;
plot(belif,'*r');
for i=1:3
  belif=sum(flip(flip(u,2),1).*belif,1)'; % Se aplica un comando de accion
  plot(belif);
endfor
