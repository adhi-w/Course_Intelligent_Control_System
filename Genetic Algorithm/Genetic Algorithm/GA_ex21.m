% GA_ex21.m file
% Fin min of a function of 2 varaibles
% Minimize f(x,y)=xsin(4x)+1.1ysin(2y), with
%          0<=x<=10, 0<=y<=10.

% PenChen Chou, 7-1-2001
% Revised,      7-1-2002

clear all
ans=1;
who
fprintf('>>>Start this program [GA_ex21.m] now. Please wait!\n');
pause(1)

global MIN_offset MUL_factor LOCUS x_data y_data

MUL_factor=1;   % Set it to 1 for the time being.
                % MUL_factor must be a positive real number.
LOCUS=1;        % Set LOCUS to 1 if the independent variables
                % of the problem is 2 and you want to plot 
                % the 3-dim diagram, otherwise, set LOCUS=0;.
x_data=[]; y_data=[];

%===================================================
%  OPTION.  
%  **>You can omit this part if no 3-dim plot necessary.
% Plot 3-dim diagram for this problem
x=0:0.1:10; y=x; [X,Y]=meshgrid(x,y);
Z=X.*sin(4*X)+1.1*Y.*sin(2*Y);
figure(2);contour(X,Y,Z)
%===================================================

%*********************************************************/
%       User can modify the following block
%*********************************************************/
MIN_offset=25;  % From the problem description above, max f(x,y)
                % is 22, so we set a rather large number such
                % as 25 to MIN_offset in this case.
                % We will use PI=MIN_offset-PI; statement later
                % to convert a MINIMIZATION problem to fit the
                % property of GA to a MAXIMIZATION one.
%------------------------------------------------------------------------------------
%   IMPORTANT: If you handle a MAXIMIZATION problem, set
%              MIN_offset=0;
%------------------------------------------------------------------------------------
obj_fcn = 'GA_f21';	% Objective function
% Range of the input variables x and y
range = [0 0       % LOWER BOUNDS
      10 10]; 	% UPPER BOUNDS
IC=[]; elite=1; 
gen_no=800;
popuSize=50; bit_n=60;
% If you want more information from GA result, use the following:
%popuSize=8;bit_n=12;
xover_rate=0.8; mutate_rate=0.05;
%**********************************************************
% call GA_genetic
tic
[popu, popu_real, fcn_value, upper, average,...
     lower, BEST_popu, popuSize, gen_no, para, best_pi,...
     bit_n, xover_rate, mutate_rate]=...
GA_genetic(obj_fcn, range, IC, elite, gen_no, popuSize,...
     bit_n, xover_rate, mutate_rate);
et=toc/60;
fprintf('==>  Computation time is (%.2f) minutes.\n\n',et);            

%===================================================
%   OPTION:   If no 3-dim plot necessary, omit this part.
% Plot locus of optimization process
LAST=length(x_data);
figure(2); hold on
plot(x_data(1),y_data(1),'x');
plot(x_data,y_data);
plot(x_data(LAST),y_data(LAST),'o');
%plot(0,0,'*');   % The best position
hold off
title('*=BEST, x=Starting point, o=Ending point')
%===================================================

% END OF THIS MAIN PROGRAM.
