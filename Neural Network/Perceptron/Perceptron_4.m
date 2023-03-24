% Example 4
clear all

x=[1 -1 -1;1 1 -1];
t=[-1;1];
w=[0;0;0];
linda=0.4;

n=size(x,1);
Epoch=0;
flag=1;
e=[1000 1000];
E=[1 1];
 %while or(E(1),E(1))
 while ne(sum(E),0)
    for i=1:n
%        Step 3: Compute the r, output before activation
        r=w'*x(i,:)';
        e(i)=t(i)-r
            dw=linda*(e(i))*x(i,:)';
            w=w+dw
    %    end 
    end
    E=ge(abs(e),[0.0001,0.0001]);
    Epoch=Epoch+1;
end

Epoch

