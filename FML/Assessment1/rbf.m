% RBF Implementation
function [output, C, W] = rbf(X, Y, k, imp, sigma)
% X = preprocessed data
% Y = target outputs
% k = number of centers
% imp = type of rbf to perfom
% sigma = value of sigma if using guassian implementation

[clustering,C] = kmeans(X,k);

% Linear
G = pdist2(C,X); % This function determines the Euclidian Norms
if strcmp(imp, 'Linear')
    'linear';
elseif strcmp(imp, 'Gaussian')
    % Gaussian
    G = (exp(-(G).^2)/(2*sigma^2));

elseif strcmp(imp, 'Multiquadratic')
    % Multiquadratic
    %G = (exp(-(G).^2)/(2*sigma^2));

elseif  strcmp(imp, 'InverseMultiquadratic')
    % Inverse Multiquadratic
    %G = (exp(-(G).^2)/(2*sigma^2));
end


W = pinv(G')*Y;

% W =

%W = inv(G'*G + lambda*eye(size(X,2)))*G'*Y;

output = W'*G;

end
