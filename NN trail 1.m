clc 
clear all
close all

%define x values
x = 1:100;

%generate the equation for y for all x values
y = 0.25*sin(2*pi*x/100);

plot(x,y);


%neural network
%initialize the parameters
y_hat(1)=0;
e(1)=0;
b=0;
w(1)=0;
alpha=0.002
%iterations
for i=1:length(x) %doing for all the values of x
    for j=1:10000 %do it for 10000 iteratons
        y_hat(i)=1/(1+exp(-(w(i)*x(i))+b));
        e(i)=y(i)-y_hat(i);
        J(i)=0.5*(e(i))^2;
        w(i+1)=w(i)+alpha*e(i)*y_hat(i)*(1-y_hat(i))*x(i);
    end
end


hold on
plot(x,y_hat);
hold off

figure
plot(e)
hold on
plot(J)
hold off
legend('e_plot','J_plot')

w(i+1) = w(i)+ 0.002*e(i)*y_hat(i)*(1-y_hat(i))*x(i);
