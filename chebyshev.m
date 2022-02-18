clc;
%close all;
clear all;
x0=input('starting point');
f0=bisf(x0);
f1=df(x0);
f2=d2f(x0);
tol=0.000001;
i=0;
errc=zeros(1,50);
while(abs(f0)>tol)
    i=i+1;
    f0=bisf(x0);
    f1=df(x0);
    f2=d2f(x0);
    x1=x0-(f0/f1)-(((f0^2)*f2)/(2*(f1^3)));
    errc(i)=abs(x1-x0);
    x0=x1;
    f0=bisf(x0);
end
fprintf('root is %f\n',x0);
fprintf('number of iterations is %d\n',i);
plot(errc,"k--*");
%legend("errc");

    