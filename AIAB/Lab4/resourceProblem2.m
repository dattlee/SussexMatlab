Max_Volume = 50;

%benefit
B = [3    54    55    32    50    26    70     7    45     1    40    28    46    16    20    15    56    98    13    66    29    64    96    91    97    99    94    51    27    30    43     9    14    62    92    76    37    85    23    52    67    39    82    42     8    25    44    31 11   100    74    75    60    93    73    36    35    77    78    24    84    61    19    88    49    18    90    22    89    68    81    59    57    65    58    63     4    72    69    41    80    10    83     5    79    53    95    21     6    17    87    38    33    12    71    86 47    34    48     2];


%volume
V = [  6     8     5    10     8     6     7    14    11     9    14     6    12    12    10     6    10     7     6     7    13     5     7     5     9     5    13     6     5     8     9     6    14     8     7     5     7     5    10    12    11     5     5    12    14    10     6    13 8     7    12     5     5    11    11    10    12    12    12     7    11    10     8     5    12     8    11    12     6     6    10     9    13    12    12     5     5     5    12    14    11     6    12     6     6    11     8    11    12    10    12     7    12    14    13     5 8     8    11    10];


pop = 100
gen = 40000
local = 5
cross = .05
local = 5;
cross = 0.5;
[winner,winnerInd,fitRec,popGens] = Task3(B,V,Max_Volume,pop,gen,local,cross);

x = linspace(1,gen,gen);
figure(3);plot(x,fitRec');

[sortedValues,sortIndex] = sort(fitRec(:,end),'descend');  % Sort the values in
maxIndex = sortIndex(1:4);                             %   descending order retrun top 4 indices

solutions = popGens(maxIndex,:)

save('resourceProb2Solutions.mat','solutions');
