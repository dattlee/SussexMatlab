function output = mdl_reg_rbf(X, centers, weights)

phi = pdist2(centers,X);
output = (weights'*phi)';

end