% Percent symbol is denotes a comment

%
% Math operations
%

5 + 6
3 - 2
5 * 8
1 / 2
2^6

%
% Logic operations
%

1 == 2  % Equals operator -> returns 0 (false)
1 ~= 2  % NOT Equalse operator -> returns 1 (true)
1 && 0  % AND
1 || 0  % OR
xor(1,0)  % XOR operator

PS1('>> ') % Change the octave prompt to '>> '

a = 3 % Assigns the number 3 to variable 'a'

a = 3; % semi-colon after any statement prevents printing out.
b = 'hi'; % Assigns string to variable b
a = pi; % Assigns a to 3.1416
c = (3>=1) % Assins c to be result of truth operation -> 1 (true)

%
% Printing
%

a % just type the name of a variable to print it out
disp(a) % same ^^
disp(sprintf('2 decimals: %0.2f', a)) % Prints string '2 decimals: 3.14'
disp(sprintf('6 decimals: %0.6f', a)) % Prints ^^ but with 6 decimals
format long % sets string length to be printed to be longer
format short % sets string length to pe printed to be shorter |DEFAULT|


%
% Matrices
%

A = [1 2; 3 4; 5 6] % Assigns A to be 3x2 matrix
v = [1; 2; 3]
v = 1:0.1:2 % Fills a row vector with all numbers from 1 to 2 incrementing by 0.1
v = 1:8 % Fills a row vector with all numbers from 1 to 8 incrementing by 1

ones(2,3) % Generates a 2x3 matrix of only 1's
C = 2 * ones(2,3) % Generates a 2x3 matrix of 2's
w = zeros(1,3) % Generates a 1x3 matrix of 0's
w = rand(3,3) % Generates a 3x3 matrix of random numbers between 0 and 1
w = randn(1,3) % Generates Gaussian random numbers in 1x3 matrix

w = -6 + sqrt(10) * (randn(1,10000))
hist(w) % Plots a historgram of numbers in w
hist(w,50) % Plots a historgram of numbers in w with 50 bins

eye(4) % Plots an identity matrix of NxN, where N is given parameter - eye(N)


%
% Help functions
%

help eye % Opens documentation about function NAME, where Name is given parameter - help NAME
help rand
help help
