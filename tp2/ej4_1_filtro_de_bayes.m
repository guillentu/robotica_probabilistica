% Filtro discreto de Bayes
belif=[zeros(10, 1);1; zeros(9,1)];

aux=0;
x=2;


aux=[.25 .5 .25 zeros(1,length(belif)-3)];
u=[];
for i=1:length(belif)-2
  u=[u;shift(aux,i-1)];
endfor
u=[u;[zeros(1,length(belif)-2) .25 .75]];
u=[u;[zeros(1,length(belif)-1) 1]];

figure;hold on;
plot(belif,'*r');
for i=1:15
  belif=sum(u.*belif,1)'; % Se aplica un comando de accion
  plot(belif);
endfor

%%% FALTA COMANDO HACIA ATRAS %%%%%%%%%%%%%%%%%%%%%%%

%for posAntes=1:length(belif)
%
%  if posAntes==length(belif)-1
%    aux=[zeros(1,length(belif-2)) .25 .75] % Comando de accion
%  elseif posAntes==length(belif)
%    aux=[zeros(1,length(belif-1)) 1] % Comando de accion
%  else
%    aux=shift(u,posAntes-1) % Comando de accion
%  endif
%  
%  for j=1:length(belif)
%    auxBelif+=u(x)*belif(posAntes)  % prob(x|posAntes)*bel(posAntes)
%  endfor
%
%%belif(i)=
%endfor