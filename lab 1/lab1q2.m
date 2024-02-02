%{
Lab 1 Question 2 - Suggesting a Useful Sampling Frequency
%}

% Define a symbolic variable W for angular frequency
syms W

% Initialize a vector to store energy values
E = zeros(1, 24);

% Initialize a vector to store angular frequencies
Omega = zeros(1, 24);

% Loop to calculate energy in the frequency domain
for k = 1:24
    % Calculate the energy E(k) in the frequency band [0, k*pi]
    Omega(k) = k * pi;
    E(k) = single(int((sin(0.5 * W) / (0.5 * W))^2, W, 0, Omega(k)) / pi);
end

% Find the index where cumulative energy first exceeds 99%
k_max_index = find(E >= 0.99, 1);
Omega_max = Omega(k_max_index);
fs = Omega_max / pi;  % Nyquist rate in radians/time unit

% Convert the Nyquist rate to Hz
fs_hz = fs / (2 * pi);

% Display all variables
disp('Energy values (E):');
disp(E);
disp('Angular frequencies (Omega):');
disp(Omega);
disp(['k at which E(k) first exceeds 99%: ', num2str(k_max_index)]);
disp(['Omega_max corresponding to 99% energy: ', num2str(Omega_max)]);
disp(['Sampling frequency (Nyquist rate) in radians/time unit: ', num2str(fs)]);
disp(['Sampling frequency in Hz: ', num2str(fs_hz)]);

% Plot the energy distribution using a stem plot
figure;
stem(Omega/pi, E, 'linewidth', 2); 
hold on  % Hold the current plot to overlay additional plots

% Define a constant array EE to represent the 99% energy threshold
EE = 0.9900 * ones(1, 24); 

% Plot the 99% energy threshold line in red
plot(Omega/pi, EE, 'r', 'linewidth', 2)

% Customize the x-axis ticks to show angular frequency in multiples of pi
set(gca, 'XTick', 0:5:25)
set(gca, 'XTickLabel', {'0', '5\pi', '10\pi', '15\pi', '20\pi', '25\pi'})

% Label the x-axis and y-axis
xlabel('Angular frequency (\times \pi)')
ylabel('Signal Energy')

% Set the axis limits for clarity
axis([0 25 0 1.1])
title('Signal Energy vs. Angular Frequency')

% Add grid for better readability
grid on

% Add legend to the plot
legend('Signal Energy', '99% Energy Threshold')
