Nvalues=[5,10,20,40];
for i = 1:length(Nvalues)
    N = Nvalues(i);
    x1=zeros(N+1);
    x2=zeros(N+1);
    y=zeros(101);
    for j=0:N       %初始化插值点
        x1(j+1)= 1 - j * 2/ N;
        x2(j+1)=-cos(pi*(2*j+1)/(2*N+2));
    end
    for j=0:100     %设置检测误差点
        y(j+1)=j/50-1;
    end
    t1=0;
    t2=0;
    for j=1:101
        if t1<abs(p(y(j),x1)-f(y(j)))
            t1=abs(p(y(j),x1)-f(y(j)));
        end
        if t2<abs(p(y(j),x2)-f(y(j)))
            t2=abs(p(y(j),x2)-f(y(j)));
        end
    end
    fprintf('N=%d\n max error of grid 1= %f\n max error of grid 2= %f\n',N,t1,t2);
    if N==20
        p1=zeros(1,101);p2=zeros(1,101);
        for j=1:101
            p1(j)=p(y(j),x1);
            p2(j)=p(y(j),x2);
        end
        
        plot(y,p1,'b');
        hold on;
        plot(y,p2,'r');
        legend('grid1','grid2', 'Location', 'northeast', 'FontSize', 12);
    end
end

function p=f(x)
    p=1/(1+25*x^2);
end

function c=f0(x,y)  %计算Newton多项式各项系数
    n=length(x);
    c=zeros(n);
    c(1)=y(1);
    for k=2:n
        d=x(k)-x(k-1);
        u=c(k-1);
        if k>2
            for i=k-2:-1:1
                u=u*(x(k)-x(i))+c(i);
                d=d*(x(k)-x(i));
            end
        end
        c(k)=(y(k)-u)/d;
    end
end

function u=p(y,x)   %计算Newton插值函数
    n=length(x);
    fx=zeros(n);
    for i=1:n
        fx(i)=f(x(i));
    end
    c=f0(x,fx);
    u=c(n);
    for i=n-1:-1:1
        u=(y-x(i))*u+c(i);
    end
end