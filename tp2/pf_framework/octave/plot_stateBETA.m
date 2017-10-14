function plot_state(h,particles, weights, landmarks, timestep)
    % Plots the state of the particle filter.
    %
    % Displays the particle cloud, mean position and landmarks.
    %
    % particles: current set of particles
    % weights: current set of particle weights
    % timestep: current step in the filtering process
    
    %figure;hold on
    plot(h,particles(:, 1), particles(:, 2), '.');
    
    drawrobot(mean_position(particles, weights), 'r', 4, 0.3, 0.3);
    xlim([-1, 11])
    ylim([-1, 11])
    %filename = sprintf('../plots/pf_%03d.png', timestep);
    %print(filename, '-dpng');
end
