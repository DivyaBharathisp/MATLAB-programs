clc
clear all
close all
% Create and Plot Raw Data
x = 1:100;

% y = rand(1,length(x))./10;
% y = 0.25*x + randn(1,length(x));
% y = 1./(1+ exp(-0.5*x + randn(1,length(x))));
y = 0.5 + 0.25*sin(2*pi*x/100); %actual op
% y = 0.5 + 0.25*sin(2*pi*x/100)+ 0.05*randn(1,length(x));
% y = rand(1,length(x)).*x + 10;
% y = 0.25.*x.^2 + 10.*x + randn(1,length(x));
y_hat(1) = 0;
e(1) = 0;
b(1) = 0;
w(1) = 0;
alpha_w = 0.002;% 0.002;
alpha_b = 0.6;% 0.002;

plot(x,y,'-*','LineWidth',2)


for i = 1:length(x)
    % do sth
    % for j = 1:10000
    y_hat(i) = 1/(1+exp(-(w(i)'*x(i)+b(i))));

    e(i) = y(i)-y_hat(i);

    J(i) = 0.5*(e(i))^2;
    w(i+1) = w(i) + alpha_w*e(i)*y_hat(i)*(1-y_hat(i))*x(i);
    b(i+1) = b(i) + alpha_b*e(i)*y_hat(i)*(1-y_hat(i));
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

disp(mean(J))