%Hopfield Example 5.7 in textbook
clear all
x=[1 1 1 1;  %A
   1 1 1 -1; %B
   1 1 -1 -1;%C
   1 1 -1 1; %D
   1 -1 -1 1;  %E
   1 -1 -1 -1; %F
   1 -1 1 -1;%G
   1 -1 1 1; %H
   -1 -1 1 1; %I
   -1 -1 1 -1;%J
   -1 -1 -1 -1;%K
   -1 -1 -1 1; %L
   -1 1 -1 1;  %M
   -1 1 -1 -1; %N
   -1 1 1 -1;%O
   -1 1 1 1]; %P

q=size(x,1); %number of presented pattern
n=size(x,2); %number of neuron units

%Store Pattern B
W=x(2,:)'*x(2,:)-eye([n n]);

for i=1:q
    E(i)=-0.5*x(i,:)*W*x(i,:)';
end

%Retrieval (Asycronous mode)
for k=1:q %number of nueron (transition)
    for j=1:n %number of nueron
        x(k,j)=hardlims(W(j,:)*x(k,:)');
    end
end


