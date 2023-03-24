%Kohonen

x=[0 1 0 0;0 0 0 1;1 0 0 0;0 0 1 0]; %Cluster four data
m=3; %Maximum numbers of clusters to be formed


%Step 0 
%The initial weight matrix
w=[0.2 0.7 0.2;0.3 0.2 0.6;0.2 0.2 0.7;0.8 0.1 0.1];
%Initial radius
Nc=0;
%Initial learning rate
Alpha=0.8;
error=[1 1 1];


%Step 3 Begining learning
for p=1:50
for k=1:4
l=zeros(1,3);
for i=1:m % m cluster
    for j=1:4  
        l(i)=(x(k,j)-w(j,i))^2+l(i);
    end
end
%Step 4 winning node
[Y,I] = min(l)
%Step 5 Update winning weight
w(:,I)=w(:,I)+Alpha*(x(k,:)'-w(:,I));
end
%Step 6 Reduce learning rate
Alpha=0.7*Alpha;
end