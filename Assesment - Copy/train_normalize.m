function [X, X_avg, X_std] = train_normalize(X)
% Scales features by
%
% x =  x-mean(x_feature)/standardDeviation
%
% Input data must be of dimentions [m * n] 
%   where m is the number of training examples/data and,
%   n is the number of features

X_avg = mean(X);
X_std = std(X);

for i = 1:size(X,2)
    X(:,i) = X(:,i) - X_avg(i);
    X(:,i) = X(:,i) / X_std(i);
end

end