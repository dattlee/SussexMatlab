function [mdl_avg, mdl_std, mdl_weights, mdl_centers, whMat] = train_mdl_reg(X, Y, lambda,sigma)

X = X(:,[1 2]);

[X, mdl_avg, mdl_std] = train_normalize(X);

[Xwh, mu, invMat, whMat] = whiten(X);

[mdl_weights, mdl_centers] = train_rbf_reg(Xwh, Y, lambda,sigma);

end
