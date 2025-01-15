Nvalues=[5,10,20,40];
for i = 1:length(Nvalues)
    N = Nvalues(i);
    x1=zeros(1,N+1);
    x2=zeros(1,N+1);
    y=zeros(1,101);
    for j=0:N       %初始化插值点
        x1(j+1)= 5 - j * 10 / N;
        x2(j+1)=-5*cos(pi*(2*j+1)/(2*N+2));
    end
    for j=0:100     %设置检测误差点
        y(j+1)=j/10-5;
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
    if N==10
        p1=zeros(1,101);p2=zeros(1,101);
        for j=1:101
            p1(j)=p(y(j),x1);
            p2(j)=p(y(j),x2);
        end
        
        plot(y,p1,'b');
        hold on;
        plot(y,p2,'g');
        legend('grid1','grid2', 'Location', 'northeast', 'FontSize', 12);
    end
end

function p=f(x)
    p=1/(1+x^2);
end

function p=p(y,x)   %计算lagrange插值函数
    n=length(x);p=0;
    for i=1:n
        basis=1;    %计算lagrange基函数
        for j=1:n
            if i~=j
                basis=basis*(y-x(j))/(x(i)-x(j));
            end
        end
        p=p+basis*f(x(i));
    end
end