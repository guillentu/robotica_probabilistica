%                           (d,antenas,posicionRobot)
function prob_x = ej3_2_likelihood(z,x,m)
  sigma_z=[1; 1.5];
  % Distancias de las antenas a cada sede (Heras; P. Colon)
  d_pos=[];
  d_pos=[sqrt((x(1,1)-m(1))**2+(x(2,1)-m(2))**2);  ... % distancia T0-PC
         sqrt((x(1,2)-m(1))**2+(x(2,2)-m(2))**2) ... % distancia T1-PC
         ];
  delta_d=[abs(d_pos(1)-z(1)); abs(d_pos(2)-z(2))];% delta_d = T0x0 T0x1 ...
  %                                                            T1x0 T1x1 ...
  % Probabilidad  P(d0^d1|sedePC)=P(d0|PC)*P(d1|PC)
  %                                | => 1-P(X<delta_d)+P(X< -delta_d)
  prob_x=[(1-normcdf(delta_d(1),0,sigma_z(1))+normcdf(-delta_d(1),0,sigma_z(1)))* ...
          (1-normcdf(delta_d(2),0,sigma_z(1))+normcdf(-delta_d(2),0,sigma_z(1)))];
endfunction