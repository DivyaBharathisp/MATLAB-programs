% Clear workspace and close figures
clc; 
clear all; 
close all; 

% Step 1: Generate Synthetic Linear Data
% Ask the user for the number of data points
num_points = input('Enter the number of data points: '); % User-defined number of points

% Define the range of x values
x = 1:num_points;

% Define the true relationship with some added noise
true_slope = input('Enter the true slope (m): '); % User-defined slope
true_intercept = input('Enter the true intercept (b): '); % User-defined intercept
noise_scale = input('Enter the noise scale (standard deviation): '); % User-defined noise scale
noise = randn(1, length(x)) * noise_scale; % Random noise to simulate real-world data
y = true_slope * x + true_intercept + noise;

% Step 2: Plot the Raw Data
figure;
plot(x, y, 'bo', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
title('Raw Data and Fitted Linear Regression Line');
xlabel('x');
ylabel('y');
hold on;

% Step 3: Perform Linear Regression
% Use polyfit to find the best-fit line y = m*x + b
coefficients = polyfit(x, y, 1); % 1 means first-degree polynomial (linear)
fitted_slope = coefficients(1); % Slope of fitted line
fitted_intercept = coefficients(2); % Intercept of fitted line

% Display the fitted line equation
disp(['Fitted Line Equation: y = ' num2str(fitted_slope) '*x + ' num2str(fitted_intercept)]);

% Step 4: Evaluate the Linear Fit
% Use polyval to get the y-values of the fitted line
y_fit = polyval(coefficients, x);

% Plotting the fitted line
plot(x, y_fit, 'r-', 'LineWidth', 2); % Plot fitted line in red
legend('Data Points', 'Fitted Line');
grid on;

% Step 5: Display Outputs
fprintf('Fitted Slope: %.2f\n', fitted_slope);
fprintf('Fitted Intercept: %.2f\n', fitted_intercept);
hold off;
