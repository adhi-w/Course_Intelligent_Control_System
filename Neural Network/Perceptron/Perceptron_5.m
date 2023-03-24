% Example 1 in Perceptron
clear all

%Lecture Example summary
x=[2.0 3.0;2.5 2.0;8.0 7.0;6.0 4.0;];
t=[1;1;0;0];


linda=1;
theta=0.5242;
w=[-0.028;0.7826];

n=size(x,1);
Epoch=0;
flag=1;
while ne(flag,0)
    flag=0;
    for i=1:n
%        Step 3: Compute the actual output
        o=hardlim(w'*x(i,:)'-theta);
        if ne(o,t(i))
            flag=flag+1;
            w=w+linda*(t(i)-o)*x(i,:)';
            theta=theta+-2*linda*t(i);
        end 
    end
    Epoch=Epoch+1
end
Epoch

