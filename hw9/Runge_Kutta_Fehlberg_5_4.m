function [result_x,result_y] = Runge_Kutta_Fehlberg_5_4(func,y0,x0,xmax,h_init,iteration,delta)
result_x = [];result_y=[];
h=h_init;
x=x0;
y=y0;
error=0;
result_x=[result_x x];
result_y=[result_y y];
while x+h<=xmax
    h_temp=h;
    y_temp=y;
    for j=1:iteration        
        if j>1
            h=0.9*h*(delta/abs(error))^(1/5);
        end
        if isnan(h)
            h=h_init;
            break;
        end
        f1=h*func(x,y);
        f2=h*func(x+h/4,y+f1/4);
        f3=h*func(x+3*h/8,y+(3*f1+9*f2)/32);
        f4=h*func(x+12*h/13,y+(1932*f1-7200*f2+7296*f3)/2197);
        f5=h*func(x+h,y+439*f1/216-8*f2+3680*f3/513-845*f4/4104);
        f6=h*func(x+h/2,y-8*f1/27+2*f2-3544/2565*f3+1859*f4/4101-11*f5/40);

        error=f1/360-f3*128/4275-f4*2197/75240+f5/50+f6*2/55;
        
        y_temp=y+16/135*f1+6656/12825*f3+28561/56430*f4-9/50*f5+2/55*f6;
        
        h_temp=h;
    end
    if isnan(y_temp)
        break;
    end
    x=x+h_temp;
    y=y_temp;
    result_x=[result_x x];
    result_y=[result_y y];

end


end