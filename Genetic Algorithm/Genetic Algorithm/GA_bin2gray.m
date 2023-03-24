function gray=GA_gray2bin(bin, bit_len)
%% gray=GA_bin2gray(bin, bit_len);
%% Convert a Biary matrix to a Gray matrix.

[popu_size, chro_len]=size(bin);
var_len=chro_len/bit_len;

gray=bin;
for i=1:popu_size
    for j=1:var_len
        % Determine bit head and bit tail
        bit_h=bit_len*(j-1)+1; bit_t=bit_h+bit_len-1;
        % Pick out the code to be converted
        temp=bin(i,bit_h:bit_t);
        % Call Gray to Binary
        temp=GA_b2g(temp);
        % Send it back to binary
        gray(i,bit_h:bit_t)=temp;
    end
end

        