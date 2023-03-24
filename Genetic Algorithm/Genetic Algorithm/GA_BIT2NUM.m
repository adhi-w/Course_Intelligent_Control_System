function num = GA_bit2num(bit, range)
% GA_BIT2NUM Conversion from bit string representations
%   to decimal numbers.
% num= GA_BIT2NUM(BIT, RANGE) converts a bit string 
%   representation BIT ( a 0-1vector) to a decimal number
%   , where RANGE is a two-element vector specifying the
%   range of the converted decimal number.
%
%	For example:
%
%	GA_bit2num([1 1 0 1], [0, 15])
%	GA_bit2num([0 1 1 0 0 0 1], [0, 127])

%	Roger Jang, 12-24-94

integer = polyval(bit, 2);  %[1 1 0 1]==> 1*2^3+1*2^2+0*2+1
num = integer*((range(2)-range(1))/(2^length(bit)-1)) +...
               range(1);  

