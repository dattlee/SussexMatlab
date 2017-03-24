function output = mdl_reg_rbf(X, centers, weights,sigma)

phi = pdist2(centers,X);
% phi = exp(-(phi.^2)/(2*(sigma.^2)));
output = (weights'*phi)';

end