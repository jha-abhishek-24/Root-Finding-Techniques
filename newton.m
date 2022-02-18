clc
clear all;
%close all;
x0=input('enter the value of starting point=');
f0=bisf(x0);
tol=0.000001;
i=0;
err=zeros(1,50);
while(abs(f0)>tol)
    i=i+1;
    f0=bisf(x0);
    fd=df(x0);
    xi=x0-(f0/fd);
    err(i)=abs(xi-x0);
    x0=xi;
    f0=bisf(x0);
end
fprintf('root is %f\n',x0);
fprintf('number of iterations is %d\n',i);
plot(err,"k--o");
%legend("err");



