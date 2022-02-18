clc;
%close all;
clear all;
x0=input('enter first starting point');
x1=input('enter second starting point');
f0=bisf(x0);
f1=bisf(x1);
x2=(x0*f1-x1*f0)/(f1-f0);
f2=bisf(x2);
i=0;
tol=0.000001;
err=zeros(1,50);
while(abs(f2)>tol)
    i=i+1;
    f0=bisf(x0);
    f1=bisf(x1);
    x2=(x0*f1-x1*f0)/(f1-f0);
    f2=bisf(x2);
    err(i)=abs(f2);
    x0=x1;
    x1=x2;
    f0=bisf(x0);
    f1=bisf(x1);
    x2=(x0*f1-x1*f0)/(f1-f0);
    f2=bisf(x2);
end
fprintf('root is %f\n',x2);
fprintf('number of iterations is %d\n',i);
plot(err,"m-.o");
%legend("err");

    

