function weight = measurement_model(z, x, l)
    % Computes the observation likelihood of all particles.
    %
    % The employed sensor model is range only.
    %
    % z: set of landmark observations. Each observation contains the id of the landmark observed in z(i).id and the measured range in z(i).range.
    % x: set of current particles
    % l: map of the environment composed of all landmarks
    sigma = [0.2];
    weight = ones(size(x, 1), 1);

    if size(z, 2) == 0
        return
    endif
    
    for i = 1:size(z, 2)
        landmark_position = [l(z(i).id).x, l(z(i).id).y];
        measurement_range = [z(i).range];

        %% TODO: compute weight
        %%%% Esto es proporsional a P(Zt | Xt_i
        sigma_z=[0.2];
        % Distancias de las antenas a cada sede (Heras; P. Colon)
        d_pos=[];
        d_pos=[sqrt((x(1,1)-m(1))**2+(x(2,1)-m(2))**2);  ... % distancia T0-PC
         sqrt((x(1,2)-m(1))**2+(x(2,2)-m(2))**2) ... % distancia T1-PC
         ];
        delta_d=[abs(d_pos(1)-z(1)); abs(d_pos(2)-z(2))];% delta_d = T0x0 T0x1 ...
  %                                                                       T1x0 T1x1 ...
  % Probabilidad  P(d0^d1|sedePC)=P(d0|PC)*P(d1|PC)
  %                                | => 1-P(X<delta_d)+P(X< -delta_d)
  prob_x=[(1-normcdf(delta_d(1),0,sigma_z(1))+normcdf(-delta_d(1),0,sigma_z(1)))* ...
          (1-normcdf(delta_d(2),0,sigma_z(1))+normcdf(-delta_d(2),0,sigma_z(1)))];
        
    endfor

    weight = weight ./ size(z, 2);
end
