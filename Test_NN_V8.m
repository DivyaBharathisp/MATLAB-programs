clc
clear all
close all
% Create and Plot Raw Data
x = 1:100;


y = 0.5 + 0.25*sin(2*pi*x/100);

y_hat(1) = 0;
e(1) = 0;
b(1) = 0;
w(1) = 0;
alpha_w_L = 0.01;% 0.002;
alpha_w_H = 0.2;% 0.002;
alpha_b_L = 0.6;% 0.002;
alpha_b_H = 0.6;% 0.002;

plot(x,y,'-*','LineWidth',2)


for i = 1:length(x)
    % do sth
    % for j = 1:10000
    y_hat(i) = 1/(1+exp(-(w(i)'*x(i)+b(i)))); %sigmoid

    e(i) = y(i)-y_hat(i);

    J(i) = 0.5*(e(i))^2;
    if i<25

        w(i+1) = w(i) + alpha_w_H*e(i)*y_hat(i)*(1-y_hat(i))*x(i);
        b(i+1) = b(i) + alpha_b_H*e(i)*y_hat(i)*(1-y_hat(i));
    else
        w(i+1) = w(i) + alpha_w_L*e(i)*y_hat(i)*(1-y_hat(i))*x(i);
        b(i+1) = b(i) + alpha_b_L*e(i)*y_hat(i)*(1-y_hat(i));

    end
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