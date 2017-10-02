% Ej 3_2: Probabilidad de estar en distintos puntos dado dos mediciones de 
% intensidad de antenas;
% nu=prob(d1|T1)*prob(d0|T1)+prob(d1|T0)*prob(d0|T0)
% P(z|m)=[prob(d1|mx)*prob(d0|mx)]/nu;
%  T0 T1 posiciones LandMark
T=[12 5;...
    4 7];
% sedes 1=PC , 2=H
% Son los m
sedes=[3:.1:12; % x
       3:.1:12];% y
mapa=meshgrid(sedes(1,:),sedes(2,:));
% Mediciones
d=[3.9;... % d0
   4.5];   % d1
prob_mapa=zeros(size(mapa));
for i=1:length(sedes(1,:))
  for j=1:length(sedes(2,:))
    prob_mapa(i,j)=ej3_2_likelihood(d,T,[sedes(1,i);sedes(2,j)]);
  endfor
endfor

%nu= sum(sum(prob_x,1))
%prob_x=prob_x./nu
figure;hold on;
mesh(sedes(1,[end:-1:1]),sedes(2,end:-1:1),prob_mapa)
  plot3([10 6],[8 3],[.5 .5],'ob','Markersize',10,'linewidth',3);
plot3(T(1,:),T(2,:),[.5 .5],'or','Markersize',10,'linewidth',3)
