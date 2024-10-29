clc
clear all
close all
% Create and Plot Raw Data
x = 1:100;

% y = rand(1,length(x))./10;
% y = 0.25*x + randn(1,length(x));
% y = 1./(1+ exp(-0.5*x + randn(1,length(x))));
y = 0.5 + 0.25*sin(2*pi*x/100);
% y = 0.5 + 0.25*sin(2*pi*x/100)+ 0.05*randn(1,length(x));
% y = rand(1,length(x)).*x + 10;
% y = 0.25.*x.^2 + 10.*x + randn(1,length(x));
y_hat(1) = 0;
e(1) = 0;
b(1) = 0;
w(1,1) = 0;
w(2,1) = 0;
w(3,1) = 0;
w(4,1) = 0;

alpha_w = 0.0105;%0.0105;% 0.002;
alpha_b = 0.1;%0.1;% 0.002;

z(1,1) = x(1);
z(2,1) = 0;
z(3,1) = 0;
z(4,1) = 0;

plot(x,y,'-*','LineWidth',2)


for i = 1:length(x)-1
    % do sth
    % for j = 1:10000
    y_hat(i) = 1/(1+exp(-(w(:,i)'*z(:,i)+b(i))));

    e(i) = y(i)-y_hat(i);

    J(i) = 0.5*(e(i))^2;
    w(:,i+1) = w(:,i) + alpha_w*e(i)*y_hat(i)*(1-y_hat(i))*z(:,i);
    b(i+1) = b(i) + alpha_b*e(i)*y_hat(i)*(1-y_hat(i));

    z(1,i+1) = x(i+1);
z(2,i+1) = y(i);
z(3,i+1) = z(2,i);
z(4,i+1) = z(3,i);
    % end


    

end


hold on
plot(x(1:end-1),y_hat,'r--','LineWidth',2)
hold off
legend('y_{plot}','y-hat_{plot}')

figure
plot(e)
hold on
plot(J)
hold off
legend('e_{plot}','J_{plot}')

disp(mean(J))