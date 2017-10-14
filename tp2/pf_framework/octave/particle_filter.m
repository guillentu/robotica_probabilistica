% Make librobotics available
addpath('librobotics');
addpath('../../');

% Read world data, i.e. landmarks
printf("Reading world data ...");fflush(stdout);
landmarks = read_world('../data/world.dat');
printf(" done\n");fflush(stdout);
% Read sensor readings, i.e. odometry and range-bearing sensor
printf("Reading sensor data ...");fflush(stdout);
data = read_data('../data/sensor_data.dat');
printf(" done\n");fflush(stdout);

% Initialize particles
particles = initialize_particles(500);
a=0;

for t = 1:size(data.timestep, 2)
    printf(".");fflush(stdout);

    new_particles = sample_motion_model(data.timestep(t).odometry, particles);

    weights = measurement_model(data.timestep(t).sensor, new_particles, landmarks);
    normalizer = sum(weights);
    weights = weights ./ normalizer;
    a++;
    if (a==40)||(t<15)||(t==330)
      plot_state(new_particles, weights, landmarks, t);
      a=0;
    endif
    particles = resample(new_particles, weights);
endfor

printf("Final pose: ")
disp(mean_position(particles, weights))
