%{
Original code:
syms W
for k=1:24;
E(k)=single(int((sin(0.5*W)/(0.5*W))^2 ,W,0,k*pi)/pi);
end
stem(E,'linewidth',2); 
hold on
EE=0.9900*ones(1,24); 
plot(EE,'r','linewidth',2)
set(gca,'XTick',0:5:25)
set(gca,'XTickLabel',{'0','5\pi','10\pi','15\pi','20\pi','25\pi'})
xlabel('Angular frequency')
ylabel('Signal Energy')
axis([0 25 0 1.1])
%}

% Define a symbolic variable W for angular frequency
syms W

% Initialize a loop to calculate energy in the frequency domain
for k=1:24;
    % Calculate the energy E(k) in the frequency band [0, k*pi]
    % The integral computes the energy of a sinc function squared (power spectrum)
    % over the range from 0 to k*pi, normalized by pi
    E(k) = single(int((sin(0.5*W)/(0.5*W))^2 ,W,0,k*pi)/pi);
end

% Plot the energy distribution using a stem plot
stem(E,'linewidth',2); 
hold on  % Hold the current plot to overlay additional plots

% Define a constant array EE to represent the 99% energy threshold
EE = 0.9900*ones(1,24); 

% Plot the 99% energy threshold line in red
plot(EE,'r','linewidth',2)

% Customize the x-axis ticks to show angular frequency in multiples of pi
set(gca,'XTick',0:5:25)
set(gca,'XTickLabel',{'0','5\pi','10\pi','15\pi','20\pi','25\pi'})

% Label the x-axis and y-axis
xlabel('Angular frequency')
ylabel('Signal Energy')

% Set the axis limits for clarity
axis([0 25 0 1.1])
