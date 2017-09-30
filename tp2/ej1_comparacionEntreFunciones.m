% comparaci´on de loas tres funciones respecto de normrnd
disp("Tiempo Funcion normrnd");
tic
for i=1:100000
  a=normrnd(10,3);
endfor
toc
disp("Tiempo Funcion ej1_1_distNormal");
tic
ej1_1_distNormal(0,1)
toc
disp("Tiempo Funcion ej1_2_muestreoRechazo");
tic
ej1_2_muestreo
toc
disp("Tiempo Funcion ej1_3_box_Muller");
tic
ej1_3_box_Muller(0,1);
toc

%RESUMTADOS de la COMPARACION
%Tiempo Funcion normrnd
%Elapsed time is 12.2289 seconds.
%Tiempo Funcion ej1_1_distNormal
%Elapsed time is 0.0617208 seconds.
%Tiempo Funcion ej1_2_muestreoRechazo
%Elapsed time is 51.8671 seconds.
%Tiempo Funcion ej1_3_box_Muller
%Elapsed time is 0.0466142 seconds.
