function [mdl_avg, mdl_std, mdl_weights, mdl_centers] = train_mdl_reg(X, Y, lambda,sigma)

X = X(:,[1 2]);

[X, mdl_avg, mdl_std] = train_normalize(X);

[mdl_weights, mdl_centers] = train_rbf_reg(X, Y, lambda,sigma);

end
