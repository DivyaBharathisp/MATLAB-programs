%linear regression
%generate the synthetic data
%find best fitting line using linear regression
%evaluate the model using some metrics(neural networks)

clc
clear all
close all

%generate the synthetic data
%define x values
x = 1:100;

true_slope=3;%m
true_intercept=5; %c
noise=randn(1,length(x))*10;
y=true_slope*x+true_intercept+noise;

%plot x and y
plot(x,y)

%i want to find out the best fit line that is passing through the data
%use polyfit
coefficients=polyfit(x,y,1);
fitted_slope=coefficients(1);
fitted_intercept=coefficients(2);

disp(['fitted line equation: y = ' num2str(fitted_slope) '*x + ' num2str(fitted_intercept)]);

%evaluation
%polyval get the y values for the fitted line
y_fit = polyval(coefficients, x);



