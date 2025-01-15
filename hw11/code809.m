n=[10,20,40,80,160];
error1=zeros(length(n),1);
error2=zeros(length(n),1);
order1=zeros(length(n),1);
order2=zeros(length(n),1);
for i=1:length(n)

[t1,y1]=finite_difference_method(@(x) 0,@(x) -1,@(x) 0,0,pi/2,3,7,n(i));
error1(i)=max(y1-(7*sin(t1)+3*cos(t1)));

[t2,y2]=finite_difference_method(@(x) 2*exp(x),@(x) -1,@(x) 0,0,1,2,exp(1)+cos(1),n(i));
error2(i)=max(y2-(exp(t2)+cos(t2)));

fprintf("%d\t %d\t %d\t",n(i),error1(i),error2(i));
if i>1
    order1(i)=log(error1(i-1)/error1(i))/log(2);
    order2(i)=log(error2(i-1)/error2(i))/log(2);
    fprintf("%d\t %d\n",order1(i),order2(i));
else
    fprintf("\n");
end

end