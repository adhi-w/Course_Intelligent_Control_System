function gray=GA_b2g(bin)
%% gray=GA_b2g(bin);
%% Convert a Binary code array to a Gray code array (vector only)
%% See page 88 of David A Coley, An Introduction to Genetic Algorithms 
%%     for Scientists and Engineers, 1999.
%% For example:
%  gray=GA_b2g([1 1 1 1])

% PenChen Chou.  2002-11-5

N=length(bin);
gray=bin;

for i=2:N
    if (gray(i)==bin(i-1))
        gray(i)=0;
    else
        gray(i)=1;
    end
end

