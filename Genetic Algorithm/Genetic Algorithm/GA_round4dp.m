function y=GA_round4dp(x)
% function y=GA_round4dp(x)
% 
% Only 6 digits after the decimal point is saved for each matrix x.
% When you design DISCRETE controller, the precision of each parameter of
% the controller is required at least 6 digits after the decimal point.

% PenChen Chou. 7- 1-2001
% Revised on    3-28-2002

y=round(x*1000000)/1000000;
