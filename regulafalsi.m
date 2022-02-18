clc
clear all;
%close all;
a=input('value of left point=');
b=input('value of right point=');
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
c=(a*fb-b*fa)/(fb-fa);
fc=bisf(c);
i=0;
error=zeros(1,50);
while (abs(fc)>tol)
    i=i+1;
    fa=bisf(a);
    fb=bisf(b);
    c=(a*fb-b*fa)/(fb-fa);
    fc=bisf(c);
    if (fc<0)
        if (fa<0)
            a=c;
            fa=fc;
        else
            b=c;
            fb=fc;
        end
    else
        if (fa>0)
            a=c;
            fa=fc;
        else
            b=c;
            fb=fc;
        end
    end
    error(i)=abs(fc);
    c=(a*fb-b*fa)/(fb-fa);
    fc=bisf(c);
end
fprintf('root is %f\n',c);
fprintf('number of iterations is %d\n',i);
plot(error,"b:*");
%legend("error")
         
        