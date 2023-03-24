%Hopfield
clear all
x=[1 -1;-1 1;1 -1];

q=size(x,2); %number of presented pattern
n=size(x,1); %number of neuron units

%Storage
W=(x(:,1)*x(:,1)'+x(:,2)*x(:,2)')/n-eye(n)*q/n;
Theta=[sum(W(:,1));sum(W(:,2));sum(W(:,3))];

x1=[1;1;-1];
%Retrieval (Asycronous mode)
for k=1:2 
    for j=1:n %number of nueron
    x1(j)=hardlims(W(j,:)*x1-Theta(j));
    end
end

x2=[1;1;-1];
%Retrieval (Sycronous mode)
for j=1:30
    x2=sgn(W*x2,Theta)
end