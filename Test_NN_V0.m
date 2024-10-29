clc
clear all
close all
% Create and Plot Raw Data
x = 1:100;

% y = rand(1,length(x))./10;
% y = 0.25*x + randn(1,length(x));
% y = 1./(1+ exp(-0.5*x + randn(1,length(x))));
y = 0.5 + 0.25*sin(2*pi*x/100)+ 0.05*randn(1,length(x)); %actual output
% y = rand(1,length(x)).*x + 10;
% y = 0.25.*x.^2 + 10.*x + randn(1,length(x));
y_hat(1) = 0; %predicted output
e(1) = 0; %error after intialization is 0
b = 0; % bias is zero
w(1) = 0; % weights are zero
alpha = 0.002;% 0.002; learning rate

plot(x,y,'-*','LineWidth',2)


for i = 1:length(x)
    % do sth
    % for j = 1:10000
    y_hat(i) = 1/(1+exp(-(w(i)'*x(i)+b))); %predicted output

    e(i) = y(i)-y_hat(i); %actaul and predicted output

    J(i) = 0.5*(e(i))^2; %cost function
    w(i+1) = w(i) + alpha*e(i)*y_hat(i)*(1-y_hat(i))*x(i); %weight updation step
    % end

    

end


hold on
plot(x,y_hat,'r--','LineWidth',2)
hold off

figure
plot(e)
hold on
plot(J)
hold off
legend('e_plot','J_plot')