Nvalues=[5,10,15,20,25,30,35,40];

I=integral(@(x) f(x),-1,1);
I1=zeros(1,8);
I2=zeros(1,8);
for i = 1:length(Nvalues)
    N = Nvalues(i);
    x1=zeros(1,N+1);
    x2=zeros(1,N+1);
    
    for j=0:N       %初始化插值点
        x1(j+1)= 1 - j * 2 / N;
        x2(j+1)=-cos(pi*(j+1)/(N+2));
    end
    I1(i)=integral(@(y) p(y,x1),-1,1);
    I2(i)=integral(@(y) p(y,x2),-1,1);
    %fprintf("error1 %d\t error2 %d\n",abs(I1(i)-I),abs(I2(i)-I));
    fprintf("%d\t  %d\n",abs(I1(i)-I),abs(I2(i)-I));
end

function p=f(x)
    p=(1+25*x.^2).^-1;
end

function p=p(y,x)   %计算lagrange插值函数
    n=length(x);p=0;
    for i=1:n
        basis=1;    %计算lagrange基函数
        for j=1:n
            if i~=j
                basis=basis.*(y-x(j)).*(x(i)-x(j))^-1;
            end
        end
        p=p+basis.*f(x(i));
    end
end