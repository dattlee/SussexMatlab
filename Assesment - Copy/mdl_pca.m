covariance = cov(X_norm)
[U2,S2,V2] = svd(covariance);

% [u,v] = eig(cov(X_norm))

Xi = X_norm(:,1:2);
% Find the covariance matrix (sigma)
Sigma = (X'*X)/size(X,1)
Sigma1 = cov(Xi)

% compute eigenvectors of the covarience matrix (sigma)
[U,S,V] = svd(Sigma)
[U1,S1,V1] = svd(Sigma1)
%can also use
% U = eig(Sigma)
k = 1; % Number of dimentions to keep
Ureduce = U(:,1:k)
z = Ureduce' * Xi'

% 1 - (Sum of 'k' S values)/(Sum of S values) must be smaller than 0.01 to retain 99% of data
% So don't use PCA

Sigma = (data'*data)/size(data,1)
[U,S,V] = svd(Sigma)