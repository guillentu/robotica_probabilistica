% Ej 1_1: Probabilidad de estar en m0 o en m1 dado ciertas mediciones;
% nu=prob(d1|T1)*prob(d0|T1)+prob(d1|T0)*prob(d0|T0)
% P(z|Tx^mx)=[prob(d0|mx^T0)*prob(d1|mx^T1)]/nu;
% Normalizado al conjunto T0 T1 como posibles posiciones
%prob_x =
%T0       0.944 => prob(T0) es mayor!!
%T1       0.054 => prob(T1)

%  T0 T1 posiciones de las antenas
T=[12 5;...
    4 7];
% sedes 1=PC , 2=H
sedes=[10 6;
        8 3];
% Mediciones
d=[3.9;... % d0
   4.5];   % d1
sigma_z=[1; 1.5]
% Distancias de las antenas a cada sede (Heras; P. Colon)
d_pos=[sqrt((T(1,1)-sedes(1,1))**2+(T(2,1)-sedes(2,1))**2)  ... % distancia T0-PC
       sqrt((T(1,1)-sedes(1,2))**2+(T(2,1)-sedes(2,2))**2) ;... % distancia T0-H
       sqrt((T(1,2)-sedes(1,1))**2+(T(2,2)-sedes(2,1))**2) ... % distancia T1-PC
       sqrt((T(1,2)-sedes(1,2))**2+(T(2,2)-sedes(2,2))**2)];... % distancia T1-H
delta_d=[abs(d_pos(1,:)-d(1)); abs(d_pos(2,:)-d(2))];
% delta_d = 
%          T0x0 T0x1
%          T1x0 T1x1
% Probabilidad  P(d0^d1|sedePC)=P(d0|PC)*P(d1|PC)
%                                | => 1-P(X<delta_d)+P(X< -delta_d)
likelihood=[(1-normcdf(delta_d(1,1),0,sigma_z(1))+normcdf(-delta_d(1,1),0,sigma_z(1)))* ...
        (1-normcdf(delta_d(2,1),0,sigma_z(2))+normcdf(-delta_d(2,1),0,sigma_z(2)));
        (1-normcdf(delta_d(1,2),0,sigma_z(1))+normcdf(-delta_d(1,2),0,sigma_z(1)))*...
        (1-normcdf(delta_d(2,2),0,sigma_z(2))+normcdf(-delta_d(2,2),0,sigma_z(2)))
        ];
prior=[0.5;0.5];

nu= sum(likelihood.*prior);
prob_x=(likelihood.*prior)./nu
%prob_x =
%T0       0.944 = T0
%T1       0.054 = T1

%figure;hold on;
%plot(sedes(1,:),sedes(2,:),'ob')
%plot(T(1,:),T(2,:),'or')