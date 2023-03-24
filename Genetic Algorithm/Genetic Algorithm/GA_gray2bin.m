function binary=GA_gray2bin(gray, bit_len)
%% binary=GA_gray2bin(gray, bit_len);
%% Convert a Gray matrix to a Binary matrix.

[popu_size, chro_len]=size(gray);
var_len=chro_len/bit_len;

binary=gray;
for i=1:popu_size
    for j=1:var_len
        % Determine bit head and bit tail
        bit_h=bit_len*(j-1)+1; bit_t=bit_h+bit_len-1;
        % Pick out the code to be converted
        temp=gray(i,bit_h:bit_t);
        % Call Gray to Binary
        temp=GA_g2b(temp);
        % Send it back to binary
        binary(i,bit_h:bit_t)=temp;
    end
end

        