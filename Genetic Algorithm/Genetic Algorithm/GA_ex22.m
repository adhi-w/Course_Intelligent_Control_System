% GA_ex22.m file
% Fin min of f(x)=sin(2*pi*x), x is from 0 to 1.

% PenChen Chou, 7-2-2001

%**********************************************************/
%       User can modify the following in blocks
%**********************************************************/
clear all
ans=1;
who
fprintf('>>>Start this program [GA_ex22.m] now. Please wait!\n');
pause(1)
global MIN_offset MUL_factor LOCUS x_data y_data
MIN_offset=0.1; MUL_factor=1; LOCUS=0; x_data=[]; y_data=[];
obj_fcn = 'GA_f22m';	% Objective function
range = [0
         1];	% Range of the input variables
IC=[];elite=1;
%************************************************************
% calling GA 
tic
%function [popu, popu_real, fcn_value, upper, average,...
% lower, popuSize, gen_no]=GA_genetic(obj_fcn, range, IC, elite,...
% gen_no, popuSize, bit_n, xover_rate, mutate_rate);
[popu, popu_real, fcn_value, upper, average, lower, ...
        popuSize, gen_no] = GA_genetic(obj_fcn, range,...
        IC, elite);
t=toc/60;
fprintf('==>  Computation time is (%.2f) minutes.\n',t);            
            
