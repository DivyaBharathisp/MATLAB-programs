clc; % Clear the command window
clear all; % Clear all variables from the workspace
close all; % Close all figure windows

% Define training data and their corresponding labels
trainingdata = [1 2; 2 3; 3 1; 5 4]; % Each row represents a data point
labels = [1; 1; 2; 2]; % Corresponding labels for the data points

% Define a test point for which we want to predict the label
testpoint = [2.5, 2.0]; % Test point coordinates

% Create a k-NN model with k=1 (1 nearest neighbor)
mdl = fitcknn(trainingdata, labels, 'NumNeighbors', 1);

% Use the model to predict the label for the test point
predictedlabel = predict(mdl, testpoint);

% Display the predicted label for the test point
fprintf('Test point (%.2f, %.2f) -> Predicted label: %d\n', testpoint(1), testpoint(2), predictedlabel);
