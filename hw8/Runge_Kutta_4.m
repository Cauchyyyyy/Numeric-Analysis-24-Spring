function y=Runge_Kutta_4(func,y0,init_x,final_x,step)
    x=init_x:step:final_x;
    n=length(x);
    y=zeros(1,n);
    y(1)=y0;
    for i=2:n
        f1=step*func(x(i-1),y(i-1));
        f2=step*func(x(i-1)+step/2,y(i-1)+f1/2);
        f3=step*func(x(i-1)+step/2,y(i-1)+f2/2);
        f4=step*func(x(i-1)+step,y(i-1)+f3);
        y(i)=y(i-1)+(f1+2*f2+2*f3+f4)/6;
    end
end