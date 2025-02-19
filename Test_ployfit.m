clc
clear all
close all
% Create and Plot Raw Data
x = 1:100;

% y = rand(1,length(x))./10;
% y = 0.25*x + randn(1,length(x));
% y = rand(1,length(x)).*x + 10;
y = 0.25.*x.^2 + 10.*x + randn(1,length(x));


plot(x,y,'*','LineWidth',2)

% Fit line to data using polyfit
c = polyfit(x,y,2);

% Display evaluated equation y = m*x + b
disp(['Equation is y = ' num2str(c(1)) '*x + ' num2str(c(2))])

% Evaluate fit equation using polyval
y_est = polyval(c,x);

% Add trend line to plot
hold on
plot(x,y_est,'r--','LineWidth',2)
hold off