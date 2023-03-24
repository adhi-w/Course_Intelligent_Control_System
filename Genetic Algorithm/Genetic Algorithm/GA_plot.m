function [para,best_pi]=GA_plot(generation_n, upper, ...
    average, lower, BEST_popu)
global MIN_offset MUL_factor true_para
%========================================================
% GA_plot.m
% global MIN_offset MUL_factor
%function [para,best_pi]=GA_plot(generation_n, upper, ...
%    average, lower, BEST_popu)
%========================================================
% Plot the resultant upper, average and lower bounds
%
% Display the final message like this
% The best generation occured at generation #283.
%   x1 =  -5.01609163
%   x2 =  -5.06722401
%   x3 =  -5.11193552
%   x4 =  -5.01528481
%   x5 =  -5.02855515
% ==>Best fitness for MAX. problem is (51.00000000)
%
% MIN_offset != 0 means a minimization problem
% Return parameters: para, best_pi

% PenChen Chou, 7-1-2001

% Plot
figure(1);
%GA_Whitebg;
x = (1:generation_n)';
plot(x, upper, 'o', x, average, 'x', x, lower, '*');
hold on;
plot(x, [upper average lower]);
hold off;
legend('Best', 'Average', 'Poorest');
xlabel('Generations'); ylabel('Fitness');

% Display
[BEST, inx1]=max(upper);
para=BEST_popu(inx1,:); len_bx=length(para);
if ~isempty(true_para), para=true_para; end
fprintf('The best generation occurred at generation #%i.\n',inx1);
for I=1:len_bx
    fprintf('para(%2d) = %12.8f;\n',I,para(I));
end;    

BEST=BEST/MUL_factor; 
if MIN_offset==0
    best_pi=BEST;
    fprintf('==>Best fitness for MAX. problem is (%.8f)\n',...
                     best_pi);
else
    best_pi=(MIN_offset-BEST);
    fprintf('==>Best fitness for MIN. problem is (%.8f)\n',...
                     best_pi);
end;
