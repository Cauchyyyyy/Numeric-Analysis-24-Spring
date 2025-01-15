function [t,y]=finite_difference_method(funcu,funcv,funcw,a,b,alpha,beta,n)
    y=zeros(n,1);
    t=zeros(n,1);
    h=(b-a)/(n+1);
    for i=1:n
        t(i)=a+i*h;
    end
    A=zeros(n,n);
    A(1,1)=-2-h^2*funcv(t(1));A(1,2)=1-1/2*h*funcw(t(1));
    A(n,n)=-2-h^2*funcv(t(n));A(n,n-1)=1+1/2*h*funcw(t(n));
    b=zeros(n,1);
    b(1)=h^2*funcu(t(1))-(1+1/2*h*funcw(a))*alpha;
    b(n)=h^2*funcu(t(n))-(1-1/2*h*funcw(b))*beta;
    for i=2:n-1
        A(i,i-1)=1+1/2*h*funcw(t(i));
        A(i,i)=-2-h^2*funcv(t(i));
        A(i,i+1)=1-1/2*h*funcw(t(i));
        b(i)=h^2*funcu(t(i));
    end
    y=A\b;
    
end