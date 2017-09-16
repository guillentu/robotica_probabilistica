%%%% Punto 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mediciones en metros y grados.
p_gbot=[1,1,90]'; % Robot (x, y, theta) (Coordenadas globales )

p_lobj_bot=[1,0,1]';% Objeto (x, y, uno) (coordenadas locales)

theta=p_gbot(3)*pi/180;
% Transformaci´on homogenea
T = [cos(theta) -sin(theta) p_gbot(1);...
     sin(theta) cos(theta) p_gbot(2) ; ...
        0           0          1     ];

%Posición del objeto respecto de la terna global
p_gobj=T*p_lobj_bot


%%%% Punto 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%p_gbot=[4,4,0]'; % (x, y, theta) (Coordenadas globales ROBOT)
p_gobj2=p_gobj;%[1,0,1]'; % (x, y, uno) (coordenadas globales OBJETO)

p_lobj_bot= inv(T)*p_gobj % Es la Inversa de la transformacion homogenea
% Inversa Equivalente %%%%%%%%%%
theta=p_gbot(3)*pi/180;
R=[cos(theta) -sin(theta);...
   sin(theta) cos(theta)];
t=p_gbot(1:2);
invT = [ R' -R'*t ; 0 0 1];
inv(T)*p_gobj
%%%% Punto 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Transformación T12: es la matriz que permite pasar de T1 a T2. Si T1 es la pose en x1
% la multiplicaci`on  T1*T12 = T2. O sea, si T1*p_lobg1 = p_gobj (posici´on global)(p_lobg1 objeto medido)
% Por lo tanto, invT1*T1*T12 = invT1*T2 (Se multiplica a izquierda por la inversa de T1)
%                        T12 = invT1*T2; 
p_gbot=[1,1,90]';  % Posicion global del robot x1
p_gbot2=[3,3,45]'; % Posicion global del robot x2


%%%%%p_lbot2_1= inv(T)*[p_gbot2(1) p_gbot2(2) 1]' % posicion del robot en x2 respt robot en x1
% Matriz homogenia inversa de T en x1 %%%%%%%%%%
theta=p_gbot(3)*pi/180;
R=[cos(theta) -sin(theta);...
   sin(theta) cos(theta)];
t=p_gbot(1:2);
invT = [ R' -R'*t ; 0 0 1]; % inversa en x1
% Matriz homogenia T en x2 %%%%%%%%%%
theta=p_gbot2(3)*pi/180;
R=[cos(theta) -sin(theta);...
   sin(theta) cos(theta)];
t=p_gbot2(1:2);
T2 = [  R   p_gbot2(1:2);
        0 0       1      ];
        
T_12= invT*T2;
% Comprobaci´on T2 = T*T_12
if T2 == T*T_12
  disp("OK son iguales T2 = T*T_12")
endif
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Punto 4 Nueva terna local en x2
theta=p_gbot2(3)*pi/180
R=[cos(theta) -sin(theta);...
   sin(theta) cos(theta)];
t=[p_gbot2(1:2)]

invT2 = [ R' -R'*t; 0 0 1] % Posición del 
p_lobj_bot2=invT2*p_gobj   % Posicion del robot en la terna local del robot en x2
