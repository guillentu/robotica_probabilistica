% mediciones en metros y grados.
p_gbot=[1,1,90]'; % (x, y, theta) (Coordenadas globales )

p_lobj_bot=[1,0,1]'; % (x, y, uno) (coordenadas locales)

theta=p_gbot(3)*pi/180;

T = [cos(theta) -sin(theta) p_gbot(1);...
     sin(theta) cos(theta) p_gbot(2) ; ...
        0           0          1     ]

%Posición del objeto respecto de la terna global

p_gobj=T*p_lobj_bot


%%%% Punto 1.2
%p_gbot=[4,4,0]'; % (x, y, theta) (Coordenadas globales ROBOT)
p_gobj2=p_gobj;%[1,0,1]'; % (x, y, uno) (coordenadas globales OBJETO)

p_lobj_bot= inv(T)*p_gobj

%%%% Punto 3
%Transformación con respecto a robot 1
% RTa: Es la inversa de T
p_gbot2=[3,3,45]'; % Posicion global del robot 2

p_lbot2_1= inv(T)*[p_gbot2(1) p_gbot2(2) 1]' % posicion del robot2 respt robot 1
% Equivalente a la matriz T_12 %%%%%%%%%%
theta=p_gbot(3)*pi/180;
R=[cos(theta) -sin(theta);...
   sin(theta) cos(theta)];
t=p_gbot(1:2)
T_12 = [ R' -R'*t ; 0 0 1]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p_lbot2_1=[p_lbot2_1(1:2); (p_gbot2(3)-p_gbot(3))]



%% Punto 4 Nueva terna local en x2
theta=p_gbot2(3)*pi/180
R=[cos(theta) -sin(theta);...
   sin(theta) cos(theta)];
t=[p_gbot2(1:2)]

T_2 = [ R' -R'*t; 0 0 1] % Posición del 
p_lobj_bot2=T_2*p_gobj
