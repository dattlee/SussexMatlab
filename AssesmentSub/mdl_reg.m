function predictions = mdl_reg(X, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma)

X = X(:,[1 2]);

X = mdl_normalize(X,mdl_avg,mdl_std);

predictions = mdl_reg_rbf(X, mdl_centers, mdl_weights);

end
