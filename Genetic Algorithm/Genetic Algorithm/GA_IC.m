function popu=GA_IC(popu, IC)
%function popu=GA_IC(popu, IC)
% GA_IC.m

% PenChen Chou, 7-1-2001

if ~isempty(IC)
   len_IC=length(IC);        %IC=[1 1 0 1 0]
   len_code=size(popu,2);    %total_bits
   if len_code==len_IC       %Otherwise no IC used.
      popu(1,:)=IC; fprintf('>>>Use IC value <<<\n'); pause(2);
   else
      fprintf('>>>No IC available.<<<\n');
   end  % IC in binary for BGA or real for CGA  
   %keyboard
end    
