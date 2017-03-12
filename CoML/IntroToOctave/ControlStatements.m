%
% The For Loop
%
for i = 1:10,
  v(i) = 2^i;
end

indicies =  1:10;
for i = indicies,
  disp(i);
end;

%
% The While Loop
%
i = 1;
while i <= 5,
  v(i) = 100;
  i = i i+1;
end;
v % should overwrite the first 5 elements with 100

i = 1;
while true, % will always be true
  v(i) = 999:
  i = i + 1;
  if i == 6,
    break; % breaks out because i eventually = 6
  end;
end;
v % should overwrite the first 5 elements with 999


%
% If and Else Statements
%
v(1) = 2;
if v(1)==1,
  disp('The value is one');
elseif v(1)==2,
  disp('The value is two');
else
  disp('the value is one nor two');
end;

quit % Exits octave


%%%%
%%%% Functions
%%%%
% You should place functions in their own script files and add the folder path
% to the search path


% Define the function as squareThisNumber
% it returns a number y and takes the parameters x
function y = squareThisNumber(x)

  y = x^2;
% This would be saved a script in the octave search path

squareThisNumber(6) % would return 36, this statment calls the function


% Change the octave search path directory so that
% octave always knows where to search for functions
addpath('~\Developer\Octave')
path % returns current search paths

% Functions that return multiple values
function [y1,y2] = squareAndCubeThisNumber(x)

  y1 = x^2;
  y2 = x^3;

[a,b] = squareAndCubeThisNumber(5); % Call the function again
a % each letter is now its own variable
b

cd '~\Developer\IntroToOctave'

X = [1 1; 1 2; 1 3]
y = [1; 2; 3]
theta = [0;1];
j = costFunctionJ(X,y,theta)
