% RBF Implementation
function [W, C] = rbf_reg_weight(X, Y, lambda)
% X = preprocessed data, and centers
% Y = target outputs
% k = number of centers
% imp = type of rbf to perfom
% sigma = value of sigma if using guassian implementation

G = pdist2(X,X); % This function determines the Euclidian Norms

C = X;
W = inv(G' * G + lambda * eye(size(X,1)))*G'*Y;
end
