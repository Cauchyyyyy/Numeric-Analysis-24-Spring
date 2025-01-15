Nvalues=[5,10,20,40];
t1=zeros(1,4);t2=zeros(1,4);
for i=1:4
    N=Nvalues(i);
    x=zeros(1,N+1);
    for j=0:N 
        x(j+1)=j/N;
    end
    t1(i)=0;t2(i)=0;
    for j=1:N 
        s1=S1((x(j)+x(j+1))/2,x);
        s2=S2((x(j)+x(j+1))/2,x);
        if abs(s1-f((x(j)+x(j+1))/2))>t1(i)
            t1(i)=abs(s1-f((x(j)+x(j+1))/2));
        end
        if abs(s2-f((x(j)+x(j+1))/2))>t2(i)
            t2(i)=abs(s2-f((x(j)+x(j+1))/2));
        end
    end
    fprintf('N=%d\n max error of grid 1= %f\n max error of grid 2= %f\n',N,t1(i),t2(i));
    if i>1
        ord1=log(t1(i-1)/t1(i))/log(Nvalues(i)/Nvalues(i-1));
        ord2=log(t2(i-1)/t2(i))/log(Nvalues(i)/Nvalues(i-1));
        fprintf(' method 1 order =%f\n method 2 order =%f\n',ord1,ord2);
    end
end

function f=f(x)
    f=exp(x);
end

%一次分片线性样条
function s=S1(y,x)
    n=length(x);s=0;
    for i=1:n-1
        if (y>=x(i))&& (y<=x(i+1))
            s=f(x(i))+(f(x(i+1))-f(x(i)))*(y-x(i))/(x(i+1)-x(i));
            break;
        end
    end
end
    
%三次样条插值
function s=S2(y,x)
    y0=f(x);
    cs=spline(x,[1 y0 exp(1)]);
    s=ppval(cs,y);
end