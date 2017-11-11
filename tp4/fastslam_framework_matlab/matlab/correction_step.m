function particles = correction_step(particles, z)

% Weight the particles according to the current map of the particle
% and the landmark observations z.
% z: struct array containing the landmark observations.
% Each observation z(j) has an id z(j).id, a range z(j).range, and a bearing z(j).bearing
% The vector observedLandmarks indicates which landmarks have been observed
% at some point by the robot.

% Number of particles
numParticles = length(particles);

% Number of measurements in this time step
m = size(z, 2);

% TODO: Construct the sensor noise matrix Q_t (2 x 2)
Q_t = [0.1 0;0 0.1];


% process each particle
for i = 1:numParticles
  robot = particles(i).pose;
  % process each measurement
  for j = 1:m
    % Get the id of the landmark corresponding to the j-th observation
    % particles(i).landmarks(l) is the EKF for this landmark
    l = z(j).id;

    % The (2x2) EKF of the landmark is given by
    % its mean particles(i).landmarks(l).mu
    % and by its covariance particles(i).landmarks(l).sigma

    % If the landmark is observed for the first time:
    if (particles(i).landmarks(l).observed == false)

      % TODO: Initialize its position based on the measurement and the current robot pose:
      % TRANSFORMACION AFIN para pasar de terna locales en el robot (Z mediciones) a la terna global.
      pose = particles(i).pose;
      T = [cos(pose(3)) -sin(pose(3)) pose(1);...% TRANSFORMACIO Afin
           sin(pose(3)) cos(pose(3))  pose(2); ...
                0            0           1    ];
      particles(i).landmarks(l).mu = T*[z(j).range*cos(z(j).bearing); % Se proyecta la medicion Z sobre la terna local del robot
                                        z(j).range*sin(z(j).bearing); % es equivalente a la transformacion afin para la rotaci´on del sensor respecto del robot.
                                                     1              ];

      % get the Jacobian with respect to the landmark position
      [h, H] = measurement_model(particles(i), z(j));

      % TODO: initialize the covariance for this landmark
      particles(i).landmarks(l).sigma = inv(H)*Q_t*inv(H)';

      % Indicate that this landmark has been observed
      particles(i).landmarks(l).observed = true;

    else

      % get the expected measurement
      [expectedZ, H] = measurement_model(particles(i), z(j));

      % TODO: compute the measurement covariance
      Q = H*particles(i).landmarks(l).sigma*H' +  Q_t;

      % TODO: calculate the Kalman gain
      K = particles(i).landmarks(l).sigma * H' * inv(Q);

      % TODO: compute the error between the z and expectedZ (remember to normalize the angle using the function normalize_angle())
      diffZ = [z(j).range - expectedZ(1)  ;
               normalize_angle(z(j).bearing - expectedZ(2))];  
      % TODO: update the mean and covariance of the EKF for this landmark
      particles(i).landmarks(l).mu =[particles(i).landmarks(l).mu(1:2) + K * diffZ ; particles(i).landmarks(l).mu(3)];
      particles(i).landmarks(l).sigma = (eye(size(K))- K*H)*particles(i).landmarks(l).sigma;

      % TODO: compute the likelihood of this observation, multiply with the former weight
      %       to account for observing several features in one time step
      particles(i).weight = particles(i).weight * (det(2*pi*Q))^(-0.5)*exp(-.5*diffZ'*inv(Q)*diffZ);

    end

  end % measurement loop
end % particle loop

end
