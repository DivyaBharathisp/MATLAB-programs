clc;
clear all;
close all;

% Create and Plot Raw Data
x = 20:100; %(if u want to do it for 50 times change x as 1:50)

% Define the target output (e.g., sinusoidal pattern)
y = 0.5 + 0.25 * sin(2 * pi * x / 100);

% Plot the target data
plot(x, y);
hold on;

%neural network
% Initialize variables
y_hat(1) = 0;  % Predicted output
e(1) = 0;      % Error
b(1) = 0;      % Bias
w(1) = 0;      % Weight


% Learning rates for weights and bias (higher for first 25 points, lower afterward)
alpha_w_L = 0.01;
alpha_w_H = 0.02;
alpha_b_L = 0.01;
alpha_b_H = 0.02;



% Training loop
for i = 1:length(x)
    % Forward pass with tanh activation function
    y_hat(i) = tanh(w(i) * x(i) + b(i));  % Tanh activation function predicted outout

    % Calculate error and loss
    e(i) = y(i) - y_hat(i);               % Error actual-predicted
    J(i) = 0.5 * (e(i))^2;                %cost or  Loss function (Mean Squared Error)

    %back propagation starting point
    % Update weights and bias based on learning rate schedule
    if i < 25
        % Use higher learning rate for initial points
        w(i+1) = w(i) + alpha_w_H * e(i) * (1 - y_hat(i)^2) * x(i);
        b(i+1) = b(i) + alpha_b_H * e(i) * (1 - y_hat(i)^2);
    else
        % Switch to lower learning rate for remaining points
        w(i+1) = w(i) + alpha_w_L * e(i) * (1 - y_hat(i)^2) * x(i);
        b(i+1) = b(i) + alpha_b_L * e(i) * (1 - y_hat(i)^2);
    end
end

% Plot the predicted output
plot(x, y_hat);
hold off;
legend('Target Output', 'Predicted Output');
title('Single Neuron with tanh Activation Function');
xlabel('x');
ylabel('Output');
grid on;

% Plot error and loss
figure;
plot(e, 'b', 'LineWidth', 1.5);
hold on;
plot(J, 'r', 'LineWidth', 1.5);
legend('Error (e)', 'Loss (J)');
title('Error and Loss over Time');
xlabel('Iteration');
ylabel('Value');
grid on;

% Display mean loss
disp('Mean Loss:');
disp(mean(J));
