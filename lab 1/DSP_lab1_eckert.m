%Digital Signal Processing Lab 1
%Lauren Eckert

%Problem 1:Aliasing
%%
% Define the sampling frequency
fs = 100; % in Hz

% Define the frequencies
f1 = 20; % in Hz
f2 = 80; % in Hz

% Calculate the sampling period
Ts = 1 / fs;

% Generate the time vector for the first 10 samples
n = 0:9; % sample indices

% Compute the discrete signals
x1 = cos(2 * pi * f1 * n * Ts);
x2 = cos(2 * pi * f2 * n * Ts);

% Plotting
figure;
subplot(2,1,1); % create a subplot for the first signal
stem(n, x1); % plot the first signal
title('Discrete Signal for f = 20 Hz');
xlabel('Sample Number n');
ylabel('Amplitude');

subplot(2,1,2); % create a subplot for the second signal
stem(n, x2); % plot the second signal
title('Discrete Signal for f = 80 Hz');
xlabel('Sample Number n');
ylabel('Amplitude');

%Problem 2:Determining the sampling frequency

syms t
a = simplify(fourier((heaviside(t + 1/2) - heaviside(t - 1/2))));
disp('A');
disp(a);
%%
%Problem 3:Fourier Transform
syms t f
x_t = sinc(0.5*t);  % Define the signal x(t)
X_f = fourier(x_t, f);  % Compute the Fourier Transform of x(t)

% Display the result
disp('The Fourier Transform of x(t) is: ');
disp(X_f);

%Problem 4:Sampling Theorem

%Problem 5:More Fourier Transforms

%Problem 6:Even More Fourier Transforms