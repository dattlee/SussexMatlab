% RBF Implementation
function [output, C, W] = rbf(X, Y, k, imp, sigma)
% X = preprocessed data
% Y = target outputs
% k = number of centers
% imp = type of rbf to perfom
% sigma = value of sigma if using guassian implementation

if strcmp(imp, 'Linear')
    [clustering,C] = kmeans(X,k);
    G = pdist2(C,X);
elseif strcmp(imp, 'Gaussian')
    % Gaussian
    [clustering,C] = kmeans(X,k);
    G = pdist2(C,X);
    G = (exp(-(G).^2)/(2*sigma^2));
elseif strcmp(imp, 'Regularized')

end


W = pinv(G')*Y;

% W =

%W = inv(G'*G + lambda*eye(size(X,2)))*G'*Y;

output = W'*G;

end
