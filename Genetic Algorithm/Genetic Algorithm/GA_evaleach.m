function [PI, chromosome_real] = GA_evaleach(chromosome,...
                                   bit_n, range, fcn)
% function [PI, chromosome_real] = GA_evaleach(chromosome,...
%                                    bit_n, range, fcn)
% GA_EVALEACH Evaluation of each individual's fitness value.
%	bit_n: number of bits for each input variable
%	chromosome: bit string representation of an individual
%	range: range of input variables, a ver_n by 2 matrix
%     i.e. range=[0 0
%                 3 4.5];
%     the  first row is the LOWER bounds
%     the second row is the UPPER bounds
%	fcn: objective function (a MATLAB string)
% Bianry GA mode   
% Returned varaibles:
%   PI: Performance Index, or fitness function value
%   chromosome_real: chromosome in real number
% FOR EXAMPLE:
%   [PI, c_real]=GA_evaleach([1 1 0 1 0 1 1 0],4,...
%                      [0 -3;2 4],'ga_fun')
% or[PI, c_real]=GA_evaleach([1 1 0 1 0 1 1 0],4,...
%                      [0 -3;2 4],@ga_fun)
%   we get PI=100.1948, c_real=[1.7333 -0.2000]
%
%% The following is the listing of ga_fun.m
% function PI=ga_fun(chro)
%% An example to write a fitness function with 2 
%% independent varaibles
% x=chro(1); y=chro(2);
% PI=100-(x*cos(x)+1.1*y*sin(2*y));

% Original writer: Roger Jang
% PenChen Chou, 6-30-2001

   var_n  = length(chromosome)/bit_n;
   input  = zeros(1, var_n);  
   for i = 1:var_n,
	 chromosome_real(i) = GA_round4dp(GA_bit2num...
         (chromosome((i-1)*bit_n+1:i*bit_n), ...
         range(:,i))); % Convert binary to decimal
   end;
   %chromosome_real,keyboard,pause
   PI = feval(fcn, chromosome_real);   % Call function   
