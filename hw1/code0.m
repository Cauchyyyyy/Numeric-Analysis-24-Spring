x_values=[0:0.1:1.0,10:10:300];
fprintf('x\t phi(x)\t k\n');
for i=1:length(x_values)
    x=x_values(i);
    k=0;
    sum=0;
    %syms k0;    %Symbolic Math Toolbox
    %s = symsum(1/(k0*(k0+x)), k0, 1, inf);
    %result=double(s);   %准确解的近似值
    while true
        k=k+1;  
        %if abs(sum-result)>1e-6     
        if 1/(k*(k+x))>1e-12
            sum=sum+ 1/(k*(k+x));
        else
            break
        end
    end
    fprintf('%.1f\t %.6f\t %d\n',x,sum,k);
end
            