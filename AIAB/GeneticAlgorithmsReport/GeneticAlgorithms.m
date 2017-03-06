% % % 
% % % The Items
% % % 

%%% Small Number of genes
% MAX_VOLUME = 20; 
% B = [5 6 1 9 2 8 4 3 7 10]; % Benefits
% V = [3 2 4 5 8 9 10 1 6 7]; % Volumes

MAX_VOLUME = 50; 
% Benefits
B = [3    54    55    32    50    26    70     7    45     1    40    28    46    16    20    15    56    98    13    66    29    64    96    91    97    99    94    51    27    30    43     9    14    62    92    76    37    85    23    52    67    39    82    42     8    25    44    31 11   100    74    75    60    93    73    36    35    77    78    24    84    61    19    88    49    18    90    22    89    68    81    59    57    65    58    63     4    72    69    41    80    10    83     5    79    53    95    21     6    17    87    38    33    12    71    86 47    34    48     2];
% Volumes
V = [  6     8     5    10     8     6     7    14    11     9    14     6    12    12    10     6    10     7     6     7    13     5     7     5     9     5    13     6     5     8     9     6    14     8     7     5     7     5    10    12    11     5     5    12    14    10     6    13 8     7    12     5     5    11    11    10    12    12    12     7    11    10     8     5    12     8    11    12     6     6    10     9    13    12    12     5     5     5    12    14    11     6    12     6     6    11     8    11    12    10    12     7    12    14    13     5 8     8    11    10];

%%% Hillclimber GA
pop = 100; % Population size
gen = 20000; % No. Generations
generate = 0; % 1, to randomly generate population genomes, 0 to set to nothing
mut = 10;

fitRec = hillClimber(B,V,pop,gen,MAX_VOLUME,generate,mut);

x = linspace(1,gen,gen);
HILLCLIMBER_MAX = max(fitRec)
figure(1);plot(x,fitRec'); % ,[0 x],ones(gen+1,1)*HILLCLIMBER_MAX);
hold on;
title('Hill Climber GA Fitness Record');
ylabel('Fitness');
xlabel('Number of generations');
hold off;
print -dpng 'HillClimberFitness.png'



%%% Microbial GA
pop = 100; % Population size
gen = 50000; % No. of tournaments
generate = 1;  % 1, to randomly generate population genomes, 0 to set to nothing
mut = 1; % Mutation proportion 1 would be 1/length(B)
local = 5;
cross = 0.5;
[winner,winnerInd,fitRecMicrobial,popGens] = microbial(B,V,pop,gen,MAX_VOLUME,generate,mut,local,cross);

x = linspace(1,gen,gen);
figure(2);plot(x,fitRecMicrobial');
hold on;
title('Microbial GA Fitness Record');
ylabel('Fitness');
xlabel('Number of generations');
hold off;
MICROBIAL_MAX = max(fitRecMicrobial)
print -dpng 'MicrobialFitness.png'


% Save solutions for top 4 in population
populationFits = popGens*B';
[sortedValues,sortIndex] = sort(populationFits(:,end),'descend');  % Sort the values in
maxIndex = sortIndex(1:4);                             %   descending order retrun top 4 indices

microbialSolutions = popGens(maxIndex,:);

save('microbialSolutions.mat','microbialSolutions');