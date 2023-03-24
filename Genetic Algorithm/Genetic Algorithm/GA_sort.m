function [fitness, index]=GA_sort(fit)
% function [fitness, index]=GA_sort(fit)
% GA_sort.m
% Sort the fitness from largest to the smallest in order
% For example: fit=[3 5 4 2 1]'; After sorting,
% fitness=[5 4 3 2 1]'; index=[2 3 1 4 5]'

% PenChen Chou, 6-30-2001

T=-fit;
[T index]=sort(T);
fitness=-T;