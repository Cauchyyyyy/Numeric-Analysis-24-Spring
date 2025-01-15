R=Romberg(10^-7,1,7)

function R=Romberg(a,b,M)
    R=zeros(M+1,M+1);
    h=b-a;
    R(1,1)=(f(b)+f(a))*(b-a)/2;
    for n=1:M
        h=h/2;
        sum=0;
        for i=1:2^(n-1)
            sum=sum+f(a+(2*i-1)*h);
        end
        R(n+1,1)=R(n,1)/2+h*sum;
        for m=1:n
            R(n+1,m+1)=R(n+1,m)+(R(n+1,m)-R(n,m))/(4^m-1);
        end
    end
end

function p=f(x)
    syms y;    
    %p=sin(x)/x;
    %p=(cos(x)-exp(x))/sin(x);
    p=exp(-x.^-1)./x;
    if (isnan(p)||isinf(p))
        %p=limit(sin(y)/y,y,x);
        p=limit((cos(y)-exp(y))/sin(y),y,x);
        %p=limit(exp(-y.^-1)./y,y,x);
    end
end