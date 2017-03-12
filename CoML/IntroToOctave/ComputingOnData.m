A = [1 2; 3 4; 5 6]
B = [11 12; 13 14; 15 16]
C = [1 1; 2 2]

A*C % Normal vector multiplication

D = [3,4; 5,6]

%
% .   element-wise operations
%

C.*D % element-wise multiplication
A./B % element-wise division
A.^2 % element-wise squaring, A^2 gives error

v = [1; 2; 3]
1./v % element-wise inverse of v

log(v) % element-wise log of v
exp(v) % element-wise exponential/base e for each element

v = [-1; 2; -3]
abs(v) % element-wise absolute values of v - [1; 2; 3] non negative v
-v % element-wise negative ov all values in v - [1; -2; 3]


%
% more complex operations
%

v + ones(length(v), 1) % adds one to each element
v + 1 % ^^

A' % Transpose a matrix

a = [1 15 2 0.5]
val = max(a) % returns max value in a
[val, ind] = max(a) % returns max value in a and the Index
[val, ind] = max(A) % if performed on a 2D matrix returns the max from each column

a < 3 % element wise comparison, returning 1 for true and 0 for false in similar matrix

find(a<3) % retruns position of elements that are less than 3 in matrix a

A = magic(3) % returns magic squares of NxN where every row and column diagonal adds up to the same thing

[r,c] = find(A >= 7) % returns row (r) and column (c) of elements in A greater than 7

sum(a) % the sum of all elements in a

prod(a) % the product of all elements in a

floor(a) % rounds all elements down to the nearest integer
ceil(a) % rounds all elements up to the nearest integer

max(rand(3),rand(3)) % returns max element element-wise from each matrix

max(A,[],1) % row-wise maximum element
max(A,[],2) % column-wise maximum element

max(max(A)) % maximum element in 2D matrix
max(A(:)) % ^^

A = magic(9)
sum(A,1) % returns the sum of all elements in each column
sum(A,2) % returns the sum of all elements in each row

eye(9)
A.*eye(9) % returns all diagonals in A
sum(sum(A.*eye(9))) % sum of all elements in diagonal (top left to bottom right)

flipud(eye(9)) % reflects threw middle. top goes on bottom, bottom goes on top.

sum(sum(flipud(A.*eye(9)))) % sum of all elements in diagonal (bottom left to top right)


pinv(A) % psuedo inverse of A

pinv(A)*A %% Returns an identity matrix...
