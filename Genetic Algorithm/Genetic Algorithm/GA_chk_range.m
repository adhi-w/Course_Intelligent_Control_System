function var_n=GA_chk_range(popuSize, range)
% function var_n=GA_chk_range(popuSize, range)
% GA_chk_range.m

% PenChen Chou, 7-1-2001

% If improper popuSize. set it at least to 6.
popuSize=max([6, popuSize]);
% If range is improper, return with error messgae
LOW=range(1,:); HI=range(2,:); delta=HI-LOW;
AHA=find(delta<0); 
if ~isempty(AHA), 
  error('****> Sorry! range data is incorrect, pls check!');
end;
% Find var_n from range.
var_n=size(range,2);