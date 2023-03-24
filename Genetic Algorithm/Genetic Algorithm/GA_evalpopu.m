function [fitness, popu_real, popu] = GA_evalpopu(popu...
                        , bit_n, range, fcn)
%function [fitness, popu_real, popu] = GA_evalpopu(popu...
%                        , bit_n, range, fcn)
% GA_EVALPOPU Evaluation of the population's fitness values.
%	popu: 0-1 matrix of popu_n by string_leng
%	bit_n: number of bits used to represent an input variable 
%	range: range of input variables, a var_n by 2 matrix
%	fcn: objective function (a MATLAB string)
%   For example: 
%      GA_evalpopu([1 1 0 1;0 1 1 0],4,[-3 2], 'xfun1')
% Returned varaibles:
%   fitness is the column vector which contains the fitness 
%   function values popu is the matrix in binary string
%   popu_real is the equivalent dicimal values of binary popu
% FOR EXAMPLE:
% [fit, p_real, popu]=GA_evalpopu(...
%    [1 1 0 1 0 1 1 0; 1 0 0 1 1 1 0 0], 4,[0 -3;2 4],@ga_fun)
% we get fit=[100.1948; 102.0919], 
%        p_real=[1.7333 -0.2000; 1.2000 2.6000],
% popu=[1 1 0 1 0 1 1 0; 1 0 0 1 1 1 0 0];

% Original writer: Roger Jang
% PenChen Chou, 6-30-2001

pop_n = size(popu, 1);     % return row size only
var_n = size(range,2);
fitness = zeros(pop_n, 1); % save fitness fuction value 
                           % for ecah chromosome
popu_real=zeros(pop_n,var_n);
for count = 1:pop_n,
   [fitness(count), popu_real(count,:)]=...
       GA_evaleach(popu(count,:), bit_n, range, fcn);
end
% Sort it
[fitness, YY]=GA_sort(fitness);
popu_real=popu_real(YY,:);
popu=popu(YY,:);