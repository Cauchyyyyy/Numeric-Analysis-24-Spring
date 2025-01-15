lambda=-5;
x=0:0.01:5;
y=Runge_Kutta_4(@(x,y) f(lambda,x,y),0,0,5,0.01);
error=abs(y-sin(x));



function p=f(lambda,x,y)
    p=lambda*y+cos(x)-lambda*sin(x);
end