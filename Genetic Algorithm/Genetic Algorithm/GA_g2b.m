function bin=GA_g2b(gray)
%% bin=GA_g2b(gray);
%% Convert a Gray code array to a Binary code array (vector only)
%% See page 88 of David A Coley, An Introduction to Genetic Algorithms 
%%     for Scientists and Engineers, 1999.
%% For example:
%  bin=GA_g2b([1 1 1 1])

% PenChen Chou.  2002-11-5

N=length(gray);
bin=gray;

for i=2:N
    if (bin(i-1)==gray(i))
        bin(i)=0;
    else
        bin(i)=1;
    end
end
