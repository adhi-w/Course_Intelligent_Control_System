% Example 1 in Perceptron
clear all

%Lecture Example 1 data
x=[2 0;2 2;1 3;-1 0;-2 0;-1 2];
t=[-1;-1;-1;1;1;1];
%HW #5 data
%x=[3 0;2 1.5;1 3;-1 0;-2 0;-1 2];
%t=[-1;-1;-1;1;1;1];


linda=0.5;
theta=-1;
w=[-1;1];
theta_initial=theta;
w_initial=w;

n=size(x,1);
Epoch=0;
flag=1;
while ne(flag,0)
    flag=0;
    for i=1:n
%        Step 3: Compute the actual output
        o=hardlims(w'*x(i,:)'-theta);
        if ne(o,t(i))
            flag=flag+1;
            w=w+linda*(t(i)-o)*x(i,:)';
            theta=theta-2*linda*t(i);
        end 
    end
    Epoch=Epoch+1
end

Epoch

plot(x(1:3,1),x(1:3,2),'o','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','w',...
                'MarkerSize',4)
hold on
plot(x(4:6,1),x(4:6,2),'o','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',4)
%grid on
%axis([min(x(:,1)) max(x(:,1)) min(x(:,2)) max(x(:,2))])
ylabel('x2')
xlabel('x1')
S=strcat('New: (', num2str(w(1)),')*x1+(',num2str(w(2)),')x2=',num2str(theta));
S_initial=strcat('Initial: (',num2str(w_initial(1)),')*x1+(',num2str(w_initial(2)),')*x2=',num2str(theta_initial));

refline(-w_initial(1)/w_initial(2),theta_initial/w_initial(2));
V=axis;
if eq(w(2),0)
    y=V(3):V(4);
    plot(theta/w(1)*ones(size(y)),y)
else
    refline(-w(1)/w(2),theta/w(2))
end

V=axis;
x1=V(1)+(V(2)-V(1))/5;
x2=V(3)+(V(4)-V(3))/5;
x3=V(1)+(V(2)-V(1))/5;
x4=V(3)+(V(4)-V(3))/7;
text(x1,x2,S)
text(x3,x4,S_initial)

title('Example illustrating the change of the boundary separating classes A and B')
legend('Target -1','Target +1')
title('Example illustrating the change of the boundary separating classes A and B')
refresh
hold off

%Answer
S=strcat('w1=', num2str(w(1)),', w2=',num2str(w(2)),', theta=',num2str(theta))
