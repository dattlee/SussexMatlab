function [mdl_avg, mdl_std, mdl_weights, mdl_centers] = train_mdl_reg(X, Y, lambda,sigma)

X = X(:,[1 2]);

% Normalizes all feature of X and returns the mean and standdard deviation
[X, mdl_avg, mdl_std] = train_normalize(X);

% Trains the model of a regularized RBF (performing exact interpolation)
% and returns the weights and centers
[mdl_weights, mdl_centers] = train_rbf_reg(X, Y, lambda,sigma);

end
