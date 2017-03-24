% RBF Implementation
function [W, C] = train_rbf_reg(X, Y, lambda,sigma)
% X = preprocessed data, and centers
% Y = target outputs
% k = number of centers
% imp = type of rbf to perfom
% sigma = value of sigma if using guassian implementation

phi = pdist2(X,X); % This function determines the Euclidian Norms
% Gaussian
% phi = exp(-(phi.^2)/(2*(sigma.^2)));

C = X;
W = inv(phi' * phi + lambda * eye(size(X,1)))*phi'*Y;
end
