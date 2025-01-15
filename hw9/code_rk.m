xmax=1.05;
h=0.01;
iteration=5;
delta=1e-6;
[x,y]=Runge_Kutta_Fehlberg_5_4(@(x,y) f(x,y),3,1,xmax,h,iteration,delta);


fprintf('range(x) of solution : [1,%d]\n',x(length(x)));

% about [1,1.0456444402797456]

x_ask=input('x for y(x) you want to know\n');

if x_ask<1||x_ask>xmax
    fprintf('x is out of range\n');
else
    for i=2:length(x)
        if x(i-1)<x_ask && x_ask<=x(i)
            y_ans=(y(i-1)-y(i))/(x(i-1)-x(i))*(x_ask-x(i))+y(i);
            fprintf('%d\n',y_ans);
        end
    end
end

function p=f(x,y)
    p=exp(x*y)+cos(y-x);
end