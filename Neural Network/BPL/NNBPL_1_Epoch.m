clear all
% Step 1 Initialization
% lamda
lamda=1;
% linda
linda=0.2;
% t
t=[0.88,0.82,0.57];
% delta =[delta3, delta4,delta6]
delta=ones(1,3);
% E
E=1;
% Emax
Emax=0.1238;
% weight=[w30,w31,w32,w40,w41,w42,w63,w64,w65]
w=0.2*ones(1,9);
% change of weight=[dw30,dw31,dw32,dw40,dw41,dw42,dw63,dw64,dw65]
dw=zeros(1,9);
% x(1),x(2),x(3)
x=[0.3,0.4;
   0.1,0.6;
   0.9,0.4];
Epoch=0;
while E >= Emax,
E=0;
Epoch=Epoch+1;
    for k=1:3
    % Step 2 Apply the input pattern
    % o=[o0,o1,o2,o3,o4,o5,o6]
        o=[x(k,1),x(k,2),-1,0,0,0,0];
    % Step 3 - Forward propagation
        o(4)=1/(1+exp(-lamda*(w(1)*o(1)+w(2)*o(2)+w(3)*o(3))));
        o(5)=1/(1+exp(-lamda*(w(4)*o(1)+w(5)*o(2)+w(6)*o(3))));
        o(6)=-1;
        o(7)=1/(1+exp(-lamda*(w(7)*o(4)+w(8)*o(5)+w(9)*o(6))));
    % Step 4 - Output error measure
        E=1/2*(t(k)-o(7))^2+E;
        delta(3)=o(7)*(1-o(7))*(t(k)-o(7));
    % Step 5 - Error backpropagation
    % Third layer weight updates:
        for i=1:3
            dw(i+6)=linda*delta(3)*o(i+3);
            w(i+6)=w(i+6)+dw(i+6);
        end
    % Second layer error signals:
        for i=1:2
            delta(i)=o(i+3)*(1-o(i+3))*w(i+6)*delta(3);
        end
    % Second layer weight updates:
        for i=1:3
            dw(i)=linda*delta(1)*o(i);
            w(i)=w(i)+dw(i);
        end
        for i=4:6
            dw(i)=linda*delta(2)*o(i-3);
            w(i)=w(i)+dw(i);
        end
    end
end
delta
w
E
Epoch