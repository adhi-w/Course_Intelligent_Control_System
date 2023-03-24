function new_popu = GA_nextpopu(object, popu, bit_len, xover_rate, mut_rate, elite)
%% next_popu = GA_nextpopu(object, popu, bit_len, xover_rate, mut_rate, elite)
%%
%% do elite, linear ranking, selection, crossover, mutation functions
%% Modified on 2002-10-25, by PenChen Chou

%-----------------------------------------------------------
% Copy popu to new_popu.
%disp('******> In modified GA_nextpopu under \WORK <******');
new_popu = popu;
popu_s = size(popu, 1);
string_leng = size(popu, 2);
var_n=string_leng/bit_len;
% Reset negative fitness value
I=find(object<=0);
if ~isempty(I), object(I)=0.0*ones(size(I)); end
%object=log10(object.^3);
%----------------------------------------------------------------
% Change objective to fitness with select_pressure of 1.2 to 2.
fitness=object;
if (rand>0.5)
   rand('state',sum(100*clock))
   fitness=GA_LinRank(fitness,min([2, max([1.2, 3*rand])]));
end

%----------------------------------------------------------------------
% ====== ELITISM: find the best two and keep them in index1 and index2
if elite==1
   tmp_fitness = object;
   [junk, index1] = max(tmp_fitness);	% find the best
   tmp_fitness(index1) = min(tmp_fitness);  % Change it to a small value for next max finding
   [junk, index2] = max(tmp_fitness);	% find the second best
   % Put the best 2 into new_popu for xover and mutation later
   %new_popu([1 2], :) = popu([index1 index2], :);  % Save the best two chromosomes for Elitism=1
end;

%--------------------------------------------------------------------
% Apply linear fitness scaling
% After several trials, using LFS is no better than not using it.
%fitness=GA_linear_fit_scale(fitness,2);    % Assume cm=2 in all cases

%--------------------------------------------------------------------
% Roulette wheel selection as well as crossover
xfitness = fitness/sum(fitness);	  % Roulette wheel selection
cum_prob = cumsum(xfitness);          % Comparison table created
%cum_prob(1:10),pause

% ====== SELECTION and CROSSOVER
for i = 2:popu_s/2,   % The first is untouched because of Elitism. 
	% === Select two parents based on their scaled fitness values
	tmp = find(cum_prob - rand > 0);
    if ~isempty(tmp)
	   parent1 = popu(tmp(1), :);
    else
	   parent1 = popu(1, :);
    end
    tmp = find(cum_prob - rand > 0);
    if ~isempty(tmp)
	   parent2 = popu(tmp(1), :);
    else
	   parent2 = popu(2, :);
    end
	% === Do crossover
	if rand < xover_rate,
       % Perform crossover operation
	   xover_point = ceil(rand*(bit_len-1));   % min=1 and max=3 if bit_len=4
       K=-bit_len;
       for J=1:var_n
         K=K+bit_len;
         new_popu(i*2-1, K+1:K+bit_len) = ...
		 [parent1(K+1:K+xover_point) parent2(K+xover_point+1:K+bit_len)];
		 new_popu(i*2,   K+1:K+bit_len) = ...
		 [parent2(K+1:K+xover_point) parent1(K+xover_point+1:K+bit_len)];
       end;
	end
end

% ====== MUTATION (elites are not subject to this.)
mask = rand(popu_s, string_leng) < mut_rate;
new_popu = xor(new_popu, mask);

%-----------------------------------------------------------------
% restore the elites if elite==1
if elite==1,
   new_popu([1:2], :) = popu([index1 index2], :); % Save the best only back to new_popu
end;
%--------------------END-----------------------------------------