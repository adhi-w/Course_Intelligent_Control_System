% Membership functions of the condition variables
x =0:1:4;
OSC=[tri_mf(x, [0, 0, 5])   %1. NON 
    tri_mf(x, [-4, 1, 6])   %2. LOW 
    tri_mf(x, [-3, 2, 7])   %3. MOD 
    tri_mf(x, [-2, 3, 8])   %4. HIG 
    tri_mf(x, [-1, 4, 9])]; %5. VHI
 
RSP=[tri_mf(x, [0, 0, 5])   %1. NON
     tri_mf(x, [-4, 1, 6])  %2. LOW
     tri_mf(x, [-3, 2, 7])  %3. MOD
     tri_mf(x, [-2, 3, 8])  %4. HIG
     tri_mf(x, [-1, 4, 9])];%5. VHI
 
DIV=[tri_mf(x, [0, 0, 5]);   %1. NON
     tri_mf(x, [-4, 1, 6]);  %2. LOW
     tri_mf(x, [-3, 2, 7]);  %3. MOD
     tri_mf(x, [-2, 3, 8]);  %4. HIG
     tri_mf(x, [-1, 4, 9]);];%5. VHI
 
OFS=[tri_mf(x, [0, 0, 5]);   %1. NON
     tri_mf(x, [-4, 1, 6]);  %2. LOW
     tri_mf(x, [-3, 2, 7]);  %3. MOD
     tri_mf(x, [-2, 3, 8]);  %4. HIG
     tri_mf(x, [-1, 4, 9]);];%5. VHI

% Membership functions of the action variables
x1 =-3:1:3;
DP=[1.0 0.6 0.2 0.0 0.0 0.0 0.0;   %1. NH 
    0.6 1.0 0.6 0.2 0.0 0.0 0.0;   %2. NM 
    0.2 0.6 1.0 0.6 0.2 0.0 0.0;   %3. NL
    0.0 0.2 0.6 1.0 0.6 0.2 0.0;   %4. NC
    0.0 0.0 0.2 0.6 1.0 0.6 0.2;   %5. PL
    0.0 0.0 0.0 0.2 0.6 1.0 0.6;   %6. PM
    0.0 0.0 0.0 0.0 0.2 0.6 1.0;]; %7. PH

DI=DP;
DD=DP;

%OSC_DP Implication - relation table 
%if OSC=LOW then DP=NL
[a1,b1] = meshgrid(DP(3,:),OSC(2,:)); % a = mu(x), b = mu(y);
%if OSC=MOD then DP=NM
[a2,b2] = meshgrid(DP(2,:),OSC(3,:)); % a = mu(x), b = mu(y);
%if OSC=HIG then DP=NH
[a3,b3] = meshgrid(DP(1,:),OSC(4,:)); % a = mu(x), b = mu(y);
%if OSC=VHI then DP=NH
[a4,b4] = meshgrid(DP(1,:),OSC(5,:)); % a = mu(x), b = mu(y);
%Composite fuzzy relation table
OSC_DP=max(max(max(min(a1, b1),min(a2, b2)),min(a3, b3)),min(a4, b4))

%Sup-min rule of inference - apply data OSC_LOW to DP
Decision_OSC_LOW_DP=max_star(OSC(2,:),OSC_DP,'min')

%Defuzzification - Cebtroid method
(x1*Decision_OSC_LOW_DP')/sum(Decision_OSC_LOW_DP)
