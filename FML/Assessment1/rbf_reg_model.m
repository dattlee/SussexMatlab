function output = rbf_reg_model(X, centers, weights)

phi = pdist2(centers,X);
output = (weights'*phi)';

end