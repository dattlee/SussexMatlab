A = [1 2; 3 4; 5 6]

size(A) % returns the dimentions of A
size(A,1) % returns the dimentions of rows in A (first dimention)

length(A) % returns length of the longest dimention of A - would return 3
length([1;2;3;4;5])% usualy only used for vectors

pwd % returns current directory
cd '~\Developer\IntroToOctave' % changes directory to given file path
ls % lists directories in current directory

load featuresX.dat % Loads file into octave (use when stored in current directory)
load('featuresX.dat') % same as previous command but giving file path as a string
load priceY.dat

who % What current variables are in octave
whos % Gives a detailed view of current variables
clear featuresX % removes variable featuresX from workspace

v = priceY(1:10) % Sets v to equal the first 10 elements of priceY

save hello.mat v; % Saves variable v into a file called hello.mat (as binary file)

clear % clears all variables in workspace
load hello.mat % Loads variable v from hello.mat into workspace

save hello.txt v -ascii; % save as text file (ASCII)

A = [1 2; 3 4; 5 6]
A(3,2) % Indexes element at 3,2 in the matrix A (6)
A(:,2) % Indexes everything in the second column
A([1 3], :) % Index everything from the 1st and 3rd columns

A(:,2) = [10; 11; 12] % Overwrites variables in the 2nd colum of A
A = [A, [100, 101, 102]]; % Append a column vector to the right of A

A(:) % put all elements of A into a single column vector

A = [1 2; 3 4; 5 6]
B = [11 12; 13 14; 15 16]

C = [A B] % 3x4 matrix
C = [A; B] % 6x2 matrix

quit % Exits octave
