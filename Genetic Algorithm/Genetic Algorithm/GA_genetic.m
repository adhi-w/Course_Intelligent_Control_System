function [popu, popu_real, fcn_value, upper, average,...
    lower, BEST_popu, popuSize, gen_no, para, best_pi,...
    bit_n, xover_rate, mutate_rate]=...
GA_genetic(obj_fcn, ranges, IC, elite, gen_no,...
    popuSize, bit_n, xover_rate, mutate_rate);
%% *********************************************************
%% GA_genetic.m file. Modification of go_ga.m file
%% ==========================================================
%%function 
%    [popu, popu_real, fcn_value, upper, average,...
%    lower, BEST_popu, popuSize, gen_no, para, best_pi,...
%    bit_n, xover_rate, mutate_rate]=...
% GA_genetic(obj_fcn, ranges, IC, elite, gen_no, popuSize,...
%    bit_n, xover_rate, mutate_rate);
%% ==========================================================
%% global variables: MIN_offset MUL_factor LOCUS x_data y_data
%%  (1). All global variables must be defined in MAIN program.
%%       For maximization problem, set MIN_offset=0.
%%       For minimization problem, set MIN_offset>0.
%%       What is appropriate for MIN_offset, the user must
%%            define by himself.
%%  (2). LOCUS=1 means to plot locus of optimization on the 
%%       3-dim contour plot if the user wants to. otherwise,
%%       set it to 0
%%  (3). Let x_data=[]; y_data=[]; in the MAIN program
%%  (4). User must determine the value of MIN_offset for a
%%       minimization problem before calling GA_genetic function
%%  (5). MIN_offset must be defined in your fitness evaluation
%%       function file. (see below)
%%=============================================================
%% Calling notes:
%%
%% INPUTS:
%% (1). obj_fcn must be a string whose function is to calculate
%%      the fitness function values. for example, 'xpeaksfcn'.  
%%      In general xpeaksfcn.m is function m-file with a form of
%%        output=xpeaksfcn(input).
%% (2). ranges is matrix with min on the first row and max on the
%%      second row, such as,
%%        [-3 -3  5     <=== LOWER bounds
%%          4  5  8]    <=== UPPER bounds
%%      represents three variables in this example. var_n used
%%      in this function is determined from ranges.
%% (3). IC [appended later]
%% (4). elite is the keeping of the best fit for every next 
%%         generation (default=1. Use 1 or 0 only)
%% (5). gen_no is the size of generations(default=70).
%% (6). popuSize is the size of populations(default=70). IF 
%%      popuSize <=10, BINARY BITS OF EACH POPU WILL BE PRINTED
%%      FOR EXAMINATION USE.   //UPDATED 3/16/2001
%% (7). bit_n is the bit length of one varaible (default=40).
%% (8). xover_rate is the probability of single crossover rate 
%%      (default=0.7).
%% (9). mutate_rate is the probability of mutation (default=0.02).
%%
%% OUTPUTS:
%% (1). popu         --- populations of the last generation
%% (2). fcn_value  --- fitness values for the last populations
%% (3). upper        --- max fitness of each generation
%% (4). average     --- average fitness of each generation
%% (5). lower        --- min fitness of each generation
%% .........
%% ***************************************************************
%% FOR EXAMPLE:
%% The following is a complete and executable OK MAIN program
%% Listing of the MAIN program called GA_ex21.m file
%% >>> Execute GA_ex21 under matlab command window.
%%---------------------------------------------------------
%% GA_ex21.m file
%% Fin min of a function of 2 varaibles
%%
%% PenChen Chou, 7-1-2001
%%
%% --------------------------------------------------------
%%       User must define the follows
%%---------------------------------------------------------
%global MIN_offset MUL_factor LOCUS x_data y_data
%MIN_offset=25; 
%LOCUS=1; x_data=[]; y_data=[]; 
%obj_fcn = 'GA_f21';	% Objective function
%ranges = [0 0
%        10 10];	% Range of the input variables
%%---------------------------------------------------------
%%       Options, user can define or use defaults
%%---------------------------------------------------------
%elite=1; gen_no=500; popuSize=60; bit_n=40; IC=[];
%xover_rate=0.7; mutate_rate=0.05;
%%---------------------------------------------------------
%%       Options
%%---------------------------------------------------------
%% This is for 3-dim contour plot use, it can be ommitted
%x=0:0.1:10; y=x; [X,Y]=meshgrid(x,y);
%Z=X.*sin(4*X)+1.1*Y.*sin(2*Y);
%figure(2);contour(X,Y,Z)
%%---------------------------------------------------------
%tic     % tic, toc for getting the execution time
%% call GA
%    [popu, popu_real, fcn_value, upper, average,...
%    lower, BEST_popu, popuSize, gen_no, para, best_pi,...
%    bit_n, xover_rate, mutate_rate]=...
%GA_genetic(obj_fcn, ranges, IC, elite, gen_no, popuSize,...
%    bit_n, xover_rate, mutate_rate);
%
%t=toc/60;
%fprintf('==>  Computation time is (%.2f) minutes.\n\n',t);   
%%-----------------------------------------------------------
%% You can stop your program writing here   <======LOOK HERE         
%%-----------------------------------------------------------
%%       OPTIONS
%%-----------------------------------------------------------
%% For 3-dim contour plot only.
%% Plot locus of optimization process
%LAST=length(x_data);
%figure(2); hold on
%plot(x_data(1),y_data(1),'x');
%plot(x_data,y_data);
%plot(x_data(LAST),y_data(LAST),'o');
%% plot(0,0,'*');   % The [x,y] coordinates of the best fit
%%                  % you put if you know. i.e. [0,0].
%hold off
%title('*=BEST, x=Starting point, o=Ending point')
%%-------------------------------------------------------------
%% End of the MAIN program
%% *************************************************************
%%
%% *************************************************************
%% List the calling fitness function evaluation
%%-------------------------------------------------------------
%function PI=GA_f21(chro)
%global MIN_offset
%% Fitness function evaluation of Example 2-1
%
%% PenChen Chou, 6-30-2001
%
%x=chro(1); y=chro(2);
%z=x*sin(4*x)+1.1*y*sin(2*y);
%% z is the smaller the better
%% Convert it to a maximum value. x=[0 10], y=[0 10];
%% the worst negative value is -10-11=-21,
%% we assume a positive value of 25 to convert the min.
%% problem to a max. problem.
%PI=MIN_offset-z;
%% End of fitness evaluation function
%% **************************************************************
%%
%% **************************************************************
%% The final result of the above example should be look like this
%%The best generation occured at generation #473.
%%   x1 =   9.03900200
%%   x2 =   8.66820000
%%==>Best fitness for MIN. problem is (-18.55472107)
%% **************************************************************
%%
%%=============================================================
%% Future revision
%%=============================================================
%% NEED TO APPEND (max,min), linear fitness scaling, Gray code, 
%% real parameters or CGA
%%=============================================================
%%  END of all DESCRIPTIONs
%%*************************************************************

% ORIGINAL CONSTRUCTOR: Roger Jang
% MODIFIER: PENCHEN CHOU
% DATE:    4- 5-2001
% Revised: 6-30-2001
% Revised: 7- 8-2001
% Revised: 6- 4-2002

%====================================================
% GA starts here
%====================================================
global MIN_offset MUL_factor LOCUS x_data y_data 

% CHECK ERRORS AND SET DEFAULTS
NARG=nargin;
if NARG>9 | NARG<2
   error('===>Too many or too little input arguments');
else   
   if NARG<= 9
        ;
   end;   
   if NARG<= 8
      mutate_rate=0.02;   
   end;   
   if NARG<= 7
      xover_rate=0.7;
   end;   
   if NARG<= 6
        bit_n=40;
   end;   
   if NARG<= 5
        popuSize=70;
   end;   
   if NARG<= 4
        gen_no=70;
   end;   
   if NARG<= 3
        elite=1;
   end;   
   if NARG<= 2
        IC=[ ];
   end;   
end;   
if mutate_rate<0.05, mutate_rate=0.05; end; % Not too small. 2004-9-23.
rand('state',sum(100*clock));
%===================================================================================
% Appending GRAY code into this function makes the computation as large as 1.5 times
%   of the original execution time, but gets better results (e.g. GA_ex24.m)
%disp('>>>> In modified GA_gentic algorithm (2004-1-16) <<<<!');
disp('>>>> In modified GA_gentic algorithm (2004-10-2) <<<<!');
% Wait for 3 seconds for user to see the above note.
pause(3);

%---------------------------------------------------------
% CHECK ERRORS AND FIND NEEDED CONSTANTS
var_n = GA_chk_range(popuSize,ranges);
%---------------------------------------------------------
% INITIAL POPULATION
% BGA case. BINARY GA algorithm
popu = GA_initpopu(popuSize, bit_n, var_n);

% Load IC into popu.   
popu=GA_IC(popu, IC);

% Set matrices for upper, average and lower 
upper   = zeros(gen_no, 1); % Record max fitness of each gen.
average = zeros(gen_no, 1);
lower   = zeros(gen_no, 1);
BEST_popu=zeros(gen_no, var_n);
haltFlag=0;
%====================================================
% Appended on 2003-12-11
%Ori_xrate=xover_rate;
%Ori_mrate=mutate_rate;
%=====================================================
% MAIN LOOP FOR GA
for n_gen = 1:gen_no;
     % Evaluate objective function for each individual
     %size(popu)
     %pause
     %===================================================
     % Appended on 2003-12-11
     if n_gen>=2,
         previous_BPI=max(fcn_value);
     end
     %===================================================
     [fcn_value, popu_real, popu] = GA_evalpopu(popu,...
                bit_n, ranges, obj_fcn);
     %===================================================
     % The following is cencelled on 2004-0-23
     % Appended on 2003-12-11
     current_BPI=max(fcn_value);
     if n_gen>=2
         if abs(current_BPI-previous_BPI)<1e-12
             haltFlag=haltFlag+1;
             if haltFlag>=500, break; end;
         else
             haltFlag=0;
         end
     end
             %xover_rate =max([0.40, (xover_rate -0.001)]);
             %mutate_rate=min([0.35, (mutate_rate+0.001)]);
             %xover_rate =max([0.5*Ori_xrate, (0.98*xover_rate)]);
             %mutate_rate=min([0.20, (1.05*mutate_rate)]);
             % Appended on 2004-9-23
             %xover_rate = Ori_xrate*(1-n_gen/(2*gen_no));
             %mutate_rate= Ori_mrate+(0.2-Ori_mrate)*n_gen/gen_no;
         %else
         %    xover_rate =Ori_xrate;
         %    mutate_rate=Ori_mrate;
         %end
         %fprintf('\n    {***[Xover, Mutate]=[%5.3f,%5.3f]***}\n',...
         %    xover_rate,mutate_rate); 
     %end
     %==================================================
     % Print out best fitness and parameters for
     %  every generation
     % FOR EXAMPLE, the following is a type of printout
     % [Generation #499], ===>Best_FIT= 100.00000000
     %      parameter( 1)=  -0.00000001
     %      parameter( 2)=   0.00000002
     GA_print(n_gen, gen_no, var_n, popu, popu_real,...
                  fcn_value, 1, bit_n, popuSize);
     %popu % Open it for printout
     % Print out partial data after each 100 generations
     %   and var_n<=2
     % GA_prt_100x2(i, var_n, fcn_value, popu_real);
     
     % Fill objective function matrices
	 [upper(n_gen), index] = max(fcn_value); 
	 average(n_gen) = mean(fcn_value);
	 lower(n_gen)   = min(fcn_value);
     BEST_popu(n_gen,1:var_n)=popu_real(index,:);
     
     % Generate next population via selection, crossover 
     %    and mutation
     % Use GA_newpopu or GA_nextpopu
     popu = GA_bin2gray(popu, bit_n);  % APPENED on 2002-11-5
     popu = GA_nextpopu(fcn_value, popu, bit_n, xover_rate,...
                       mutate_rate, elite);
     popu = GA_gray2bin(popu, bit_n);  % APPENED on 2002-11-5
end  % End of for loop

% Plot the final result, for example, print out the best
%   result (see below) and plot the transition locus of
%   best fit, average fitness and worst fitness in figure 1.
% The best generation occured at generation #371.
%     x1 =  -0.00000001
%     x2 =   0.00000002
%  ==>Best fitness for MAX. problem is (1.00000000)
[para, best_pi]=GA_plot(gen_no, upper, average, lower, BEST_popu);
% Back to the past. Appended on 2004/1/16
%xover_rate=Ori_xrate;
%mutate_rate=Ori_mrate;

% End of GA_genetic
