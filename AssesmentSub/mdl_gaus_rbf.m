function output = mdl_gaus_rbf(X, centers, weights,sigma)

phi = pdist2(centers,X); % This function determines the Euclidian Norms

% Gaussian Interpolation
phi = exp(-(phi.^2)/(2*(sigma.^2)));
output = (weights'*phi)';

end