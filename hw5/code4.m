x=[3,asin(0.8),0];
m=[3,4,5];

    for i=0:m(1)
        for j=0:i
            fprintf("%f\t",RichardsonD(x(1),i,j));
        end
        fprintf("\n");
    end


function phi=phi(x,h)
    phi=(f1(x+h)-f1(x-h))/(2*h);   %改变phi的定义，得到不同的求导公式
    %phi=(f2(x+h)-f2(x-h))/(2*h);
    %phi=(f3(x+h)-f3(x-h))/(2*h);
end

function f1=f1(x)
    f1=log(x);
end

function f3=f3(x)
    f3=sin(x^2+x/3);
end

function f2=f2(x)
    f2=tan(x);
end

function D=RichardsonD(x,n,k)
    if k==0
        D=phi(x,1/2^n);
    else
        D=4^k/(4^k-1)*RichardsonD(x,n,k-1)-RichardsonD(x,n-1,k-1)/(4^k-1);
    end
end