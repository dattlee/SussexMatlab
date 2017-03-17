function x = featScale(X)
% Scales features by
%
% x =  x-mean(x_feature)/standardDeviation
%
% Input data must be of dimentions [m * n]
%   where m is the number of training examples/data
%   and, n is the number of features

X_avg = mean(X);
X_std = std(X);
x = X;

for i = 1:size(X,2)
    x(:,i) = X(:,i) - X_avg(i);
    x(:,i) = X(:,i) / X_std(i);
end

% X1 = x(:,1); % Gaussian
% X2 = x(:,2); % Guassian
% X3 = x(:,3); % Uniform
% X4 = x(:,4); % Uniform
% X5 = x(:,5); % Uniform
% 
% figure(1);gplotmatrix(x,Y);
% figure(2);gplotmatrix(X,Y);

end