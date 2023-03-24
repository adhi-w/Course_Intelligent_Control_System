function PI=GA_f21(chro)
% Fitness function evaluation of Example 2.1-1.
% chro is the array transfered from GA for optimization.

% PenChen Chou, 8-10-2001
%    Revised,   6-25-2002

global MIN_offset MUL_factor

% Set MIN_offset=25 for this problem if not defined.
if exist('MIN_offset','var'), 
    if isempty(MIN_offset), MIN_offset=25; end
end
% Always to set MAX_factor=1, if you have no idea about
% the meaning of MAX_factor at the first time.
if exist('MUL_factor','var'), 
    if isempty(MUL_factor), MUL_factor=1; end
end

% Fitness function evaluation
x=chro(1); y=chro(2);
PI=x*sin(4*x)+1.1*y*sin(2*y);

% attached_part is used to transfer a minimization problem
% into a maximization problem. Input is PI, Output is PI.
attached_part;
