function [mu, sigma] = correction_step(mu, sigma, z, l)
    % Updates the belief, i. e., mu and sigma, according to the sensor model
    %
    % The employed sensor model is range-only.
    %
    % mu: 3 x 1 vector representing the mean (x, y, theta) of the normal distribution
    % sigma: 3 x 3 covariance matrix of the normal distribution
    % z: structure containing the landmark observations, see
    %    read_data for the format
    % l: structure containing the landmark position and ids, see
    %    read_world for the format


    % Compute the expected range measurements.
    % This corresponds to the function h.
    expected_ranges = zeros(size(z, 2), 1);
    for i = 1:size(z, 2)
        % Todo: Implement
<<<<<<< HEAD
        expected_ranges=[sqrt((l(i).x-mu(1))^2+(l(i).y-mu(2))^2)];
=======
        expected_ranges(i)=[sqrt((l(z(i).id).x-mu(1))^2+(l(z(i).id).y-mu(2))^2)]
>>>>>>> affe96ee465fd681e71c73522b77fc1f75b4c320
                         %atan2(l(i).y-mu(2),l(i).x-mu(1))-mu(3)];
    end

    % Jacobian of h
    H = zeros(size(z, 2), 3);

    % Measurements in vectorized form
    Z = zeros(size(z, 2), 1);
    for i = 1:size(z, 2)
        H(i, :) = [ -.5*(sqrt((l(z(i).id).x-mu(1))^2+(l(z(i).id).y-mu(2))^2))^(-1)*2*(l(z(i).id).x-mu(1))                     -.5*(sqrt((l(z(i).id).x-mu(1))^2+(l(z(i).id).y-mu(2))^2))^(-1)*2*(l(z(i).id).y-mu(2))    0 ];   
                   % -(1+((l(i).y-mu(2))/(l(i).x-mu(1)))^2)^(-1) * ((l(i).y-mu(2))/(l(i).x-mu(1))^2)   -(1+((l(i).y-mu(2))/(l(i).x-mu(1)))^2)^(-1) * 1/(l(i).x-mu(1))  -1];
        Z(i) = z(i).range;
    end
<<<<<<< HEAD
    
=======
    %size(H)
    %size(Z)
>>>>>>> affe96ee465fd681e71c73522b77fc1f75b4c320
    R = diag(repmat([0.5], size(z, 2), 1));
    %dbstop('line')
    sigma
    S=H*sigma*H'+R;
    K =  sigma*H'*inv(S); % Todo: Implement
<<<<<<< HEAD
    mu = mu+K*(Z-expected_ranges);% Todo: Implement
    sigma = (eye(3)-K*H)*sigma; % Todo: Implement
=======
    %size(K)
    mu = mu+K*(Z-expected_ranges);% Todo: Implement
    sigma = (eye(3)-K*H)*sigma % Todo: Implement
>>>>>>> affe96ee465fd681e71c73522b77fc1f75b4c320
end
