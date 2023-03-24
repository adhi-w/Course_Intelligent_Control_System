function GA_print(gen_no, gen_last, var_n, popu, ...
                   popu_real, fcn_val, STEPS, bit_n, popuSize)
global MIN_offset MUL_factor LOCUS x_data y_data true_para message
%=====================================================
% GA_print.m
% function GA_print(gen_no, gen_last, var_n, popu, ...
%                   popu_real, fcn_val, STEPS)
% global LOCUS x_data y_data
%=====================================================
% Print intermediate results like the following
% [Generation #500], ===>Best_FIT= 51.00000000
%    para( 1)=  -5.01609163
%    para( 2)=  -5.06722401
%    para( 3)=  -5.11193552
%    para( 4)=  -5.01528481
%    para( 5)=  -5.02855515
%
% If LOCUS is not zero, collect para(1) to
% x_data and para(2) to y_data for plotting
% Only for the 3-dim plot
% LOCUS, x_data, y_data must be defined in MAIN program

% PenChen Chou, 7-1-2001. 2004-10-2.

% If LOCUS does not existed, set it to sero.
if isempty(LOCUS)==1, LOCUS=0; end;

% Make sure to get the best of fitness function
[Y, I]=max(fcn_val);
%
BEST=popu_real(I,:);
if exist('true_para')
  if ~isempty(true_para) 
    if length(BEST)==length(true_para), 
       BEST=true_para; 
    else
       error('BEST is not matched to true_para!');
    end
  end
end
BEST_bit=popu(I,:);
BEST_fit =Y;
fprintf('\n');
if mod(gen_no,STEPS)==0 | gen_no==1 | gen_no==gen_last
  if var_n<=10  
   for I=1:var_n
       fprintf('para(%2i)=%14.8f;\n',...
                                       I, BEST(I));
   end;
  end
  if MIN_offset==0
   fprintf('[Generation #%3i], ===>Best_FIT= %18.8f\n',...
                gen_no, Y);
  else
   fprintf('[Generation #%3i], ===>Best_FIT= %18.8f\n',...
                gen_no, MIN_offset-Y);
  end
   if exist('message')==1, fprintf('Last mension:                     %.8f\n',message); end        
   fprintf('\n');
else
   fprintf('\n');
end;

% If LOCUS is not zero, plot the best parameters on 3-dim
% contour in figure 2. So, collect the data first.
if LOCUS>0
    x_data=[x_data BEST(1)];
    y_data=[y_data BEST(2)];
end;

% THE FOLLOWING IS USED FOR CLASS-ROOM DEMONSTRATION USE. IF
% BIT_LEN=12 AND POPUSIZE=8, THEN OPEN THE FOLLOWING SECTION
% (ie. y2000=1;) IN ORDER TO PRINT OUT MORE DETAILED INFORMATION
% FOR DEMO.
y2000=0;
if ((bit_n==12) & popuSize==8), y2000=1; end
if y2000
  fprintf(' POPU #      String            x           fitness\n');
  for IV=1:8
    fprintf('   %d      %d%d%d%d%d%d%d%d%d%d%d%d    %10.6f    %12.6f\n',...
        IV,popu(IV,1),popu(IV,2),popu(IV,3),popu(IV,4),...
        popu(IV,5),popu(IV,6),popu(IV,7),popu(IV,8),...
        popu(IV,9),popu(IV,10),popu(IV,11),popu(IV,12),...
        popu_real(IV),fcn_val(IV));
  end
end