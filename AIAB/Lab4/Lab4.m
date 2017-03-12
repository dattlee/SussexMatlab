Max_Volume = 50;

%benefit
B = [6    19     7     1    13    17     3    18    16    20     5    15    12    11     9     2    14     4    10     8];

%volume
V = [10     5    15    18     1    17    12    19    16     4     9    20    13     7     3     2     6    11     8    14];


gen = 1000; % number of generations / number of matchups
pop = 100; % population size

% % %
% % %   Task 1
% % %

[winner,winnerInd,fitRec,popGens] = Task1(B,V,Max_Volume,pop,gen);

x = linspace(1,gen,gen);
figure(1);plot(x,fitRec');

% sourced from Stack over flow: http://stackoverflow.com/questions/2692482/get-the-indices-of-the-n-largest-elements-in-a-matrix
% Find top 4 individuals from the tournament
[sortedValues,sortIndex] = sort(fitRec(:,end),'descend');  % Sort the values in
maxIndex = sortIndex(1:4);                             %   descending order retrun top 4 indices

task1solutions = popGens(maxIndex,:)

save('Lab4_task1_solutions.mat','task1solutions');



% % %
% % %   Task 2
% % %

local = 5;
[winner,winnerInd,fitRec,popGens] = Task2(B,V,Max_Volume,pop,gen,local);

x = linspace(1,gen,gen);
figure(2);plot(x,fitRec');

[sortedValues,sortIndex] = sort(fitRec(:,end),'descend');  % Sort the values in
maxIndex = sortIndex(1:4);                             %   descending order retrun top 4 indices

task2solutions = popGens(maxIndex,:)

save('Lab4_task2_solutions.mat','task2solutions');



% % %
% % %   Task 3
% % %

gen = 10000
local = 5;
cross = 0.5;
[winner,winnerInd,fitRec,popGens] = Task3(B,V,Max_Volume,pop,gen,local,cross);

x = linspace(1,gen,gen);
figure(3);plot(x,fitRec');

[sortedValues,sortIndex] = sort(fitRec(:,end),'descend');  % Sort the values in
maxIndex = sortIndex(1:4);                             %   descending order retrun top 4 indices

task3solutions = popGens(maxIndex,:)

save('Lab4_task3_solutions.mat','task3solutions');
