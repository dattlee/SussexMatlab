function [whMat, sigma, mdl_weights, mdl_centers] = train_mdl_gaus(X, Y, M)
% Select features 1 and 2
X = X(:,[1 2]);

% Normalizes all feature of X and returns the mean and standdard deviation
[Xwh, mu, invMat, whMat] = whiten(X);

% Trains the model of a regularized RBF (performing exact interpolation)
% and returns the weights and centers
[mdl_weights, mdl_centers, sigma] = train_rbf_gaus(Xwh, Y, M);

end
