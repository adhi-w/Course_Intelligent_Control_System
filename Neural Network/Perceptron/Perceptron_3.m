% Example 3 in Perceptron
clear all

%Lecture Example 3 data

x=[1 -2 0 -1;0 1.5 -0.5 -1;-1 1 0.5 -1];
t=[-1;-1;1];
w=[1;-1;0;0.5];
linda=0.1;

n=size(x,1);
Epoch=0;
flag=1;
while ne(flag,0)
    flag=0;
    for i=1:n
%        Step 3: Compute the actual output
        o=hardlims(w'*x(i,:)');
        if ne(o,t(i))
            flag=flag+1;
            w=w+linda*(t(i)-o)*x(i,:)'
        end 
    end
    Epoch=Epoch+1
end
Epoch

