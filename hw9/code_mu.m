error=zeros(6,1);
for k=3:8
    x=0:2^(-k):1;
    y=zeros(length(x),1);
    y(1:5)=Runge_Kutta_4(@(x,y) f(x,y),0,0,x(5),2^(-k));
    for i=6:length(y)
        y(i)=y(i-1)+(2^(-k)/720)*(1901*f(x(i-1),y(i-1))-2774*f(x(i-2),y(i-2))+2616*f(x(i-3),y(i-3))-1274*f(x(i-4),y(i-4))+251*f(x(i-5),y(i-5)));
    end
    error(k-2)=abs(y(length(y))+1);
    fprintf('%d\t %d\n',y(length(y)),error(k-2));
    if k>3
        order=log(error(k-2)/error(k-3))/log(2);
        fprintf('%d\n',order);
    end
end

function p=f(x,y)
    p=(x-exp(-x))/(y+exp(y));
end