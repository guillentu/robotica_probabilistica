function [mu, sigma] = prediction_step(mu, sigma, u)
    % Updates the belief, i. e., mu and sigma, according to the motion model
    %
    % u: odometry reading (r1, r2, t)
    % mu: 3 x 1 vector representing the mean (x, y, theta) of the normal distribution
    % sigma: 3 x 3 covariance matrix of the normal distribution

    % Compute the noise-free motion. This corresponds to the function g, evaluated
    % at the state mu.
    u.r1
    %mu = % Todo: Implement
    x_pos=[];
    x_pos(1)=mu(1)+u.t*cos(mu(3)+u.r1);
    x_pos(2)=mu(2)+u.t*sin(mu(3)+u.r1);
    x_pos(3)=mu(3)+u.r1+u.r2;  
%     x_pos(1)=mu(1)+u(3)*cos(mu(3)+u(1));
%     x_pos(2)=mu(2)+u(3)*sin(mu(3)+u(1));
%     x_pos(3)=mu(3)+u(1)+u(2);  
    mu=x_pos';
    % Compute the Jacobian of g with respect to the state
    G = [ 1 0 -u.t*sin(mu(3)+u.r1);
          0 1  u.t*cos(mu(3)+u.r1);
          0 0         1            ];
    Vt = [ cos(mu(3)+u.r1) -u.t*sin(mu(3)+u.r1) 0;
           sin(mu(3)+u.r1)  u.t*sin(mu(3)+u.r1) 0;
                 0                  0            1];
        
    % Motion noise
    Q = [0.2, 0, 0; 
        0, 0.2, 0; 
        0, 0, 0.02];

    sigma = G*sigma*G' + Vt*Q*Vt';
end
