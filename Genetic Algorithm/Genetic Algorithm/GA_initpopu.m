function popu=GA_initpopu(popuSize, bit_n, var_n, PRINT)
% popuSize is the size of population, an even positive
%  integer is prefered. i.e. popuSize=36.
% bit_n is the bit length.
% var_n is the number of parameters(Genes)
% PRINT=1 then print out Binary Population Chromosomes
% For example:
% GA_initpopu(36, 8, 2)

% PenChen Chou, 6-30-2001
if nargin==3
   popu = rand(popuSize, bit_n*var_n) > 0.5;   
else
   popu = rand(popuSize, bit_n*var_n) > 0.5   
end;    
