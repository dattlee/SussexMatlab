% RBF Implementation
function [weights, centers, sigma] = train_rbf_gaus(X, Y, M)
% X = preprocessed data, and centers
% Y = target outputs
% M = number of centers
% imp = type of rbf to perfom
% sigma = value of sigma if using guassian implementation

[~, k] = kmeans(X, M);

phi = pdist2(k,X); % This function determines the Euclidian Norms

% Gaussian Interpolation
sigma = max(max(pdist2(k,k)))/sqrt(2*M);
phi = exp(-(phi.^2)/(2*(sigma.^2)));

centers = k;
weights = pinv(phi)'*Y;
end
