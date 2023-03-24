% attached_part.m
% This is a partial program codes appended to the end
% of each OBJECTIVE function file.
% IN : PI
% OUT: PI
% It converts a MIN-finding problem to a MAX-finding one.
% Set MIN_offset>0 for a MIN problem.

% PI must be existed before executing this program.
if ~exist('PI')
    error('***ERROR! PI must be defined first');
else
% If it is a minimization problem, then
    if (~isempty(MIN_offset) & MIN_offset>0)
        PI=MIN_offset-PI;
    end
% Scaling
    if ~isempty(MUL_factor)
        PI=PI*MUL_factor;
    end
end
