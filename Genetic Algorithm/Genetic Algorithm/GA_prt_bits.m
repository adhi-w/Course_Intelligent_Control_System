function GA_prt_bits(chro, var_n)
% function GA_prt_bits(chro, var_n)
% GA_prt_bits.m
% Print bits of a chromosome in compact form 
%   for easy reading
% fit is the fitness values
% c_real is decimal equivalent of chro
% chro is the chromosome in bit strings
% var_n is the number of parameters

% PenChen Chou, 6-30,2001

[popu_n, bit_len]=size(chro);
per_var=bit_len/var_n;
for I=1:popu_n
    for J=1:bit_len
        if ~mod(J,per_var)
            fprintf(' | ');
        else
            fprintf('%i',chro(I,J));
        end;
    end;
    fprintf('\n');
end;    
