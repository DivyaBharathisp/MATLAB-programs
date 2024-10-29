clc; % Clear the command window
clear all; % Clear all variables from the workspace
close all; % Close all figure windows

% Define the range of x values from -5 to 5 with a step of 0.1
x = -5:0.1:5;

% Uncomment the next two lines to plot the hyperbolic tangent function
% y_tanh = tanh(x); % Compute the hyperbolic tangent of each x value
% plot(x, y_tanh); % Plot y_tanh against x

% Uncomment the next two lines to plot the sigmoid function
% y_sigmoid = 1 ./ (1 + exp(-x)); % Compute the sigmoid function
% plot(x, y_sigmoid); % Plot y_sigmoid against x

% Compute the ReLU (Rectified Linear Unit) activation function
y_relu = max(0, x); % ReLU function outputs the maximum of 0 and x

% Plot the ReLU function
plot(x, y_relu); % Plot y_relu against x
title('ReLU Activation Function'); % Add a title to the plot
xlabel('x'); % Label the x-axis
ylabel('ReLU(x)'); % Label the y-axis
grid on; % Enable the grid for better readability
