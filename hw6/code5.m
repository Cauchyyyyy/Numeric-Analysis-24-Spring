
xmax=4;
%Itrue=integral(@sin,0,xmax);
Itrue=1-cos(xmax);
errors1=zeros(1,12);
errors2=zeros(1,12);
for k=1:12
    N=2^k;
    errors1(k)=abs(Itrue-trapezoidintegral(0,xmax,N));
    errors2(k)=abs(Itrue-simpsonintegral(0,xmax,N));
    fprintf("N=%d \n",N);
    fprintf("error1 %f \t error2 %f \n",errors1(k),errors2(k));
    if(k>1)
        fprintf("order1 %f \t order2 %f \n", ...
            log(errors1(k-1)/errors1(k))/log(2), ...
            log(errors2(k-1)/errors2(k))/log(2));
    end
end

function p=f(x)
    p=sin(x);
end

function I=simpsonintegral(xmin,xmax,n)
    h=(xmax-xmin)/n;
    x=zeros(1,n+1);
    for i=0:n
        x(i+1)=xmin+h*i;
    end
    I=0;
    for i=2:2:n+1
        I=I+(f(x(i-1))+4*f(x(i))+f(x(i+1)))*(x(i+1)-x(i-1))/6;
    end
end

function I=trapezoidintegral(xmin,xmax,n)
    h=(xmax-xmin)/n;
    x=zeros(1,n+1);
    for i=0:n
        x(i+1)=xmin+h*i;
    end
    I=0;
    for i=2:n+1
        I=I+(f(x(i-1))+f(x(i)))*(x(i)-x(i-1))/2;
    end
end