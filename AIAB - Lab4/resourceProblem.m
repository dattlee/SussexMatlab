Max_Volume = 50;

%benefit
B = [6    19     7     1    13    17     3    18    16    20     5    15    12    11     9     2    14     4    10     8];

%volume
V = [10     5    15    18     1    17    12    19    16     4     9    20    13     7     3     2     6    11     8    14];

% tournament(B,V,maxVol,pop,gen)
gen = 2000; % number of generations / number of matchups

[winner,winnerInd,fitRec,popGens] = tournament(B,V,50,100,gen);


x = linspace(1,gen,gen+1);

plot(x,fitRec');

while winner<111
    [winner,winnerInd,fitRec,popGens] = tournament(B,V,50,100,gen);
end



% % sourced from Stack over flow: http://stackoverflow.com/questions/2692482/get-the-indices-of-the-n-largest-elements-in-a-matrix
[sortedValues,sortIndex] = sort(fitRec(:),'descend');  %# Sort the values in
maxIndex = sortIndex(1:4);                             %#   descending order retrun top 4 indices


solutions = popGens(maxIndex,:);
save('solutions.mat','solutions');