% Filtro discreto de Bayes
clear all;
belief=[zeros(10, 1);1; zeros(9,1)];

aux=0;
x=2;


% Matriz de desplazamiento o Probabilidad de transici´on dada una celda a cualquier otra. 
aux=[.25 .5 .25 zeros(1,length(belief)-3)];
u=[];
for i=1:length(belief)-2
  u=[u;shift(aux,i-1)]; % Simplemente  se desplaza la probabilidad local.
endfor
u=[u;[zeros(1,length(belief)-2) .25 .75]];
u=[u;[zeros(1,length(belief)-1) 1]];

figure;hold on;
plot(belief,'*r');
for i=1:10
  belief=sum(u.*belief,1)'; % Se aplica un comando de accion
  plot(belief);
endfor
figure;hold on;
plot(belief,'*r');
for i=1:3
  belief=sum(flip(flip(u,2),1).*belief,1)'; % Se aplica un comando de accion
  plot(belief);
endfor
