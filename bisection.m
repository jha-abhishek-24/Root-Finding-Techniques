clc;
%close all;
clear all;
a=input('enter the value of left interval point=');
b=input('enter the value of right interval point=');
fa=bisf(a);
fb=bisf(b);
d=fa*fb;
if (d<0)
    fprintf('there exist atleast a root between %f and %f\n',a,b);
else
    fprintf('there does not exist a root between %f and %f\n',a,b);
    return;
end
tol=0.000001;
c=(a+b)/2;
fc=bisf(c);
i=0;
error=zeros(1,50);
while (abs(fc)>tol)
    i=i+1;
    c=(a+b)/2;
    fa=bisf(a);
    fc=bisf(c);
    if (fc<0)
        if (fa<0)
            a=c;
        else
            b=c;
        end
    else
        if (fa>0)
            a=c;
        else
            b=c;
        end
    end
    error(i)=abs(fc);
    c=(a+b)/2;
    fc=bisf(c);
end
fprintf('root is %f\n',c);
fprintf('number of iterations is %d\n',i);
plot(error,"r-*");
%legend("error")
%hold on