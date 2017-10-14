function new_particles = resample(particles, weights)
    % Returns a new set of particles obtained by performing
    % stochastic universal sampling.
    %
    % particles (M x D): set of M particles to sample from. Each row contains a state hypothesis of dimension D.
    % weights (M x 1): weights of the particles. Each row contains a weight.
    new_particles = [];

    M = size(particles, 1);
    
    %% TODO: complete this stub
    c=[];
    c(1)=weights(1);
    for i=2:M
      c(i)=c(i-1)+weights(i);
    endfor
    u=rand/M;
    i=1;
    for j=1:M
      while u>c(i)
        ++i;
      endwhile
      new_particles=[new_particles;particles(i,:)];
      u=u+1/M;
    endfor
end
