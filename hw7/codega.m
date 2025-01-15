xmax=1;
I=integral(@(x) f(x),0,xmax);
%I=atan(4);
%I=(2*atan(tan(xmax/2)/sqrt(3)))/sqrt(3);
error1=zeros(1,7);
error2=zeros(1,7);
for i=1:7
    N=2^i;
    fprintf("N=%d\n",N);
    error1(i)=abs(I-trapezoidintegral(0,xmax,N));
    error2(i)=abs(I-gaussintegral(0,xmax,N));
    if(i>1)
        order1=log(error1(i-1)/error1(i))/log(2);
        order2=log(error2(i-1)/error2(i))/log(2);
        fprintf("error1=%d\t order1=%d\n",error1(i),order1);
        fprintf("error2=%d\t order2=%d\n",error2(i),order2);
    else
        fprintf("error1=%d\n",error1(i));
        fprintf("error2=%d\n",error2(i));
    end
    
end

function p=f(x)
    p=exp(-x.^2);

    %p=(1+x.^2).^(-1);

    %p=(2+cos(x)).^(-1);
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

function p=gaussintegral(xmin,xmax,n)
    p=0;h=(xmax-xmin)/n;
    for i=1:n
        a=xmin+(i-1)*h;
        b=xmin+i*h;
        p=p+normalgaussintegral(a,b);
    end
    
end

function s=normalgaussintegral(a,b)
    s=0;
    A=[5/9,8/9,5/9];
    x=[1-sqrt(3/5),1,1+sqrt(3/5)];
    for i=1:3
        s=s+A(i)*f(x(i)/2*(b-a)+a)*(b-a)/2;
    end
end